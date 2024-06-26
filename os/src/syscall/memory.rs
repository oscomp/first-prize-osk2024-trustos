//! memory related syscall

use log::debug;

use crate::{
    config::mm::PAGE_SIZE,
    fs::{flush_preload, File, FileClass},
    mm::{
        flush_tlb, frame_alloc, frames_alloc_much, FrameTracker, MapArea, MapAreaType,
        MapPermission, MapType, VirtAddr,
    },
    syscall::MapedSharedMemory,
    task::current_task,
    utils::{page_round_up, SysErrNo, SyscallRet},
};
use alloc::sync::Arc;
use alloc::vec::Vec;

use super::{MmapFlags, MmapProt, SharedMemory, ShmGetFlags, SHARED_MEMORY};

pub fn sys_mmap(
    addr: usize,
    len: usize,
    prot: u32,
    flags: u32,
    fd: usize,
    off: usize,
) -> SyscallRet {
    let map_perm: MapPermission = MmapProt::from_bits(prot).unwrap().into();
    let flags = MmapFlags::from_bits(flags).unwrap();
    // 地址合法性
    if flags.contains(MmapFlags::MAP_FIXED) && addr == 0 {
        return Err(SysErrNo::EPERM);
    }
    debug!(
        "[sys_mmap]: start...  addr {:#x}, len {:#x}, fd {}, offset {:#x}, flags {:?}, prot {:?}",
        addr, len, fd, off, flags, map_perm
    );
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let len = page_round_up(len);
    if fd == usize::MAX {
        let rv = task_inner
            .memory_set
            .mmap(addr, len, map_perm, flags, None, off);
        return Ok(rv);
    }
    // check fd and map_permission
    let file = task_inner.fd_table.get_file(fd).file()?;
    // 读写权限
    if (map_perm.contains(MapPermission::R) && !file.readable()
        || flags.contains(MmapFlags::MAP_SHARED)
            && map_perm.contains(MapPermission::W)
            && !file.writable())
    {
        return Err(SysErrNo::EPERM);
    }
    let rv = task_inner
        .memory_set
        .mmap(addr, len, map_perm, flags, Some(file), off);
    Ok(rv)
}

pub fn sys_munmap(addr: usize, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let len = page_round_up(len);
    task_inner.memory_set.munmap(addr, len);
    debug!("[sys_munmap] addr={:#X}, len={}", addr, len);
    Ok(0)
}

pub fn sys_mprotect(addr: usize, len: usize, prot: u32) -> SyscallRet {
    println!("[sys_mprotect] we don't know whether this syscall is correct!");
    debug!(
        "[sys_mprotect] addr is {:x}, len is {}, prot is {}",
        addr, len, prot
    );
    if (addr % PAGE_SIZE != 0) || (len % PAGE_SIZE != 0) {
        println!("sys_mprotect: not align");
        return Err(SysErrNo::EINVAL);
    }
    let map_perm: MapPermission = MmapProt::from_bits(prot).unwrap().into();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let memory_set = &mut inner.memory_set;
    let start_vpn = addr / PAGE_SIZE;
    let end_vpn = (addr + len) / PAGE_SIZE;
    let page_num = len / PAGE_SIZE;
    //修改各段的mappermission
    let pte_flags = memory_set.mprotect(start_vpn.into(), end_vpn.into(), map_perm);
    for i in 0..page_num {
        memory_set
            .get_mut()
            .page_table
            .set_flags(start_vpn.into(), pte_flags);
    }
    flush_tlb();
    Ok(0)
}

pub fn sys_madvise(addr: usize, len: usize, advice: usize) -> SyscallRet {
    //伪实现，该系统调用用于给内存提建议
    debug!(
        "[sys_madvise] addr is {}, len is {}, advice is {}",
        addr, len, advice
    );
    Ok(0)
}

const IPC_PRIVATE: usize = 0;

pub fn sys_shmget(key: usize, size: usize, shmflag: u32) -> SyscallRet {
    debug!(
        "[sys_shmget] key is {}, size is {}, shmflag is {}",
        key, size, shmflag
    );
    let mut key = key;
    if key == 0 {
        key = SHARED_MEMORY.lock().keys().cloned().max().unwrap_or(0) + 1;
    }
    let mem = SHARED_MEMORY.lock().get(&key).cloned();
    if mem.is_some() {
        //println!("return key is {}", key);
        return Ok(key);
    }
    let flag = ShmGetFlags::from_bits_truncate(shmflag as i32);
    if flag.contains(ShmGetFlags::IPC_CREAT) {
        let pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
        let shm: Vec<Arc<FrameTracker>> =
            frames_alloc_much(pages).expect("can't alloc pages in shm");
        SHARED_MEMORY
            .lock()
            .insert(key, Arc::new(SharedMemory::new(shm)));
        //println!("return key2 is {}", key);
        return Ok(key);
    }
    Err(SysErrNo::ENOENT)
}

pub fn sys_shmat(shmid: usize, shmaddr: usize, shmflag: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();

    debug!(
        "[sys_shmat] shmid is {}, shmaddr is {}, shmflag is {}",
        shmid, shmaddr, shmflag
    );

    let trackers = SHARED_MEMORY.lock().get(&shmid).cloned();
    if trackers.is_none() {
        return Err(SysErrNo::ENOENT);
    }
    //映射frames
    let size = trackers.as_ref().unwrap().trackers.len() * PAGE_SIZE;
    let (start_va, end_va) = if shmaddr == 0 {
        task_inner.memory_set.alloc_addr_va(size)
    } else {
        (VirtAddr::from(shmaddr), VirtAddr::from(shmaddr + size))
    };
    task_inner.memory_set.map_given_frames(
        MapArea::new(
            start_va,
            end_va,
            MapType::Framed,
            MapPermission::all(),
            MapAreaType::Shm,
        ),
        trackers.as_ref().unwrap().trackers.clone(),
    );
    //将共享内存段存入task中
    task_inner.shms.push(MapedSharedMemory {
        key: shmid,
        mem: trackers.unwrap(),
        start: start_va.into(),
        end: end_va.into(),
        size,
    });
    Ok(start_va.into())
}

const IPCRMID: usize = 0;

pub fn sys_shmctl(shmid: usize, cmd: usize, buf: usize) -> SyscallRet {
    //用于控制共享内存
    debug!(
        "[sys_shmctl] shmid is {}, cmd is {}, buf is {}",
        shmid, cmd, buf
    );

    match cmd {
        IPCRMID => {
            if let Some(map) = SHARED_MEMORY.lock().get_mut(&shmid) {
                *map.deleted.lock() = true;
            }
            return Ok(0);
        }
        _ => return Err(SysErrNo::EINVAL),
    }
}
