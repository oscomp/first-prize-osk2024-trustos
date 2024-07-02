//!Implementation of [`TaskControlBlock`]
use super::{
    aux::{Aux, AuxType},
    insert_into_process_group, insert_into_tid2task, tid_alloc, KernelStack, TaskContext,
    TidHandle,
};
use crate::{
    config::mm::{
        PAGE_SIZE, USER_HEAP_SIZE, USER_STACK_SIZE, USER_STACK_TOP, USER_TRAP_CONTEXT_TOP,
    },
    fs::{open, FdTable, FsInfo},
    mm::{
        flush_tlb, translated_ref, translated_refmut, MapArea, MapAreaType, MapPermission, MapType,
        MemorySet, MemorySetInner, PhysPageNum, VirtAddr,
    },
    signal::{SigPending, SigSet},
    syscall::{CloneFlags, MapedSharedMemory},
    task::{insert_into_thread_group, OpenFlags},
    timer::{TimeData, TimeVal, Timer},
    trap::{trap_handler, TrapContext},
    utils::{get_abs_path, is_abs_path, SysErrNo},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use core::mem::size_of;
use log::debug;
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
    pub trap_cx_bottom: usize,
    pub user_stack_top: usize, // exclusive
    pub task_cx: TaskContext,
    pub task_status: TaskStatus,
    pub memory_set: Arc<MemorySet>,
    pub shms: Vec<MapedSharedMemory>,
    pub fd_table: Arc<FdTable>,
    pub fs_info: Arc<FsInfo>,
    pub time_data: TimeData,
    pub user_heappoint: usize,
    pub user_heapbottom: usize,
    pub set_child_tid: usize,
    pub clear_child_tid: usize,
    pub sig_pending: Arc<SigPending>,
    pub timer: Arc<Timer>,
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
    pub fn is_group_exit(&self) -> bool {
        self.sig_pending.get_ref().group_exit_code.is_some()
    }
    pub fn alloc_user_res(&mut self) {
        let (_, ustack_top) = self.memory_set.insert_framed_area_with_hint(
            USER_STACK_TOP,
            USER_STACK_SIZE,
            MapPermission::R | MapPermission::W | MapPermission::U,
            MapAreaType::Stack,
        );
        let (trap_cx_bottom, _) = self.memory_set.insert_framed_area_with_hint(
            USER_TRAP_CONTEXT_TOP,
            PAGE_SIZE,
            MapPermission::R | MapPermission::W,
            MapAreaType::Trap,
        );
        let trap_cx_ppn = self
            .memory_set
            .translate(VirtAddr::from(trap_cx_bottom).floor())
            .unwrap()
            .ppn();
        self.user_stack_top = ustack_top;
        self.trap_cx_ppn = trap_cx_ppn;
        self.trap_cx_bottom = trap_cx_bottom;
    }
    pub fn clone_user_res(&mut self, another: &TaskControlBlockInner) {
        self.alloc_user_res();
        self.memory_set.clone_area(
            VirtAddr::from(self.user_stack_top - USER_STACK_SIZE).floor(),
            another.memory_set.get_ref(),
        );
        self.memory_set.clone_area(
            VirtAddr::from(self.trap_cx_bottom).floor(),
            another.memory_set.get_ref(),
        );
    }
    pub fn dealloc_user_res(&mut self) {
        if self.user_stack_top != 0 {
            self.memory_set.remove_area_with_start_vpn(
                VirtAddr::from(self.user_stack_top - USER_STACK_SIZE).floor(),
            );
        }
        self.memory_set
            .remove_area_with_start_vpn(VirtAddr::from(self.trap_cx_bottom).floor());
        flush_tlb();
    }
    #[deprecated]
    pub fn get_cwd(&self, dirfd: isize, path: &str) -> Result<String, SysErrNo> {
        if is_abs_path(path) {
            Ok(String::from("/"))
        } else if dirfd != -100 {
            // AT_FDCWD=-100
            let dirfd = dirfd as usize;
            if let Some(file) = self.fd_table.try_get_file(dirfd) {
                let file = file.file()?;
                Ok(file.inode.path())
            } else {
                Err(SysErrNo::EINVAL)
            }
        } else {
            Ok(self.fs_info.get_cwd())
        }
    }
    pub fn get_abs_path(&self, dirfd: isize, path: &str) -> Result<String, SysErrNo> {
        if is_abs_path(path) {
            Ok(get_abs_path("/", path))
        } else if dirfd != -100 {
            // AT_FDCWD=-100
            let dirfd = dirfd as usize;
            if let Some(file) = self.fd_table.try_get_file(dirfd) {
                let base_path = file.file()?.inode.path();
                Ok(get_abs_path(&base_path, path))
            } else {
                Err(SysErrNo::EINVAL)
            }
        } else {
            Ok(get_abs_path(self.fs_info.cwd(), path))
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
        let (mut memory_set, user_heapbottom, entry_point, _) = MemorySetInner::from_elf(elf_data);
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
        let task = Self {
            tid: tid_handle,
            pid: 0,
            ppid: 0,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn: 0.into(),
                trap_cx_bottom: 0,
                user_stack_top: 0,
                task_cx: TaskContext::goto_trap_return(kernel_stack_top),
                task_status: TaskStatus::Ready,
                memory_set: Arc::new(MemorySet::new(memory_set)),
                shms: Vec::new(),
                fd_table: Arc::new(FdTable::new_with_stdio()),
                fs_info: Arc::new(FsInfo::new(String::from("/"))),
                time_data: TimeData::new(),
                user_heappoint: user_heapbottom,
                user_heapbottom,
                set_child_tid: 0,
                clear_child_tid: 0,
                sig_pending: Arc::new(SigPending::new()),
                timer: Arc::new(Timer::new()),
            }),
        };

        let mut task_inner = task.inner_lock();
        task_inner.alloc_user_res();
        // prepare TrapContext in user space
        let trap_cx = task_inner.trap_cx();
        *trap_cx = TrapContext::app_init_context(
            entry_point,
            task_inner.user_stack_top,
            kernel_stack_top,
            trap_handler as usize,
        );
        drop(task_inner);
        task
    }
    pub fn exec(&self, elf_data: &[u8], argv: &Vec<String>, env: &mut Vec<String>) {
        let mut inner = self.inner_lock();
        //用户栈高地址到低地址：环境变量字符串/参数字符串/aux辅助向量/环境变量地址数组/参数地址数组/参数数量
        // memory_set with elf program headers/trampoline/trap context/user stack
        let (mut memory_set, user_hp, entry_point, mut auxv) = MemorySetInner::from_elf(elf_data);
        let token = memory_set.token();

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
        inner.memory_set = Arc::new(MemorySet::new(memory_set));
        // 重新分配用户资源
        inner.alloc_user_res();

        let mut user_sp = inner.user_stack_top;

        // println!("user_sp:{:#X}  argv:{:?}", user_sp, argv);

        //一些初始的环境变量
        env.push(String::from("SHELL=/user_shell"));
        env.push(String::from("PWD=/"));
        env.push(String::from("HOME=/"));
        env.push(String::from("PATH=/"));

        //环境变量内容入栈
        let mut env_ptr_vec = Vec::new();
        for env in env.iter() {
            user_sp -= env.len() + 1;
            env_ptr_vec.push(user_sp);
            // println!("{:#X}:{}", user_sp, env);
            for (j, c) in env.as_bytes().iter().enumerate() {
                *translated_refmut(token, (user_sp + j) as *mut u8) = *c;
            }
            *translated_refmut(token, (user_sp + env.len()) as *mut u8) = 0;
        }
        user_sp -= user_sp % core::mem::size_of::<usize>();
        env_ptr_vec.push(0);

        //存放字符串首址的数组
        let mut argv_ptr_vec = Vec::new();
        for arg in argv.iter() {
            // 计算字符串在栈上的地址
            user_sp -= arg.len() + 1;
            argv_ptr_vec.push(user_sp);
            // println!("{:#X}:{}", user_sp, arg);
            for (j, c) in arg.as_bytes().iter().enumerate() {
                *translated_refmut(token, (user_sp + j) as *mut u8) = *c;
            }
            // 添加字符串末尾的 null 字符
            *translated_refmut(token, (user_sp + arg.len()) as *mut u8) = 0;
        }
        user_sp -= user_sp % core::mem::size_of::<usize>(); //以8字节对齐
        argv_ptr_vec.push(0);

        //需要随便放16个字节，不知道干嘛用的。
        user_sp -= 16;
        auxv.push(Aux::new(AuxType::RANDOM, user_sp));
        for i in 0..0xf {
            *translated_refmut(token, (user_sp + i) as *mut u8) = i as u8;
        }
        user_sp -= user_sp % 16;

        // println!("aux:");
        //将auxv放入栈中
        auxv.push(Aux::new(AuxType::EXECFN, argv_ptr_vec[0]));
        auxv.push(Aux::new(AuxType::NULL, 0));
        for aux in auxv.iter().rev() {
            // println!("{:?}", aux);
            user_sp -= size_of::<Aux>();
            *translated_refmut(token, user_sp as *mut usize) = aux.aux_type as usize;
            *translated_refmut(token, (user_sp + size_of::<usize>()) as *mut usize) = aux.value;
        }

        //将环境变量指针数组放入栈中
        // println!("env pointers:");
        for p in env_ptr_vec.iter().rev() {
            user_sp -= core::mem::size_of::<usize>();
            *translated_refmut(token, user_sp as *mut usize) = *p;
            // println!("{:#X}:{:#X}", user_sp, *p);
        }
        // println!("arg pointers:");

        //将参数指针数组放入栈中
        for p in argv_ptr_vec.iter().rev() {
            user_sp -= size_of::<usize>();
            *translated_refmut(token, user_sp as *mut usize) = *p;
            // println!("{:#X}:{:#X} ", user_sp, *p);
        }

        //将argc放入栈中
        user_sp -= size_of::<usize>();
        *translated_refmut(token, user_sp as *mut usize) = argv.len();

        //以8字节对齐
        user_sp -= user_sp % size_of::<usize>();
        //println!("user_sp:{:#X}", user_sp);

        //将设置了O_CLOEXEC位的文件描述符关闭
        inner.fd_table.close_on_exec();

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
    }
    ///
    pub fn clone_process(
        self: &Arc<TaskControlBlock>,
        flags: CloneFlags,
        stack: usize,
        parent_tid: *mut u32,
        tls: usize,
        child_tid: *mut u32,
    ) -> Arc<TaskControlBlock> {
        let parent_inner = self.inner.lock();

        let tid_handle = tid_alloc();
        let kernel_stack = KernelStack::new(&tid_handle);
        let (kernel_stack_bottom, kernel_stack_top) = kernel_stack.pos();

        // 检查是否共享虚拟内存
        let memory_set = if flags.contains(CloneFlags::CLONE_VM) {
            Arc::clone(&parent_inner.memory_set)
        } else {
            Arc::new(MemorySet::new(MemorySetInner::from_existed_user(
                &parent_inner.memory_set,
            )))
        };
        // 无论如何都要插入内核栈
        memory_set.insert_framed_area(
            kernel_stack_bottom.into(),
            kernel_stack_top.into(),
            MapPermission::R | MapPermission::W,
            MapAreaType::Stack,
        );
        // 检查是否共享文件系统信息
        //filesystem information.  This includes the root
        //of the filesystem, the current working directory, and the umask
        let fs_info = if flags.contains(CloneFlags::CLONE_FS) {
            Arc::clone(&parent_inner.fs_info)
        } else {
            Arc::new(FsInfo::from_another(&parent_inner.fs_info))
        };
        // 检查是否共享打开文件表
        let fd_table = if flags.contains(CloneFlags::CLONE_FILES) {
            Arc::clone(&parent_inner.fd_table)
        } else {
            Arc::new(FdTable::from_another(&parent_inner.fd_table))
        };
        // 检查是否共享信号处理程序表
        let sig_pending = if flags.contains(CloneFlags::CLONE_SIGHAND) {
            Arc::clone(&parent_inner.sig_pending)
        } else {
            Arc::new(SigPending::from_another(&parent_inner.sig_pending))
        };
        // 检查是否需要设置 parent_tid
        if flags.contains(CloneFlags::CLONE_PARENT_SETTID) {
            *translated_refmut(parent_inner.user_token(), parent_tid) = tid_handle.0 as u32;
        }
        // 检查是否需要设置子进程的 set_child_tid,clear_child_tid
        let set_child_tid = if flags.contains(CloneFlags::CLONE_CHILD_SETTID) {
            child_tid as usize
        } else {
            0
        };
        let clear_child_tid = if flags.contains(CloneFlags::CLONE_CHILD_CLEARTID) {
            child_tid as usize
        } else {
            0
        };
        let (pid, ppid, timer);
        // 检查是否创建线程
        if flags.contains(CloneFlags::CLONE_THREAD) {
            pid = self.pid;
            ppid = self.ppid;
            timer = Arc::clone(&parent_inner.timer);
        } else {
            pid = tid_handle.0;
            ppid = self.pid;
            timer = Arc::new(Timer::new());
        }
        let child = Arc::new(TaskControlBlock {
            tid: tid_handle,
            ppid,
            pid,
            kernel_stack,
            inner: Mutex::new(TaskControlBlockInner {
                trap_cx_ppn: 0.into(),
                trap_cx_bottom: 0,
                user_stack_top: 0,
                task_cx: TaskContext::goto_trap_return(kernel_stack_top),
                task_status: TaskStatus::Ready,
                memory_set,
                shms: parent_inner.shms.clone(),
                fd_table,
                fs_info,
                time_data: TimeData::new(),
                user_heappoint: parent_inner.user_heappoint,
                user_heapbottom: parent_inner.user_heapbottom,
                set_child_tid,
                clear_child_tid,
                sig_pending,
                timer,
            }),
        });

        let mut child_inner = child.inner_lock();
        // debug!(
        //     "to {:?}, parent is {:?}, child is {:?}",
        //     SigSet::from_sig(3),
        //     parent_inner.sig_pending.get_mut().actions[3].act,
        //     child_inner.sig_pending.get_mut().actions[3].act
        // );
        if flags.contains(CloneFlags::CLONE_THREAD) {
            // 线程
            child_inner.alloc_user_res();
            *child_inner.trap_cx() = *parent_inner.trap_cx();
        } else {
            // fork
            child_inner.clone_user_res(&parent_inner);
            // for child process, fork returns 0
            child_inner.trap_cx().x[10] = 0;
        }

        let trap_cx = child_inner.trap_cx();
        trap_cx.kernel_sp = kernel_stack_top;
        if stack != 0 {
            // 移除分配的stack
            let ustack = child_inner.user_stack_top;
            child_inner
                .memory_set
                .remove_area_with_start_vpn(VirtAddr::from(ustack - USER_STACK_SIZE).floor());
            child_inner.user_stack_top = 0;
            // trap_cx.set_sp(ustack);
            // 设置运行的起始地址和参数以及stack
            let token = parent_inner.user_token();
            let entry_point = *translated_ref(token, stack as *const usize);
            let arg = {
                let arg_addr = stack + core::mem::size_of::<usize>();
                *translated_ref(token, arg_addr as *const usize)
            };
            // sepc/entry
            trap_cx.sepc = entry_point;
            //sp
            trap_cx.x[2] = stack;
            //a0
            trap_cx.x[10] = arg;
        }
        if flags.contains(CloneFlags::CLONE_SETTLS) {
            // tp
            trap_cx.x[4] = tls;
        }
        // CLONE_CHILD_SETTID
        if flags.contains(CloneFlags::CLONE_CHILD_SETTID) {
            let child_token = child_inner.user_token();
            *translated_refmut(child_token, child_tid) = child.tid() as u32;
        }

        //子进程映射共享内存
        parent_inner.shms.iter().for_each(|x| {
            child_inner.memory_set.map_given_frames(
                MapArea::new(
                    VirtAddr::from(x.start),
                    VirtAddr::from(x.end),
                    MapType::Framed,
                    MapPermission::all(),
                    MapAreaType::Shm,
                ),
                x.mem.trackers.clone(),
            );
        });

        drop(child_inner);
        drop(parent_inner);
        insert_into_tid2task(child.tid(), &child);
        insert_into_thread_group(child.pid, &child);
        if !flags.contains(CloneFlags::CLONE_THREAD) {
            insert_into_process_group(child.ppid, &child);
        }
        child
    }

    ///修改数据段大小，懒分配
    pub fn growproc(&self, grow_size: isize) -> usize {
        let mut inner = self.inner_lock();
        if grow_size > 0 {
            let growed_addr: usize = inner.user_heappoint + grow_size as usize;
            let limit = inner.user_heapbottom + USER_HEAP_SIZE;
            if growed_addr > limit {
                panic!("heap overflow at {:#X}!", growed_addr);
            }
            inner.user_heappoint = growed_addr;
        } else {
            let shrinked_addr: usize = inner.user_heappoint + grow_size as usize;
            if shrinked_addr < inner.user_heapbottom {
                panic!("heap downflow at {:#X}!", shrinked_addr);
            }
            inner.user_heappoint = shrinked_addr;
        }
        inner.user_heappoint
    }

    pub fn check_timer(&self) {
        let inner = self.inner_lock();
        let now_timeval = TimeVal::now();
        let timer_inner = inner.timer.get_mut();
        if timer_inner.if_first {
            //首次触发
            if now_timeval > timer_inner.last_time + timer_inner.timer.it_value {
                inner.sig_pending.get_mut().pending |= SigSet::SIGALRM;
                timer_inner.if_first = false;
                timer_inner.last_time = now_timeval;
            }
        } else if timer_inner.timer.it_interval != TimeVal::new(0, 0) {
            //间隔触发
            if now_timeval > timer_inner.last_time + timer_inner.timer.it_interval {
                inner.sig_pending.get_mut().pending |= SigSet::SIGALRM;
                timer_inner.last_time = now_timeval;
            }
        }
    }
}

#[derive(Copy, Clone, PartialEq)]
pub enum TaskStatus {
    Ready,
    Running,
    Zombie,
    Blocked,
}
