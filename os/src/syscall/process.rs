use crate::{
    fs::{open, open_file, Mode, OpenFlags},
    mm::{
        translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer,
        VirtAddr,
    },
    syscall::CloneFlags,
    task::{
        add_task, current_task, current_token, exit_current_and_run_next,
        suspend_current_and_run_next,
    },
    timer::{get_time_ms, Timespec, Tms},
    utils::{SysErrNo, SyscallRet},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use core::mem::size_of;

use crate::config::processor::HART_NUM;
use crate::console::print;
use crate::task::manager::{pid2task, ready_procs_num, task_num};
use crate::task::processor::get_proc_by_hartid;
use crate::utils::hart_id;
use log::{debug, info};

pub fn sys_exit(exit_code: i32) -> ! {
    exit_current_and_run_next(exit_code);
    panic!("Unreachable in sys_exit!");
}

pub fn sys_sched_yield() -> SyscallRet {
    suspend_current_and_run_next();
    Ok(0)
}

pub fn sys_getpid() -> SyscallRet {
    Ok(current_task().unwrap().pid())
}

pub fn sys_getppid() -> SyscallRet {
    Ok(current_task().unwrap().ppid())
}

pub fn sys_getuid() -> SyscallRet {
    Ok(0) // root user
}

pub fn sys_geteuid() -> SyscallRet {
    Ok(0) // root user
}

pub fn sys_getgid() -> SyscallRet {
    Ok(0) // root group
}

pub fn sys_getegid() -> SyscallRet {
    Ok(0) // root group
}
pub fn sys_gettid() -> SyscallRet {
    Ok(current_task().unwrap().tid())
}
pub fn sys_settidaddress(tidptr: usize) -> SyscallRet {
    current_task().unwrap().inner_lock().clear_child_tid = tidptr;
    sys_gettid()
}

pub fn sys_strace(mask: usize) -> SyscallRet {
    current_task().unwrap().inner_lock().strace_mask = mask;
    Ok(0)
}

/// void (*fn)(void* arg) 参数通过栈传递,如果stack_ptr!=0, fn=0(stack),arg=8(stack)
pub fn sys_clone(
    flags: usize,
    stack_ptr: usize,
    parent_tid_ptr: usize,
    tls_ptr: usize,
    chilren_tid_ptr: usize,
) -> SyscallRet {
    let flags = CloneFlags::from_bits(flags as u32).unwrap();
    debug!("[sys_clone] flags {:?}", flags);

    let stack = match stack_ptr {
        0 => None,
        stack => {
            debug!("[sys_clone] assign the user stack {:#x}", stack);
            // UserCheck::new().check_writable_slice(stack as *mut u8, USER_STACK_SIZE)?;
            Some(stack as usize)
        }
    };
    // fork or create new
    if flags.is_fork() {
        //通常使用默认的 CLONE_CHILD_CLEARTID、CLONE_CHILD_SETTID 和 SIGCHLD 标志。
        //ptid、tls、ctid 通常设置为 NULL
        let current_task = current_task().unwrap();
        let new_task = current_task.fork(stack);
        let new_pid = new_task.pid();
        // modify trap context of new_task, because it returns immediately after switching
        let trap_cx = new_task.inner_lock().trap_cx();
        // we do not have to move to next instruction since we have done it before
        // for child process, fork returns 0
        trap_cx.x[10] = 0;
        // add new task to scheduler
        add_task(new_task);
        Ok(new_pid)
    } else {
        unimplemented!();
    }
}

pub fn sys_execve(path: *const u8, mut argv: *const usize, mut envp: *const usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();

    let token = task_inner.user_token();
    let path = translated_str(token, path);
    //处理argv参数
    let mut argv_vec = Vec::<String>::new();
    loop {
        if argv.is_null() {
            break;
        }
        let argv_ptr = *translated_ref(token, argv);
        if argv_ptr == 0 {
            break;
        }
        argv_vec.push(translated_str(token, argv_ptr as *const u8));
        unsafe {
            argv = argv.add(1);
        }
    }
    let mut env = Vec::<String>::new();
    loop {
        if envp.is_null() {
            break;
        }
        let envp_ptr = *translated_ref(token, envp);
        if envp_ptr == 0 {
            break;
        }
        env.push(translated_str(token, envp_ptr as *const u8));
        unsafe {
            envp = envp.add(1);
        }
    }

    if let Some(app_inode) = open(task_inner.fs_info.cwd(), path.as_str(), OpenFlags::O_RDONLY) {
        let elf_data = unsafe { app_inode.read_as_elf() };
        drop(task_inner);

        task.exec(elf_data, &argv_vec, &mut env);
        task.inner_lock().memory_set.activate();
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}
/// 等待子进程状态发生变化,即子进程终止或被信号停止或被信号挂起
pub fn sys_wait4(pid: isize, wstatus: *mut i32, options: i32) -> SyscallRet {
    // TODO(ZMY) 加入信号和进程组支持
    debug!("sys_wait4 enter");
    assert!(options == 0, "not support options yet");
    loop {
        let task = current_task().unwrap();
        // find a child process
        // ---- access current PCB exclusively
        let mut inner = task.inner_lock();
        if !inner
            .children
            .iter()
            .any(|p| pid == -1 || pid as usize == p.pid())
        {
            debug!("[sys_wait4] no child process");
            return Err(SysErrNo::ECHILD);
            // ---- release current PCB
        }
        let pair = inner.children.iter().enumerate().find(|(_, p)| {
            // ++++ temporarily access child PCB exclusively
            p.inner_lock().is_zombie() && (pid == -1 || pid as usize == p.pid())
            // ++++ release child PCB
        });
        if let Some((idx, _)) = pair {
            let child = inner.children.remove(idx);
            // confirm that child will be deallocated after being removed from children list
            assert_eq!(
                Arc::strong_count(&child),
                1,
                "process{} can't recycled",
                child.pid()
            );

            let mut childinner = child.inner_lock();

            inner.time_data.cutime += childinner.time_data.utime;
            inner.time_data.cstime += childinner.time_data.stime;

            let found_pid = child.pid();
            // ++++ temporarily access child PCB exclusively
            let exit_code = childinner.exit_code;
            // ++++ release child PCB
            if wstatus as usize != 0x0 {
                debug!(
                    "[sys_wait4] child {} exit with code {}, wstatus= {:#x}",
                    found_pid, exit_code, wstatus as usize
                );
                *translated_refmut(inner.memory_set.token(), wstatus) = exit_code << 8;
            }
            return Ok(found_pid);
        } else {
            drop(inner);
            drop(task);
            suspend_current_and_run_next();
        }
    }
}

pub fn sys_nanosleep(req: *const u8, _rem: *const u8) -> SyscallRet {
    let token = current_token();
    let req = translated_ref(token, req as *const Timespec);

    let begin = get_time_ms();
    let waittime = req.tv_sec * 1000 + req.tv_nsec / 1000000;

    loop {
        let now = get_time_ms();
        if now - begin >= waittime {
            break;
        } else {
            suspend_current_and_run_next();
        }
    }
    Ok(0)
}

pub struct Utsname {
    sysname: [u8; 65],
    nodename: [u8; 65],
    release: [u8; 65],
    version: [u8; 65],
    machine: [u8; 65],
    domainname: [u8; 65],
}
pub fn sys_uname(buf: *mut u8) -> SyscallRet {
    fn str2u8(s: &str) -> [u8; 65] {
        let mut b = [0; 65];
        b[0..s.len()].copy_from_slice(s.as_bytes());
        b
    }
    let uname = Utsname {
        sysname: str2u8("TrustOS"),
        nodename: str2u8("TrustOS"),
        release: str2u8("Alpha"),
        version: str2u8("v1.0"),
        machine: str2u8("RISC-V64"),
        domainname: str2u8("TrustOS"),
    };
    let token = current_token();
    let mut buf_vec = translated_byte_buffer(token, buf, size_of::<Utsname>());
    let mut userbuf = UserBuffer::new(buf_vec);
    userbuf.write(unsafe {
        core::slice::from_raw_parts(
            &uname as *const _ as usize as *const u8,
            size_of::<Utsname>(),
        )
    });
    Ok(0)
}

pub fn sys_brk(brk_addr: usize) -> SyscallRet {
    let former_addr = current_task().unwrap().growproc(0);
    if brk_addr == 0 {
        return Ok(former_addr);
    }
    let grow_size: isize = (brk_addr - former_addr) as isize;
    Ok(current_task().unwrap().growproc(grow_size))
}

// pub fn sys_sched_setaffinity(pid: usize, _cpusetsize: usize, mask: usize) -> SyscallRet {
//     let task = current_task().unwrap();
//     let mut inner = task.inner_lock();
//     let token = inner.user_token();
//     let mask = *translated_ref(token, mask as *const usize);

//     //尝试匹配当前进程
//     if pid == 0 || task.pid() == pid {
//         inner.kind_cpu = mask as isize;
//         return Ok(0);
//     }
//     //尝试匹配其其他进程
//     if let Some(found_task) = pid2task(pid) {
//         found_task.inner_lock().kind_cpu = mask as isize;
//         return Ok(0);
//     }
//     //匹配不到
//     Err(SysErrNo::EINVAL)
// }

// pub fn sys_sched_getaffinity(pid: usize, _cpusetsize: usize, mask: usize) -> SyscallRet {
//     let task = current_task().unwrap();
//     let mut inner = task.inner_lock();
//     let token = inner.user_token();

//     //尝试匹配当前进程
//     if pid == 0 || task.pid() == pid {
//         *translated_refmut(token, mask as *mut usize) = inner.kind_cpu as usize;
//         return Ok(0);
//     }
//     //尝试匹配其其他进程
//     if let Some(found_task) = pid2task(pid) {
//         *translated_refmut(token, mask as *mut usize) = found_task.inner_lock().kind_cpu as usize;
//         return Ok(0);
//     }
//     //匹配不到
//     Err(SysErrNo::EINVAL)
// }

pub struct Sysinfo {
    pub uptime: usize,
    pub totalram: usize,
    pub procs: usize,
}

impl Sysinfo {
    pub fn new(newuptime: usize, newtotalram: usize, newprocs: usize) -> Self {
        Self {
            uptime: newuptime,
            totalram: newtotalram,
            procs: newprocs,
        }
    }
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as usize as *const u8, size) }
    }
}

pub fn sys_sysinfo(info: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut info = UserBuffer::new(translated_byte_buffer(token, info, size_of::<Sysinfo>()));

    let ourinfo = Sysinfo::new(get_time_ms() / 1000, 1 << 56, task_num());
    info.write(ourinfo.as_bytes());
    Ok(0)
}

pub fn sys_umask(mask: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mask = Mode::from_bits(mask).unwrap();

    inner.umask = mask;
    Ok(0)
}
