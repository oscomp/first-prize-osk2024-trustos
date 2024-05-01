//!Implementation of [`TaskControlBlock`]
use super::{
    aux::{Aux, AuxType},
    tid_alloc, KernelStack, TaskContext, TidHandle,
};
use crate::{
    config::mm::{USER_HEAP_SIZE, USER_TRAP_CONTEXT},
    fs::{File, RFile, Stdin, Stdout},
    mm::{translated_refmut, MapAreaType, MapPermission, MemorySet, PhysPageNum, VirtAddr},
    timer::TimeData,
    trap::{trap_handler, TrapContext},
};
use alloc::{
    string::String,
    sync::{Arc, Weak},
    vec,
    vec::Vec,
};
use core::{mem::size_of, ptr};
use log::{debug, info};
use spin::{Mutex, MutexGuard};

pub struct TaskControlBlock {
    // immutable
    tid: TidHandle,
    ppid: usize,
    pid: usize,
    pub kernel_stack: KernelStack,
    // mutable
    inner: Mutex<TaskControlBlockInner>,
}

pub struct TaskControlBlockInner {
    pub trap_cx_ppn: PhysPageNum,
    pub user_stack_top: usize, // exclusive
    pub task_cx: TaskContext,
    pub task_status: TaskStatus,
    pub memory_set: MemorySet,
    pub parent: Option<Weak<TaskControlBlock>>,
    pub children: Vec<Arc<TaskControlBlock>>,
    pub exit_code: i32,
    pub fd_table: Vec<Option<Arc<RFile>>>,
    pub file: Option<Arc<RFile>>,
    pub current_path: String,
    pub time_data: TimeData,
    pub user_heappoint: usize,
    pub user_heapbottom: usize,
    pub strace_mask: usize,
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
    pub fn tid(&self) -> usize {
        self.tid.0
    }
    pub fn pid(&self) -> usize {
        self.pid
    }
    pub fn ppid(&self) -> usize {
        self.ppid
    }
    /// 只有initproc会调用
    pub fn new(elf_data: &[u8]) -> Self {
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (mut memory_set, user_sp, user_heapbottom, entry_point, mut auxv) =
            MemorySet::from_elf(elf_data);
        debug!("entry point: {:x}", entry_point);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();
        // alloc a pid and a kernel stack in kernel space
        let tid_handle = tid_alloc();
        let kernel_stack = KernelStack::new(&tid_handle);
        let (kernel_stack_bottom, kernel_stack_top) = kernel_stack.pos();
        memory_set.insert_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
        );
        let task_control_block = Self {
            tid: tid_handle,
            pid: 0,
            ppid: 0,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn,
                user_stack_top: user_sp,
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
                file: None,
                current_path: String::from("/"),
                time_data: TimeData::new(),
                user_heappoint: user_heapbottom,
                user_heapbottom,
                strace_mask: 0,
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
        debug!("create task {}", task_control_block.tid.0);
        task_control_block
    }
    pub fn exec(&self, elf_data: &[u8], argv: &Vec<String>, mut env: &mut Vec<String>) {
        //用户栈高地址到低地址：环境变量字符串/参数字符串/aux辅助向量/环境变量地址数组/参数地址数组/参数数量
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (mut memory_set, mut user_sp, user_hp, entry_point, mut auxv) =
            MemorySet::from_elf(elf_data);
        // println!("user_sp:{:#X}  argv:{:?}", user_sp, argv);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();

        //一些初始的环境变量
        env.push(String::from("SHELL=/user_shell"));
        env.push(String::from("PWD=/"));
        env.push(String::from("HOME=/"));
        env.push(String::from("PATH=/"));

        //环境变量内容入栈
        let mut env_ptr_vec = Vec::new();
        for (i, env) in env.iter().enumerate() {
            user_sp -= env.len() + 1;
            env_ptr_vec.push(user_sp);
            // println!("{:#X}:{}", user_sp, env);
            for (j, c) in env.as_bytes().iter().enumerate() {
                *translated_refmut(memory_set.token(), (user_sp + j) as *mut u8) = *c;
            }
            *translated_refmut(memory_set.token(), (user_sp + env.len()) as *mut u8) = 0;
        }
        user_sp -= user_sp % core::mem::size_of::<usize>();
        env_ptr_vec.push(0);

        //存放字符串首址的数组
        let mut argv_ptr_vec = Vec::new();
        for (i, arg) in argv.iter().enumerate() {
            // 计算字符串在栈上的地址
            user_sp -= arg.len() + 1;
            argv_ptr_vec.push(user_sp);
            // println!("{:#X}:{}", user_sp, arg);
            for (j, c) in arg.as_bytes().iter().enumerate() {
                *translated_refmut(memory_set.token(), (user_sp + j) as *mut u8) = *c;
            }
            // 添加字符串末尾的 null 字符
            *translated_refmut(memory_set.token(), (user_sp + arg.len()) as *mut u8) = 0;
        }
        user_sp -= user_sp % core::mem::size_of::<usize>(); //以8字节对齐
        argv_ptr_vec.push(0);

        //需要随便放16个字节，不知道干嘛用的。
        user_sp -= 16;
        auxv.push(Aux::new(AuxType::RANDOM, user_sp));
        for i in 0..0xf {
            *translated_refmut(memory_set.token(), (user_sp + i) as *mut u8) = i as u8;
        }
        user_sp -= user_sp % 16;

        // println!("aux:");
        //将auxv放入栈中
        auxv.push(Aux::new(AuxType::EXECFN, argv_ptr_vec[0]));
        auxv.push(Aux::new(AuxType::NULL, 0));
        for aux in auxv.iter().rev() {
            // println!("{:?}", aux);
            user_sp -= size_of::<Aux>();
            *translated_refmut(memory_set.token(), user_sp as *mut usize) = aux.aux_type as usize;
            *translated_refmut(
                memory_set.token(),
                (user_sp + size_of::<usize>()) as *mut usize,
            ) = aux.value;
        }

        //将环境变量指针数组放入栈中
        // println!("env pointers:");
        for p in env_ptr_vec.iter().rev() {
            user_sp -= core::mem::size_of::<usize>();
            *translated_refmut(memory_set.token(), user_sp as *mut usize) = *p;
            // println!("{:#X}:{:#X}", user_sp, *p);
        }
        // println!("arg pointers:");

        //将参数指针数组放入栈中
        for p in argv_ptr_vec.iter().rev() {
            user_sp -= size_of::<usize>();
            *translated_refmut(memory_set.token(), user_sp as *mut usize) = *p;
            // println!("{:#X}:{:#X} ", user_sp, *p);
        }

        //将argc放入栈中
        user_sp -= size_of::<usize>();
        *translated_refmut(memory_set.token(), user_sp as *mut usize) = argv.len();

        //以8字节对齐
        user_sp -= user_sp % size_of::<usize>();
        //println!("user_sp:{:#X}", user_sp);

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
        debug!("task.exec.tid={}", self.tid.0);
        inner.user_heappoint = user_hp;
        inner.user_heapbottom = user_hp;
        // println!("final user_sp:{:#X}", user_sp);
        // **** release current PCB
    }
    ///
    pub fn fork(self: &Arc<TaskControlBlock>, stack: Option<usize>) -> Arc<TaskControlBlock> {
        // ---- hold parent PCB lock
        let mut parent_inner = self.inner_lock();
        let copy_user_stack = stack.is_none();
        // copy user space(include trap context)
        let mut memory_set =
            MemorySet::from_existed_user(&mut parent_inner.memory_set, copy_user_stack);
        let trap_cx_ppn = memory_set
            .translate(VirtAddr::from(USER_TRAP_CONTEXT).into())
            .unwrap()
            .ppn();
        // alloc a pid and a kernel stack in kernel space
        let tid_handle = tid_alloc();
        let pid = tid_handle.0;
        let kernel_stack = KernelStack::new(&tid_handle);
        let (kernel_stack_bottom, kernel_stack_top) = kernel_stack.pos();
        memory_set.insert_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
        );
        // copy fd table
        let mut new_fd_table: Vec<Option<Arc<RFile>>> = Vec::new();
        for fd in parent_inner.fd_table.iter() {
            if let Some(file) = fd {
                new_fd_table.push(Some(file.clone()));
            } else {
                new_fd_table.push(None);
            }
        }
        let user_stack_top = if !copy_user_stack {
            stack.unwrap()
        } else {
            parent_inner.user_stack_top
        };
        let task_control_block = Arc::new(TaskControlBlock {
            tid: tid_handle,
            pid,
            ppid: self.pid,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn,
                user_stack_top,
                task_cx: TaskContext::goto_trap_return(kernel_stack_top),
                task_status: TaskStatus::Ready,
                memory_set,
                parent: Some(Arc::downgrade(self)),
                children: Vec::new(),
                exit_code: 0,
                fd_table: new_fd_table,
                file: parent_inner.file.clone(),
                current_path: parent_inner.current_path.clone(),
                time_data: TimeData::new(),
                user_heappoint: parent_inner.user_heappoint,
                user_heapbottom: parent_inner.user_heapbottom,
                strace_mask: parent_inner.strace_mask,
            }),
        });
        // add child
        parent_inner.children.push(task_control_block.clone());
        // modify kernel_sp in trap_cx
        // **** access child PCB exclusively
        let trap_cx = task_control_block.inner_lock().trap_cx();
        trap_cx.kernel_sp = kernel_stack_top;
        if !copy_user_stack {
            trap_cx.set_sp(user_stack_top);
        }
        // return
        task_control_block
        // **** release child PCB
        // ---- release parent PCB
    }
    pub fn clone_process(
        self: &Arc<TaskControlBlock>,
        stack: Option<usize>,
    ) -> Arc<TaskControlBlock> {
        todo!()
    }
    ///修改数据段大小，懒分配
    pub fn growproc(&self, grow_size: isize) -> usize {
        if grow_size > 0 {
            let growed_addr: usize = self.inner.lock().user_heappoint + grow_size as usize;
            let limit = self.inner.lock().user_heapbottom + USER_HEAP_SIZE;
            if growed_addr > limit {
                panic!("heap overflow at {:#X}!", growed_addr);
            }
            self.inner.lock().user_heappoint = growed_addr;
        } else {
            let shrinked_addr: usize = self.inner.lock().user_heappoint + grow_size as usize;
            if shrinked_addr < self.inner.lock().user_heapbottom {
                panic!("heap downflow at {:#X}!", shrinked_addr);
            }
            self.inner.lock().user_heappoint = shrinked_addr;
        }
        return self.inner.lock().user_heappoint;
    }
}

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Zombie,
}
