//!Implementation of [`TaskManager`]
use super::TaskControlBlock;
use alloc::collections::VecDeque;
use alloc::sync::Arc;
use hashbrown::HashMap;
use lazy_static::*;
use spin::{Mutex, MutexGuard, RwLock};
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
    pub fn ready_procs_num(&self) -> usize {
        self.ready_queue.len()
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
pub fn ready_procs_num() -> usize {
    TASK_MANAGER.lock().ready_procs_num()
}

lazy_static! {
    pub static ref PID2TCB: RwLock<HashMap<usize, Arc<TaskControlBlock>>> =
        RwLock::new(HashMap::new());
}

pub fn pid2task(pid: usize) -> Option<Arc<TaskControlBlock>> {
    let map = PID2TCB.read();
    map.get(&pid).map(Arc::clone)
}

pub fn insert_into_pid2task(pid: usize, task: Arc<TaskControlBlock>) {
    PID2TCB.write().insert(pid, task);
}

pub fn remove_from_pid2task(pid: usize) {
    let mut map = PID2TCB.write();
    if map.remove(&pid).is_none() {
        panic!("cannot find pid {} in PID2TCB!", pid);
    }
}

pub fn task_num() -> usize {
    let map = PID2TCB.read();
    map.len()
}
