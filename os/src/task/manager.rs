//!Implementation of [`TaskManager`]
use super::TaskControlBlock;
use alloc::collections::VecDeque;
use alloc::sync::Arc;
use lazy_static::*;
use spin::{Mutex, MutexGuard};
///A array of `TaskControlBlock` that is thread-safe
pub struct TaskManager {
    ready_queue: VecDeque<Arc<TaskControlBlock>>,
}

/// A simple FIFO scheduler.
impl TaskManager {
    ///Creat an empty TaskManager
    pub fn new() -> Self {
        Self {
            ready_queue: VecDeque::new(),
        }
    }
    ///Add a task to `TaskManager`
    pub fn add(&mut self, task: Arc<TaskControlBlock>) {
        self.ready_queue.push_back(task);
    }
    ///Remove the first task and return it,or `None` if `TaskManager` is empty
    pub fn fetch(&mut self) -> Option<Arc<TaskControlBlock>> {
        self.ready_queue.pop_front()
    }
    pub fn is_empty(&self) -> bool {
        self.ready_queue.is_empty()
    }
    pub fn find_pid_change_kindcpu(&self, pid: usize, kindcpu: isize) -> isize {
        for item in self.ready_queue.iter() {
            if item.pid() == pid {
                item.inner_lock().kind_cpu = kindcpu;
                return 0;
            }
        }
        -1
    }
    pub fn find_pid_get_kindcpu(&self, pid: usize) -> isize {
        for item in self.ready_queue.iter() {
            if item.pid() == pid {
                return item.inner_lock().kind_cpu;
            }
        }
        -1
    }
}

lazy_static! {
    pub static ref TASK_MANAGER: Mutex<TaskManager> = Mutex::new(TaskManager::new());
}
///Interface offered to add task
pub fn add_task(task: Arc<TaskControlBlock>) {
    TASK_MANAGER.lock().add(task);
}
///Interface offered to pop the first task
pub fn fetch_task() -> Option<Arc<TaskControlBlock>> {
    TASK_MANAGER.lock().fetch()
}
///Lock TaskManager
pub fn lock_task_manager() -> MutexGuard<'static, TaskManager> {
    TASK_MANAGER.lock()
}
pub fn find_pid_change_kindcpu(pid: usize, kindcpu: isize) -> isize {
    TASK_MANAGER.lock().find_pid_change_kindcpu(pid, kindcpu)
}
pub fn find_pid_get_kindcpu(pid: usize) -> isize {
    TASK_MANAGER.lock().find_pid_get_kindcpu(pid)
}
