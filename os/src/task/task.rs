//!Implementation of [`TaskControlBlock`]
use super::{pid_alloc, KernelStack, PidHandle, TaskContext};
use crate::{
    config::mm::USER_TRAP_CONTEXT, fs::{File, Stdin, Stdout}, mm::{MapAreaType, MapPermission, MemorySet, PhysPageNum, VirtAddr}, timer::TimeData, trap::{trap_handler, TrapContext}
};
use alloc::{
    sync::{Arc, Weak},
    vec,
    vec::Vec,
};
use core::cell::RefMut;
use log::{debug, info};
use spin::{Mutex, MutexGuard};



pub struct TaskControlBlock {
    // immutable
    pub pid: PidHandle,
    pub kernel_stack: KernelStack,
    // mutable
    inner: Mutex<TaskControlBlockInner>,
}

pub struct TaskControlBlockInner {
    pub trap_cx_ppn: PhysPageNum,
    pub base_size: usize,
    pub task_cx: TaskContext,
    pub task_status: TaskStatus,
    pub memory_set: MemorySet,
    pub parent: Option<Weak<TaskControlBlock>>,
    pub children: Vec<Arc<TaskControlBlock>>,
    pub exit_code: i32,
    pub fd_table: Vec<Option<Arc<dyn File + Send + Sync>>>,
    pub current_path: alloc::string::String,
    pub time_data: TimeData,
}

impl TaskControlBlockInner {
    pub fn trap_cx(&self) -> &'static mut TrapContext {
        self.trap_cx_ppn.as_mut()
    }
    pub fn user_token(&self) -> usize {
        self.memory_set.token()
    }
    fn status(&self) -> TaskStatus {
        self.task_status
    }
    pub fn is_zombie(&self) -> bool {
        self.status() == TaskStatus::Zombie
    }
    pub fn alloc_fd(&mut self) -> usize {
        if let Some(fd) = (0..self.fd_table.len()).find(|fd| self.fd_table[*fd].is_none()) {
            fd
        } else {
            self.fd_table.push(None);
            self.fd_table.len() - 1
        }
    }
}

impl TaskControlBlock {
    pub fn inner_lock(&self) -> MutexGuard<TaskControlBlockInner> {
        self.inner.lock()
    }
    pub fn new(elf_data: &[u8]) -> Self {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (mut memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
        debug!("entry point: {:x}", entry_point);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();
        // alloc a pid and a kernel stack in kernel space
        let pid_handle = pid_alloc();
        let kernel_stack = KernelStack::new(&pid_handle);
        let (kernel_stack_bottom, kernel_stack_top) = kernel_stack.pos();
        memory_set.insert_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
        );
        let task_control_block = Self {
            pid: pid_handle,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn,
                base_size: user_sp,
                task_cx: TaskContext::goto_trap_return(kernel_stack_top),
                task_status: TaskStatus::Ready,
                memory_set,
                parent: None,
                children: Vec::new(),
                exit_code: 0,
                fd_table: vec![
                    // 0 -> stdin
                    Some(Arc::new(Stdin)),
                    // 1 -> stdout
                    Some(Arc::new(Stdout)),
                    // 2 -> stderr
                    Some(Arc::new(Stdout)),
                ],
                current_path: alloc::string::String::from("/"),
                time_data: TimeData::new(),
            }),
        };
        // prepare TrapContext in user space
        let trap_cx = task_control_block.inner_lock().trap_cx();
        *trap_cx = TrapContext::app_init_context(
            entry_point,
            user_sp,
            kernel_stack_top,
            trap_handler as usize,
        );
        debug!("create task {}", task_control_block.pid.0);
        task_control_block
    }
    pub fn exec(&self, elf_data: &[u8]) {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (mut memory_set, user_sp, entry_point) = MemorySet::from_elf(elf_data);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();
        // **** access current TCB exclusively
        let mut inner = self.inner_lock();

        inner.time_data.clear();

        // map kernel stack
        let (kernel_stack_bottom, kernel_stack_top) = self.kernel_stack.pos();
        memory_set.insert_given_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
            inner.memory_set.kernel_stack_frame(),
        );
        // substitute memory_set
        inner.memory_set = memory_set;
        // update trap_cx ppn
        inner.trap_cx_ppn = trap_cx_ppn;
        let trap_cx = TrapContext::app_init_context(
            entry_point,
            user_sp,
            self.kernel_stack.top(),
            trap_handler as usize,
        );
        *inner.trap_cx() = trap_cx;
        debug!("task.exec.pid={}", self.pid.0);
        // **** release current PCB
    }
    pub fn fork(self: &Arc<TaskControlBlock>) -> Arc<TaskControlBlock> {
        // ---- hold parent PCB lock
        let mut parent_inner = self.inner_lock();
        // copy user space(include trap context)
        let mut memory_set = MemorySet::from_existed_user(&parent_inner.memory_set);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();
        // alloc a pid and a kernel stack in kernel space
        let pid_handle = pid_alloc();
        let kernel_stack = KernelStack::new(&pid_handle);
        let (kernel_stack_bottom, kernel_stack_top) = kernel_stack.pos();
        memory_set.insert_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
        );
        // copy fd table
        let mut new_fd_table: Vec<Option<Arc<dyn File + Send + Sync>>> = Vec::new();
        for fd in parent_inner.fd_table.iter() {
            if let Some(file) = fd {
                new_fd_table.push(Some(file.clone()));
            } else {
                new_fd_table.push(None);
            }
        }
        let task_control_block = Arc::new(TaskControlBlock {
            pid: pid_handle,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn,
                base_size: parent_inner.base_size,
                task_cx: TaskContext::goto_trap_return(kernel_stack_top),
                task_status: TaskStatus::Ready,
                memory_set,
                parent: Some(Arc::downgrade(self)),
                children: Vec::new(),
                exit_code: 0,
                fd_table: new_fd_table,
                current_path: parent_inner.current_path.clone(),
                time_data: TimeData::new(),
            }),
        });
        // add child
        parent_inner.children.push(task_control_block.clone());
        // modify kernel_sp in trap_cx
        // **** access child PCB exclusively
        // let trap_cx = task_control_block.inner_exclusive_access().trap_cx();
        let trap_cx = task_control_block.inner_lock().trap_cx();
        trap_cx.kernel_sp = kernel_stack_top;
        // return
        task_control_block
        // **** release child PCB
        // ---- release parent PCB
    }
    pub fn getpid(&self) -> usize {
        self.pid.0
    }
}

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Zombie,
}
