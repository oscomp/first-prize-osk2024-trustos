use crate::{
    mm::PhysAddr,
    utils::{SysErrNo, SyscallRet},
};

use super::{block_current_and_run_next, current_task, wakeup_task, TaskControlBlock};
use alloc::{
    collections::{BTreeMap, VecDeque},
    sync::{Arc, Weak},
    vec::Vec,
};
use lazy_static::*;
use log::debug;
use spin::Mutex;

type WaitQueue = VecDeque<Weak<TaskControlBlock>>;
lazy_static! {
    pub static ref FUTEX_LIST: Mutex<BTreeMap<PhysAddr, WaitQueue>> = Mutex::new(BTreeMap::new());
}

pub fn futex_wait(pa: PhysAddr) -> SyscallRet {
    let mut waitq = FUTEX_LIST.lock();
    let current = current_task().unwrap();
    if let Some(queue) = waitq.get_mut(&pa) {
        queue.push_back(Arc::downgrade(&current));
    } else {
        waitq.insert(pa, {
            let mut queue = VecDeque::new();
            queue.push_back(Arc::downgrade(&current));
            queue
        });
    }
    debug!("[futex_wait] blocked!");
    drop(current);
    drop(waitq);
    block_current_and_run_next();
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    // woke by signal
    if !task_inner
        .sig_pending
        .difference(task_inner.sig_mask)
        .is_empty()
    {
        return Err(SysErrNo::EINTR);
    }
    Ok(0)
}

pub fn futex_wake_up(pa: PhysAddr, max_num: i32) -> usize {
    let mut num = 0;
    let mut list = FUTEX_LIST.lock();
    if let Some(queue) = list.get_mut(&pa) {
        loop {
            if num >= max_num as usize {
                break;
            }
            if let Some(weak_task) = queue.pop_front() {
                if let Some(task) = weak_task.upgrade() {
                    wakeup_task(task);
                    num += 1;
                }
            } else {
                break;
            }
        }
    }
    drop(list);
    num
}

pub fn futex_requeue(pa: PhysAddr, max_num: i32, pa2: PhysAddr, max_num2: i32) -> usize {
    let mut num = 0;
    let mut num2 = 0;
    let mut list = FUTEX_LIST.lock();
    let mut tmp = Vec::new();
    if let Some(queue) = list.get_mut(&pa) {
        while let Some(weak_task) = queue.pop_front() {
            if let Some(task) = weak_task.upgrade() {
                if num < max_num as usize {
                    wakeup_task(task);
                    num += 1;
                } else if num2 < max_num2 {
                    tmp.push(task);
                    num2 += 1;
                }
            }
        }
    }
    if let Some(queue2) = list.get_mut(&pa2) {
        for task in tmp {
            queue2.push_back(Arc::downgrade(&task));
        }
    }
    drop(list);
    num
}
