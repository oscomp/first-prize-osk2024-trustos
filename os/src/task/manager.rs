//!Implementation of [`TaskManager`]
use super::{tid, TaskControlBlock};
use alloc::collections::{BTreeMap, VecDeque};
use alloc::sync::{Arc, Weak};
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

pub struct TaskMonitor {
    tid_to_task: BTreeMap<usize, Weak<TaskControlBlock>>,
}

impl TaskMonitor {
    pub fn new() -> Self {
        Self {
            tid_to_task: BTreeMap::new(),
        }
    }
    pub fn add(&mut self, tid: usize, task: &Arc<TaskControlBlock>) {
        self.tid_to_task.insert(tid, Arc::downgrade(task));
    }
    pub fn remove(&mut self, tid: usize) {
        self.tid_to_task.remove(&tid);
    }
    pub fn get(&self, tid: usize) -> Option<Arc<TaskControlBlock>> {
        match self.tid_to_task.get(&tid) {
            Some(task) => task.upgrade(),
            None => None,
        }
    }
}

lazy_static! {
    pub static ref TASK_MONITOR: Mutex<TaskMonitor> = Mutex::new(TaskMonitor::new());
}
