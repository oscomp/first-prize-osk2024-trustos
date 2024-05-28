use crate::{
    fs::{open, open_file, FileClass, Mode, OpenFlags},
    mm::{
        translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer,
        VirtAddr,
    },
    syscall::CloneFlags,
    task::{
        add_task, current_task, current_token, exit_current_and_run_next,
        exit_current_group_and_run_next, move_child_process_to_init, remove_all_from_thread_group,
        suspend_current_and_run_next, task_num, Sysinfo, PROCESS_GROUP,
    },
    timer::{get_time_ms, Timespec, Tms},
    utils::{SysErrNo, SyscallRet},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use core::mem::size_of;

use crate::config::sync::HART_NUM;
use crate::console::print;
use crate::task::manager::ready_procs_num;
use crate::task::processor::get_proc_by_hartid;
use crate::utils::hart_id;
use log::{debug, info};

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
    chilren_tid_ptr: usize,
) -> SyscallRet {
    let flags = CloneFlags::from_bits(flags as u32).unwrap();
    debug!("[sys_clone] flags {:?}", flags);

    // let stack = match stack_ptr {
    //     0 => None,
    //     stack => {
    //         debug!("[sys_clone] assign the user stack {:#x}", stack);
    //         Some(stack as usize)
    //     }
    // };
    let task = current_task().unwrap();
    let new_task = task.clone_process(
        flags,
        stack_ptr,
        parent_tid_ptr as *mut u32,
        tls_ptr,
        chilren_tid_ptr as *mut u32,
    );
    let task_inner = task.inner_lock();
    let new_tid = new_task.tid();
    // modify trap context of new_task, because it returns immediately after switching
    let trap_cx = new_task.inner_lock().trap_cx();
    // we do not have to move to next instruction since we have done it before
    // for child process, fork returns 0
    trap_cx.x[10] = 0;
    // add new task to scheduler
    add_task(new_task);
    Ok(new_tid)
}

pub fn sys_execve(path: *const u8, mut argv: *const usize, mut envp: *const usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();

    let token = task_inner.user_token();
    let path = translated_str(token, path);

    debug!("[sys_execve] path is {}", path);
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

    if path.starts_with('/') {
        if let Some(app_inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            let app_inode = match app_inode {
                FileClass::File(f) => f.clone(),
                FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
            };
            let elf_data = unsafe { app_inode.read_as_elf() };
            drop(task_inner);

            task.exec(elf_data, &argv_vec, &mut env);
            task.inner_lock().memory_set.activate();
            Ok(0)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        let now_path: String = task_inner.fs_info.get_cwd();
        if let Some(app_inode) = open(now_path.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
            let app_inode = match app_inode {
                FileClass::File(f) => f.clone(),
                FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
            };
            let elf_data = unsafe { app_inode.read_as_elf() };
            drop(task_inner);

            task.exec(elf_data, &argv_vec, &mut env);
            task.inner_lock().memory_set.activate();
            Ok(0)
        } else {
            Err(SysErrNo::ENOENT)
        }
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
    assert!(options == 0, "not support options yet");
    loop {
        let mut process_group = PROCESS_GROUP.lock();
        let task = current_task().unwrap();
        let mut task_inner = task.inner_lock();
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
                    "[sys_wait4] child {} exit with code {}, wstatus= {:#x}",
                    found_pid, exit_code, wstatus as usize
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
    let mut buf_vec = translated_byte_buffer(token, buf, size_of::<Utsname>()).unwrap();
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

pub fn sys_sysinfo(info: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut info =
        UserBuffer::new(translated_byte_buffer(token, info, size_of::<Sysinfo>()).unwrap());

    let ourinfo = Sysinfo::new(get_time_ms() / 1000, 1 << 56, task_num());
    info.write(ourinfo.as_bytes());
    debug!("[sys_sysinfo] ourinfo is {:?}", ourinfo);
    Ok(0)
}

pub fn sys_umask(mask: u32) -> SyscallRet {
    Ok(0)
}
