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
mod context;
mod manager;
mod pid;
mod processor;
mod switch;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
mod task;

use crate::fs::{open_file, OpenFlags};
use crate::sbi::shutdown;
use alloc::boxed::Box;
use alloc::sync::Arc;
pub use context::TaskContext;
use lazy_static::*;
pub use manager::{fetch_task, TaskManager};
use switch::__switch;
use task::{TaskControlBlock, TaskStatus};

pub use manager::add_task;
pub use pid::{pid_alloc, KernelStack, PidAllocator, PidHandle};
pub use processor::{
    current_task, current_trap_cx, current_user_token, run_tasks, schedule, take_current_task,
    Processor, PROCESSORS,
};

use self::processor::get_proc_by_hartid;
/// Suspend the current 'Running' task and run the next task in task list.
pub fn suspend_current_and_run_next() {
    // 该线程上可能没有任务正在运行
    if let Some(task) = take_current_task() {
        // let mut task_inner = task.inner_exclusive_access();
        let mut task_inner = task.lock_inner();
        let task_cx_ptr = &mut task_inner.task_cx as *mut TaskContext;
        // Change status to Ready
        task_inner.task_status = TaskStatus::Ready;
        drop(task_inner);
        // ---- release current PCB

        // push back to ready queue.
        add_task(task);
        // jump to scheduling cycle
        schedule(task_cx_ptr);
    }
    // let task = take_current_task().unwrap();

    // ---- access current TCB exclusively
}

/// pid of usertests app in make run TEST=1
pub const IDLE_PID: usize = 0;

/// Exit the current 'Running' task and run the next task in task list.
pub fn exit_current_and_run_next(exit_code: i32) {
    // take from Processor
    let task = take_current_task().unwrap();

    let pid = task.getpid();
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
    let mut inner = task.lock_inner();
    // Change status to Zombie
    inner.task_status = TaskStatus::Zombie;
    // Record exit code
    inner.exit_code = exit_code;
    // do not move to its parent but under initproc

    // ++++++ access initproc TCB exclusively
    {
        let mut initproc_inner = INITPROC.lock_inner();
        for child in inner.children.iter() {
            child.lock_inner().parent = Some(Arc::downgrade(&INITPROC));
            initproc_inner.children.push(child.clone());
        }
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
        let inode = open_file("initproc", OpenFlags::RDONLY).unwrap();
        let v = inode.read_all();
        TaskControlBlock::new(v.as_slice())
    });
}
///Add init process to the manager
pub fn add_initproc() {
    add_task(INITPROC.clone());
}
///Init PROCESSORS
pub fn init() {
    unsafe {
        // for p in PROCESSORS.iter_mut() {
        //     p.idle_task_cx = Some(Box::new(TaskContext::zero_init()));
        // }
        for (id, p) in PROCESSORS.iter_mut().enumerate() {
            p.idle_task_cx = Some(Box::new(TaskContext::zero_init()));
            p.hartid = id;
        }
    }
    println!("procs init successfully!");
}
