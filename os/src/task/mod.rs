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
mod manager;
mod processor;
mod switch;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
mod task;
mod tid;

use crate::fs::{open_file, OpenFlags};
use crate::mm::activate_kernel_space;
use crate::sbi::shutdown;
use alloc::boxed::Box;
use alloc::sync::Arc;
pub use context::TaskContext;
use lazy_static::*;
use log::{debug, info};
pub use manager::{add_task, fetch_task, lock_task_manager, TaskManager};
use switch::__switch;
use task::{TaskControlBlock, TaskStatus};

pub use aux::*;
pub use processor::{
    current_task, current_trap_cx, current_user_token, run_tasks, schedule, take_current_task,
    Processor, PROCESSORS,
};
pub use tid::{tid_alloc, KernelStack, TidAllocator, TidHandle};

use self::processor::{get_proc_by_hartid, take_current_token};
/// Suspend the current 'Running' task and run the next task in task list.
pub fn suspend_current_and_run_next() {
    // There must be
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

/// Exit the current 'Running' task and run the next task in task list.
pub fn exit_current_and_run_next(exit_code: i32) {
    let mut initproc_inner = INITPROC.inner_lock();
    // take from Processor
    let task = take_current_task().unwrap();
    let _ = take_current_token();
    debug!(
        "[sys_exit] process {} ,thread {} exit! exit_code={}",
        task.pid(),
        task.tid(),
        exit_code
    );
    let pid = task.pid();
    if pid == IDLE_PID {
        println!(
            "[kernel] Idle process exit with exit_code {} ...",
            exit_code
        );
        if exit_code != 0 {
            //crate::sbi::shutdown(255); //255 == -1 for err hint
            shutdown(true)
        } else {
            //crate::sbi::shutdown(0); //0 for success hint
            shutdown(false)
        }
    }

    // **** access current TCB exclusively
    // let mut inner = task.inner_exclusive_access();
    let mut inner = task.inner_lock();
    // Change status to Zombie
    inner.task_status = TaskStatus::Zombie;
    // Record exit code
    inner.exit_code = exit_code;
    // do not move to its parent but under initproc

    // ++++++ access initproc TCB exclusively
    {
        for child in inner.children.iter() {
            child.inner_lock().parent = Some(Arc::downgrade(&INITPROC));
            initproc_inner.children.push(child.clone());
        }
        drop(initproc_inner);
    }
    // ++++++ release parent PCB

    inner.children.clear();
    // deallocate user space
    inner.memory_set.recycle_data_pages();
    drop(inner);
    // **** release current PCB
    // drop task manually to maintain rc correctly
    drop(task);
    // we do not have to save task context
    let mut _unused = TaskContext::zero_init();
    schedule(&mut _unused as *mut _);
}

lazy_static! {
    ///Globle process that init user shell
    pub static ref INITPROC: Arc<TaskControlBlock> = Arc::new({
        let inode = open_file("initproc", OpenFlags::O_RDONLY).unwrap();
        let v = inode.read_all();
        let mut res=TaskControlBlock::new(v.as_slice());
        res.inner_lock().file=Some(inode.clone());
        res
    });
}
///Add init process to the manager
pub fn add_initproc() {
    add_task(INITPROC.clone());
}
///Init PROCESSORS
pub fn init() {
    unsafe {
        for (id, p) in PROCESSORS.iter_mut().enumerate() {
            p.idle_task_cx = Some(Box::new(TaskContext::zero_init()));
            p.hartid = id;
        }
    }
}
