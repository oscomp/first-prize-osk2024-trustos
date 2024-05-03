//! memory related syscall

use log::debug;

use crate::{
    mm::{MapPermission, VirtAddr},
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
    let file = task_inner.fd_table[fd].as_ref().unwrap().clone();
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
