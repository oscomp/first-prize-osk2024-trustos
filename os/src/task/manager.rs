//!Implementation of [`TaskManager`]
use super::{TaskControlBlock, TaskStatus, INITPROC};
use alloc::collections::{BTreeMap, VecDeque};
use alloc::sync::Arc;
use alloc::vec::Vec;
use lazy_static::*;
use log::info;
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
    pub fn ready_procs_num(&self) -> usize {
        self.ready_queue.len()
    }
    pub fn wakeup_parent(&mut self, pid: usize) {
        let idx = self
            .ready_queue
            .iter()
            .enumerate()
            .find(|(_, task)| {
                task.pid() == pid && task.inner_lock().task_status == TaskStatus::Ready
            })
            .map(|(idx, _)| idx);
        if let Some(idx) = idx {
            // info!("wake up parent {}", pid);
            let p = self.ready_queue.remove(idx).unwrap();
            self.ready_queue.push_front(p);
        } else {
            // info!("no parent pid=={}", pid);
            // 父进程已被回收,被添加到了initproc下
            if pid != 0 {
                self.wakeup_parent(0);
            }
        }
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
pub fn wakeup_parent(pid: usize) {
    TASK_MANAGER.lock().wakeup_parent(pid);
}
///Lock TaskManager
pub fn lock_task_manager() -> MutexGuard<'static, TaskManager> {
    TASK_MANAGER.lock()
}
pub fn ready_procs_num() -> usize {
    TASK_MANAGER.lock().ready_procs_num()
}
lazy_static! {
    pub static ref TID_TO_TASK: Mutex<BTreeMap<usize, Arc<TaskControlBlock>>> =
        Mutex::new(BTreeMap::new());
}

pub fn tid2task(tid: usize) -> Option<Arc<TaskControlBlock>> {
    match TID_TO_TASK.lock().get(&tid) {
        Some(task) => Some(task.clone()),
        None => None,
    }
}

pub fn insert_into_tid2task(tid: usize, task: &Arc<TaskControlBlock>) {
    TID_TO_TASK.lock().insert(tid, task.clone());
}

pub fn remove_from_tid2task(tid: usize) {
    TID_TO_TASK.lock().remove(&tid);
}

pub fn task_num() -> usize {
    TID_TO_TASK.lock().len()
}

lazy_static! {
    /// 线程组
    pub static ref THREAD_GROUP: Mutex<BTreeMap<usize, Vec<Arc<TaskControlBlock>>>> =
        Mutex::new(BTreeMap::new());
}

pub fn insert_into_thread_group(pid: usize, task: &Arc<TaskControlBlock>) {
    THREAD_GROUP
        .lock()
        .entry(pid)
        .or_insert_with(Vec::new)
        .push(task.clone());
}
/// 删除整个线程组,同时将线程从tid2task移除
pub fn remove_all_from_thread_group(pid: usize) {
    THREAD_GROUP.lock().remove(&pid);
}

lazy_static! {
    /// 需要持有Arc,避免进程在exit时被释放,等待到wait释放进程
    /// 一个进程组实际上是一个进程的所有子进程
    pub static ref PROCESS_GROUP: Mutex<BTreeMap<usize, Vec<Arc<TaskControlBlock>>>> =
        Mutex::new(BTreeMap::new());
}

pub fn insert_into_process_group(ppid: usize, task: &Arc<TaskControlBlock>) {
    PROCESS_GROUP
        .lock()
        .entry(ppid)
        .or_insert_with(Vec::new)
        .push(Arc::clone(task));
}

pub fn remove_from_process_group(ppid: usize, pid: usize) {
    let mut inner = PROCESS_GROUP.lock();
    if let Some(tasks) = inner.get_mut(&ppid) {
        tasks.retain(|x| x.pid() != pid);
        if tasks.is_empty() {
            inner.remove(&ppid);
        }
    }
}

pub fn move_child_process_to_init(ppid: usize) {
    let mut inner = PROCESS_GROUP.lock();
    if let Some(tasks) = inner.remove(&ppid) {
        let init_childer = inner.get_mut(&INITPROC.pid()).unwrap();
        for child in tasks {
            init_childer.push(child);
        }
    }
}

pub fn wakeup_task(task: Arc<TaskControlBlock>) {
    let mut task_inner = task.inner_lock();
    task_inner.task_status = TaskStatus::Ready;
    drop(task_inner);
    add_task(task);
}
