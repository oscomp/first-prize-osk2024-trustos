//! memory related syscall

use crate::{mm::VirtAddr, task::current_task};

pub fn sys_mmap(
    addr: usize,
    length: usize,
    prot: u32,
    flags: u32,
    fd: usize,
    offset: usize,
) -> isize {
    0
}

pub fn sys_munmap(addr: usize, length: usize) -> isize {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    task_inner
        .memory_set
        .remove_area_with_start_vpn(VirtAddr::from(addr).into());
    0
}
