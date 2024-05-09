//! memory related syscall

use log::debug;

use crate::{
    config::mm::PAGE_SIZE,
    fs::{flush_preload, File, FileClass},
    mm::{flush_tlb, MapPermission, VirtAddr},
    task::current_task,
    utils::page_round_up,
};

use super::{MmapFlags, MmapProt};

pub fn sys_mmap(addr: usize, len: usize, prot: u32, flags: u32, fd: usize, off: usize) -> isize {
    let map_perm: MapPermission = MmapProt::from_bits(prot).unwrap().into();
    let flags = MmapFlags::from_bits(flags).unwrap();
    // 地址合法性
    if flags.contains(MmapFlags::MAP_FIXED) && addr == 0 {
        return -1;
    }
    debug!(
        "[sys_mmap]: start...  addr {:#x}, len {:#x}, fd {}, offset {:#x}, flags {:?}, prot {:?}",
        addr, len, fd, off, flags, map_perm
    );
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let len = page_round_up(len);
    if fd == usize::MAX {
        return task_inner
            .memory_set
            .mmap(addr, len, map_perm, flags, None, off) as isize;
    }
    // check fd and map_permission
    let file;
    if let Some(FileClass::File(f)) = &task_inner.fd_table[fd] {
        file = f.clone();
    } else {
        unreachable!();
    }
    // 读写权限
    if (map_perm.contains(MapPermission::R) && !file.readable()
        || flags.contains(MmapFlags::MAP_SHARED)
            && map_perm.contains(MapPermission::W)
            && !file.writable())
    {
        return -1;
    }
    task_inner
        .memory_set
        .mmap(addr, len, map_perm, flags, Some(file), off) as isize
}

pub fn sys_munmap(addr: usize, len: usize) -> isize {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let len = page_round_up(len);
    task_inner.memory_set.munmap(addr, len);
    0
}

pub fn sys_mprotect(addr: usize, len: usize, prot: u32) -> isize {
    println!("此调用尚未验证正确性，验证后会删除此条输出！");
    if (addr % PAGE_SIZE != 0) || (len % PAGE_SIZE != 0) {
        println!("sys_mprotect: not align");
        return -1;
    }
    let map_perm: MapPermission = MmapProt::from_bits(prot).unwrap().into();
    let task = current_task().unwrap();
    let memory_set = &mut task.inner_lock().memory_set;
    let start_vpn = addr / PAGE_SIZE;
    let end_vpn = (addr + len) / PAGE_SIZE;
    let page_num = len / PAGE_SIZE;
    //修改各段的mappermission
    let pte_flags = memory_set.mprotect(start_vpn.into(), end_vpn.into(), map_perm);
    for i in 0..page_num {
        memory_set.page_table.set_flags(start_vpn.into(), pte_flags);
    }
    flush_tlb();
    0
}
