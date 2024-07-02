use crate::{
    fs::{open, OpenFlags},
    logger::{change_log_level, clear_log_buf, console_log_off, console_log_on, unread_size},
    mm::{
        safe_translated_byte_buffer, translated_byte_buffer, translated_ref, translated_refmut,
        translated_str, PhysAddr, UserBuffer, VirtAddr,
    },
    signal::{check_if_any_sig_for_current_task, ready_to_handle_signal},
    syscall::{CloneFlags, Utsname},
    task::{
        add_task, current_task, current_token, exit_current_and_run_next,
        exit_current_group_and_run_next, futex_requeue, futex_wait, futex_wake_up,
        move_child_process_to_init, remove_all_from_thread_group, suspend_current_and_run_next,
        task_num, Sysinfo, PROCESS_GROUP,
    },
    timer::{add_timer, calculate_left_timespec, get_time_ms, get_time_spec, Timespec},
    utils::{get_abs_path, trim_start_slash, SysErrNo, SyscallRet},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use core::mem::size_of;
use num_enum::TryFromPrimitive;

use super::SyslogType;
use crate::logger::{read_all_log_buf, read_clear_log_buf, read_log_buf, LOG_BUF_LEN};
use log::debug;

pub fn sys_exit(exit_code: i32) -> ! {
    exit_current_and_run_next(exit_code);
    panic!("Unreachable in sys_exit!");
}

pub fn sys_exit_group(exit_code: i32) -> ! {
    exit_current_group_and_run_next(exit_code);
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

/// void (*fn)(void* arg) 参数通过栈传递,如果stack_ptr!=0, fn=0(stack),arg=8(stack)
pub fn sys_clone(
    flags: usize,
    stack_ptr: usize,
    parent_tid_ptr: usize,
    tls_ptr: usize,
    child_tid_ptr: usize,
) -> SyscallRet {
    let flags = CloneFlags::from_bits(flags as u32).unwrap();
    debug!(
        "[sys_clone] flags {:?},stack:{:#x},parent_tid_ptr:{:#x},child_tid_ptr:{:#x},tls_ptr:{:#x}",
        flags, stack_ptr, parent_tid_ptr, child_tid_ptr, tls_ptr
    );

    let task = current_task().unwrap();
    let new_task = task.clone_process(
        flags,
        stack_ptr,
        parent_tid_ptr as *mut u32,
        tls_ptr,
        child_tid_ptr as *mut u32,
    );
    let new_tid = new_task.tid();
    // we do not have to move to next instruction since we have done it before
    // add new task to scheduler
    add_task(new_task);
    Ok(new_tid)
}

pub fn sys_execve(path: *const u8, mut argv: *const usize, mut envp: *const usize) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();

    let token = task_inner.user_token();
    let mut path = trim_start_slash(translated_str(token, path));

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
    if path.ends_with(".sh") {
        argv_vec.insert(0, String::from("sh"));
        argv_vec.insert(0, String::from("busybox"));
        path = String::from("/busybox");
    }
    debug!("[sys_execve] path is {},arg is {:?}", path, argv_vec);
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

    let cwd = if !path.starts_with('/') {
        task_inner.fs_info.cwd()
    } else {
        "/"
    };
    let abs_path = get_abs_path(&cwd, &path);
    let app_inode = open(&abs_path, OpenFlags::O_RDONLY)?.file()?;
    let elf_data = app_inode.inode.read_all()?;
    drop(task_inner);
    task.exec(&elf_data, &argv_vec, &mut env);
    task.inner_lock().memory_set.activate();
    Ok(0)
}

#[allow(non_camel_case_types)]
#[derive(Debug, PartialEq, Eq, Clone, Copy, TryFromPrimitive)]
#[repr(i32)]
pub enum FutexCmd {
    FUTEX_WAIT = 0,
    FUTEX_WAKE = 1,
    FUTEX_REQUEUE = 3,
}

pub fn sys_futex(
    uaddr: *mut i32,
    futex_op: i32,
    val: i32,
    timeout: *const Timespec,
    uaddr2: *mut i32,
    _val3: i32,
) -> SyscallRet {
    let cmd = FutexCmd::try_from_primitive(futex_op & 0x7f).unwrap();
    debug!(
        "[sys_futex] uaddr = {:#x}, cmd = {:?}, val = {}",
        uaddr as usize, cmd, val
    );
    if uaddr.align_offset(4) != 0 {
        return Err(SysErrNo::EINVAL);
    }
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();
    let pa = task_inner
        .memory_set
        .translate_va(VirtAddr::from(uaddr as usize))
        .unwrap();
    let pa2 = if !uaddr2.is_null() {
        task_inner
            .memory_set
            .translate_va(VirtAddr::from(uaddr2 as usize))
            .unwrap()
    } else {
        PhysAddr::from(0)
    };
    drop(task_inner);
    drop(task);
    match cmd {
        FutexCmd::FUTEX_WAIT => {
            let futex_word = *translated_ref(token, uaddr);
            if futex_word != val {
                return Err(SysErrNo::EAGAIN);
            }
            if !timeout.is_null() {
                let timeout = *translated_ref(token, timeout);
                debug!("[sys_futex] timeout = {:?}", timeout);
                add_timer(get_time_spec() + timeout, current_task().unwrap());
            }
            if futex_wait(pa) {
                Ok(0)
            } else {
                Err(SysErrNo::ETIMEDOUT)
            }
        }
        FutexCmd::FUTEX_WAKE => Ok(futex_wake_up(pa, val)),
        FutexCmd::FUTEX_REQUEUE => Ok(futex_requeue(pa, val, pa2, timeout as i32)),
    }
}

/// 等待子进程状态发生变化,即子进程终止或被信号停止或被信号挂起
/// < -1   meaning wait for any child process whose process group ID
///         is equal to the absolute value of pid.
///-1     meaning wait for any child process.
///0      meaning wait for any child process whose process group ID
///       is equal to that of the calling process at the time of the call to waitpid().
///> 0    meaning wait for the child whose process ID is equal to the value of pid.
pub fn sys_wait4(pid: isize, wstatus: *mut i32, options: i32) -> SyscallRet {
    //assert!(options == 0, "not support options yet");
    //默认所有进程都在同一个组
    debug!(
        "[sys_wait4] pid is {},wstatus is {}, options is {}",
        pid, wstatus as usize, options
    );
    loop {
        let mut process_group = PROCESS_GROUP.lock();
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        // 暂时没有子进程,返回即可
        if !process_group.contains_key(&task.pid()) {
            debug!("[sys_wait4] no child process");
            return Err(SysErrNo::ECHILD);
        }
        // 只有fork出来的子进程会被放入
        let children = process_group.get_mut(&task.pid()).unwrap();
        if !children
            .iter()
            .any(|p| pid == -1 || pid as usize == p.pid())
        {
            debug!("[sys_wait4] no child process");
            return Err(SysErrNo::ECHILD);
        }
        // 寻找符合条件的进程组
        // 使用clone避免多次借用或借用冲突
        let pair = children
            .iter()
            .enumerate()
            .find(|(_, p)| {
                // ++++ temporarily access child PCB exclusively
                p.inner_lock().is_group_exit() && (pid == -1 || pid as usize == p.pid())
                // ++++ release child PCB
            })
            .map(|(idx, t)| (idx, Arc::clone(t)));

        if let Some((idx, child)) = pair {
            let found_pid = child.pid();
            let child_inner = child.inner_lock();
            let exit_code = child_inner.sig_pending.get_ref().group_exit_code.unwrap();
            if wstatus as usize != 0x0 {
                debug!(
                    "[sys_wait4] wait pid {}: child {} exit with code {}, wstatus= {:#x}",
                    pid, found_pid, exit_code, wstatus as usize
                );
                *translated_refmut(task_inner.memory_set.token(), wstatus) = exit_code << 8;
            }
            drop(child_inner);
            // 从父进程的子进程组移除
            children.remove(idx);
            // 从线程组移除
            remove_all_from_thread_group(found_pid);
            drop(task_inner);
            drop(task);
            drop(process_group);
            // 转移子进程
            move_child_process_to_init(found_pid);

            assert_eq!(
                Arc::strong_count(&child),
                1,
                "process{} can't recycled",
                child.pid()
            );
            return Ok(found_pid);
        } else {
            drop(task_inner);
            drop(task);
            drop(process_group);
            suspend_current_and_run_next();
        }
    }
}

pub fn sys_nanosleep(req: *const u8, rem: *const u8) -> SyscallRet {
    let token = current_token();

    // debug!(
    //     "[sys_nanosleep] req is {:x}, rem is {:x}",
    //     req as usize, rem as usize
    // );

    let req = translated_ref(token, req as *const Timespec);
    let waittime = req.tv_sec * 1_000_000_000usize + req.tv_nsec;
    let begin = get_time_ms() * 1_000_000usize;
    let endtime = get_time_spec() + *req;

    // debug!(
    //     "[sys_nanosleep] ready to sleep for {} sec, {} nsec",
    //     req.tv_sec, req.tv_nsec
    // );

    while get_time_ms() * 1_000_000usize - begin < waittime {
        if let Some(signo) = check_if_any_sig_for_current_task() {
            if rem as usize != 0 {
                let mut buffer = UserBuffer::new(
                    translated_byte_buffer(token, rem, size_of::<Timespec>()).unwrap(),
                );
                buffer.write(calculate_left_timespec(endtime).as_bytes());
            }
            ready_to_handle_signal(signo);
        }
        suspend_current_and_run_next();
    }
    Ok(0)
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
        release: str2u8("5.0.0"),
        version: str2u8("5.0.0"),
        machine: str2u8("RISC-V64"),
        domainname: str2u8("TrustOS"),
    };
    let token = current_token();
    let buf_vec = translated_byte_buffer(token, buf, size_of::<Utsname>()).unwrap();
    let mut userbuf = UserBuffer::new(buf_vec);
    userbuf.write(uname.as_bytes());
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

pub fn sys_sysinfo(info: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut info =
        UserBuffer::new(translated_byte_buffer(token, info, size_of::<Sysinfo>()).unwrap());

    let ourinfo = Sysinfo::new(get_time_ms() / 1000, 1 << 56, task_num());
    info.write(ourinfo.as_bytes());
    // debug!("[sys_sysinfo] ourinfo is {:?}", ourinfo);
    Ok(0)
}

pub fn sys_umask(_mask: u32) -> SyscallRet {
    Ok(0)
}

pub fn sys_syslog(logtype: isize, bufp: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    // debug!(
    //     "[sys_syslog] logtype is {}, bufp is {:x}, len is {}",
    //     logtype, bufp as usize, len
    // );

    let logtype = SyslogType::from(logtype);

    match logtype {
        SyslogType::SYSLOG_ACTION_READ => {
            let mut bufp = UserBuffer::new(
                safe_translated_byte_buffer(inner.memory_set.clone(), bufp, len).unwrap(),
            );
            let mut logbuf: [u8; LOG_BUF_LEN] = [0; LOG_BUF_LEN];
            let logsize = read_log_buf(logbuf.as_mut_slice(), len);
            bufp.write(&logbuf[0..logsize]);
            Ok(logsize)
        }
        SyslogType::SYSLOG_ACTION_READ_ALL => {
            let mut bufp = UserBuffer::new(
                safe_translated_byte_buffer(inner.memory_set.clone(), bufp, len).unwrap(),
            );
            let mut logbuf: [u8; LOG_BUF_LEN] = [0; LOG_BUF_LEN];
            let logsize = read_all_log_buf(logbuf.as_mut_slice(), len);
            bufp.write(&logbuf[0..logsize]);
            Ok(logsize)
        }
        SyslogType::SYSLOG_ACTION_READ_CLEAR => {
            let mut bufp = UserBuffer::new(
                safe_translated_byte_buffer(inner.memory_set.clone(), bufp, len).unwrap(),
            );
            let mut logbuf: [u8; LOG_BUF_LEN] = [0; LOG_BUF_LEN];
            let logsize = read_clear_log_buf(logbuf.as_mut_slice(), len);
            bufp.write(&logbuf[0..logsize]);
            Ok(logsize)
        }
        SyslogType::SYSLOG_ACTION_CLEAR => {
            clear_log_buf();
            Ok(0)
        }
        SyslogType::SYSLOG_ACTION_CONSOLE_OFF => {
            console_log_off();
            Ok(0)
        }
        SyslogType::SYSLOG_ACTION_CONSOLE_ON => {
            console_log_on();
            Ok(0)
        }
        SyslogType::SYSLOG_ACTION_CONSOLE_LEVER => {
            let result = change_log_level(len);
            if result == -1 {
                return Err(SysErrNo::EINVAL);
            }
            Ok(0)
        }
        SyslogType::SYSLOG_ACTION_SIZE_UNREAD => Ok(unread_size()),
        SyslogType::SYSLOG_ACTION_SIZE_BUFFER => Ok(LOG_BUF_LEN),
        _ => return Err(SysErrNo::EINVAL),
    }
}

pub fn sys_sched_setaffinity(_pid: usize, _cpusetsize: usize, _mask: usize) -> SyscallRet {
    // debug!(
    //     "[sys_sched_setaffinity] pid is {}, cpusetsize is {}, mask is {}",
    //     pid, cpusetsize, mask
    // );
    Ok(0)
}

pub fn sys_sched_getaffinity(_pid: usize, _cpusetsize: usize, _mask: usize) -> SyscallRet {
    // debug!(
    //     "[sys_sched_getaffinity] pid is {}, cpusetsize is {}, mask is {}",
    //     pid, cpusetsize, mask
    // );
    Ok(0)
}

pub fn sys_sched_setscheduler(_pid: usize, _policy: usize, _param: *const u8) -> SyscallRet {
    // debug!(
    //     "[sys_sched_setscheduler] pid is {}, policy is {}, param is {:x}",
    //     pid, policy, param as usize
    // );
    Ok(0)
}

pub fn sys_sched_getscheduler(_pid: usize) -> SyscallRet {
    // debug!("[sys_sched_getscheduler] pid is {}", pid);
    //由于使用的是标准的时间片调度算法，直接返回SCHED_OHTER = 0
    Ok(0)
}

pub fn sys_sched_getparam(_pid: usize, _param: *const u8) -> SyscallRet {
    // debug!(
    //     "[sys_sched_getparam] pid is {}, param is {:x}",
    //     pid, param as usize
    // );
    //由于使用的是标准的时间片调度算法，param参数需要被忽略
    Ok(0)
}

const TIME_ABSTIME: u32 = 1;

pub fn sys_clock_nanosleep(
    _clockid: usize,
    flags: u32,
    t: *const u8,
    remain: *const u8,
) -> SyscallRet {
    let token = current_token();

    // debug!(
    //     "[sys_clock_nanosleep] clockid is {}, flags is {}, t is {:x}, remain is {:x}",
    //     clockid, flags, t as usize, remain as usize
    // );

    let t = translated_ref(token, t as *const Timespec);
    let waittime = t.tv_sec * 1_000_000_000usize + t.tv_nsec;

    let begin = get_time_ms() * 1_000_000usize;
    let endtime = if flags == TIME_ABSTIME {
        //绝对时间
        *t
    } else {
        //相对时间
        get_time_spec() + *t
    };

    // debug!(
    //     "[sys_clock_nanosleep] when not abs_time, ready to sleep for {} sec, {} nsec",
    //     t.tv_sec, t.tv_nsec
    // );

    while get_time_ms() * 1_000_000usize - begin < waittime {
        if let Some(signo) = check_if_any_sig_for_current_task() {
            if remain as usize != 0 {
                let mut buffer = UserBuffer::new(
                    translated_byte_buffer(token, remain, size_of::<Timespec>()).unwrap(),
                );
                buffer.write(calculate_left_timespec(endtime).as_bytes());
            }
            ready_to_handle_signal(signo);
        }
        suspend_current_and_run_next();
    }
    Ok(0)
}
