//!Implementation of [`PidAllocator`]
use crate::config::mm::{KERNEL_STACK_SIZE, KSTACK_TOP, PAGE_SIZE};
use alloc::vec::Vec;
use lazy_static::*;
use log::debug;
use spin::Mutex;
///Pid Allocator struct
pub struct TidAllocator {
    current: usize,
    recycled: Vec<usize>,
}

impl TidAllocator {
    ///Create an empty `TidAllocator`
    pub fn new() -> Self {
        TidAllocator {
            current: 0,
            recycled: Vec::new(),
        }
    }
    ///Allocate a tid
    pub fn alloc(&mut self) -> TidHandle {
        if let Some(tid) = self.recycled.pop() {
            TidHandle(tid)
        } else {
            self.current += 1;
            TidHandle(self.current - 1)
        }
    }
    ///Recycle a tid
    pub fn dealloc(&mut self, tid: usize) {
        assert!(tid < self.current);
        assert!(
            !self.recycled.iter().any(|ttid| *ttid == tid),
            "pid {} has been deallocated!",
            tid
        );
        self.recycled.push(tid);
    }
}

lazy_static! {
    pub static ref TID_ALLOCATOR: Mutex<TidAllocator> = Mutex::new(TidAllocator::new());
}
///Bind pid lifetime to `TidHandle`
pub struct TidHandle(pub usize);

impl Drop for TidHandle {
    fn drop(&mut self) {
        TID_ALLOCATOR.lock().dealloc(self.0);
    }
}
///Allocate a pid from PID_ALLOCATOR
pub fn tid_alloc() -> TidHandle {
    TID_ALLOCATOR.lock().alloc()
}

/// Return (bottom, top) of a kernel stack in kernel space.
pub fn kernel_stack_position(app_id: usize) -> (usize, usize) {
    let top = KSTACK_TOP - app_id * (KERNEL_STACK_SIZE + PAGE_SIZE);
    let bottom = top - KERNEL_STACK_SIZE;
    (bottom, top)
}
///Kernelstack for app
pub struct KernelStack {
    tid: usize,
}

impl KernelStack {
    ///Create a kernelstack from pid
    pub fn new(tid_handle: &TidHandle) -> Self {
        // let tid = tid_handle.0;
        // let (kernel_stack_bottom, kernel_stack_top) = kernel_stack_position(tid);
        // debug!(
        //     "kernel stack pos [{:#x},{:#x})",
        //     kernel_stack_bottom, kernel_stack_top
        // );
        KernelStack { tid: tid_handle.0 }
    }
    #[allow(unused)]
    ///Push a value on top of kernelstack
    pub fn push_on_top<T>(&self, value: T) -> *mut T
    where
        T: Sized,
    {
        let kernel_stack_top = self.top();
        let ptr_mut = (kernel_stack_top - core::mem::size_of::<T>()) as *mut T;
        unsafe {
            *ptr_mut = value;
        }
        ptr_mut
    }
    ///Get the value on the top of kernelstack
    pub fn top(&self) -> usize {
        let (_, kernel_stack_top) = kernel_stack_position(self.tid);
        kernel_stack_top
    }
    /// Return (bottom, top) of a kernel stack in kernel space.)
    pub fn pos(&self) -> (usize, usize) {
        kernel_stack_position(self.tid)
    }
}
