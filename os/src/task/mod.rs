//! Task management implementation
//!
//! Everything about task management, like starting and switching tasks is
//! implemented here.
//!
//! A single global instance of [`TaskManager`] called `TASK_MANAGER` controls
//! all the tasks in the whole operating system.
//!
//! A single global instance of [`Processor`] called `PROCESSOR` monitors running
//! task(s) for each core.
//!
//! A single global instance of [`PidAllocator`] called `PID_ALLOCATOR` allocates
//! pid for user apps.
//!
//! Be careful when you see `__switch` ASM function in `switch.S`. Control flow around this function
//! might not be what you expect.
mod aux;
mod context;
pub mod manager;
pub mod processor;
mod switch;
mod sysinfo;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
mod task;
mod tid;

use crate::{
    fs::{open, remove_inode_idx, root_inode, FileClass, OpenFlags},
    signal::{send_signal_to_thread_group, SigSet},
};
use alloc::{boxed::Box, format, sync::Arc};
pub use context::TaskContext;
use lazy_static::*;
use log::debug;
pub use manager::*;
use switch::__switch;
pub use sysinfo::Sysinfo;
pub use task::{TaskControlBlock, TaskStatus};

pub use aux::*;
pub use processor::{
    current_task, current_token, current_trap_cx, get_proc_by_hartid, run_tasks, schedule,
    take_current_task, Processor, PROCESSORS,
};
pub use tid::{tid_alloc, KernelStack, TidAllocator, TidHandle};

/// Suspend the current 'Running' task and run the next task in task list.
pub fn suspend_current_and_run_next() {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let task_cx_ptr = &mut task_inner.task_cx as *mut TaskContext;
    // Change status to Ready
    task_inner.task_status = TaskStatus::Ready;
    // ---- release current PCB
    drop(task_inner);
    drop(task);
    // jump to scheduling cycle
    schedule(task_cx_ptr);
}

/// pid of usertests app in make run TEST=1
pub const IDLE_PID: usize = 0;

/// 杀死当前线程组的所有线程
pub fn exit_current_group_and_run_next(exit_code: i32) {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let sig_pending = task_inner.sig_pending.get_mut();
    let mut exit_code = exit_code;
    if sig_pending.group_exit_code.is_none() {
        //设置进程的SIGNAL_GROUP_EXIT标志并把终止代号放到current->signal->group_exit_code字段
        sig_pending.group_exit_code = Some(exit_code);
        let pid = task.pid();
        drop(task_inner);
        drop(task);
        send_signal_to_thread_group(pid, SigSet::SIGKILL);
    } else {
        exit_code = sig_pending.group_exit_code.unwrap();
        drop(task_inner);
        drop(task);
    }

    exit_current_and_run_next(exit_code);
}

pub fn exit_current_and_run_next(exit_code: i32) {
    let task = take_current_task().unwrap();
    let mut inner = task.inner_lock();
    debug!("[sys_exit] thread {}", task.tid());

    // 无论如何一个轻量级进程都会是一个线程
    // 释放线程相关资源
    remove_from_tid2task(task.tid());
    inner.dealloc_user_res();
    inner.task_status = TaskStatus::Zombie;

    drop(inner);

    // 一个进程的所有线程都退出了,此时回收资源
    {
        let thread_group = THREAD_GROUP.lock();
        if let Some(tasks) = thread_group.get(&task.pid()) {
            if tasks.iter().all(|task| task.inner_lock().is_zombie()) {
                drop(thread_group);
                let inner = task.inner_lock();
                inner.memory_set.recycle_data_pages();
                if inner.sig_pending.get_mut().group_exit_code.is_none() {
                    inner.sig_pending.get_mut().group_exit_code = Some(exit_code);
                }

                // 删除进程的专属目录
                root_inode().unlink(format!("/proc/{}/cmdline", task.pid()).as_str());
                remove_inode_idx(format!("/proc/{}/cmdline", task.pid()).as_str());
                root_inode().unlink(format!("/proc/{}/stat", task.pid()).as_str());
                remove_inode_idx(format!("/proc/{}/stat", task.pid()).as_str());
                root_inode().unlink(format!("/proc/{}", task.pid()).as_str());
                remove_inode_idx(format!("/proc/{}", task.pid()).as_str());
                debug!("remove /proc/{}/* and /proc/{}", task.pid(), task.pid());
            }
        }
    }

    drop(task);
    let mut _unused = TaskContext::zero_init();
    schedule(&mut _unused as *mut _);
}

lazy_static! {
    ///Globle process that init user shell
    pub static ref INITPROC: Arc<TaskControlBlock> = Arc::new({
        let initproc= open("/initproc", OpenFlags::O_RDONLY).expect("open initproc error!").file().expect("initproc can not be abs file!");
        let elf_data = initproc.inode.read_all().unwrap();
        let res=TaskControlBlock::new(&elf_data);
        res
    });
}
///Add init process to the manager
pub fn add_initproc() {
    add_task(INITPROC.clone());

    insert_into_tid2task(0, &INITPROC);
    insert_into_thread_group(0, &INITPROC);
}
///Init PROCESSORS
pub fn init() {
    unsafe {
        for p in PROCESSORS.iter_mut() {
            p.idle_task_cx = Some(Box::new(TaskContext::zero_init()));
        }
    }
}
