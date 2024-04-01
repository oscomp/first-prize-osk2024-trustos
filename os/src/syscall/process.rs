use core::mem::size_of;

use crate::fs::{open, open_file, OpenFlags};
use crate::mm::{
    translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer, VirtAddr,
};
use crate::syscall::CloneFlags;
use crate::task::{
    add_task, current_task, current_user_token, exit_current_and_run_next,
    suspend_current_and_run_next,
};
use crate::timer::{get_time_ms, Timespec, Tms};
use alloc::sync::Arc;
use log::{debug, info};

pub fn sys_exit(exit_code: i32) -> ! {
    exit_current_and_run_next(exit_code);
    panic!("Unreachable in sys_exit!");
}

pub fn sys_sched_yield() -> isize {
    suspend_current_and_run_next();
    0
}

pub fn sys_gettimeofday(ts: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let mut ts = UserBuffer::new(translated_byte_buffer(
        token,
        ts,
        core::mem::size_of::<Timespec>(),
    ));
    let mut timespec = Timespec::new(get_time_ms() / 1000, (get_time_ms() % 1000) * 1000000);
    ts.write(timespec.as_bytes());
    0
}

pub fn sys_times(tms: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let mut tms = UserBuffer::new(translated_byte_buffer(
        token,
        tms,
        core::mem::size_of::<Timespec>(),
    ));
    let mut times = Tms::new(&inner.time_data);
    tms.write(times.as_bytes());
    0
}

pub fn sys_getpid() -> isize {
    current_task().unwrap().pid() as isize
}

pub fn sys_getppid() -> isize {
    current_task().unwrap().ppid() as isize
}

pub fn sys_gettid() -> isize {
    current_task().unwrap().tid() as isize
}

/// void (*fn)(void* arg) 参数通过栈传递,如果stack_ptr!=0, fn=0(stack),arg=8(stack)
pub fn sys_clone(
    flags: usize,
    stack_ptr: usize,
    parent_tid_ptr: usize,
    tls_ptr: usize,
    chilren_tid_ptr: usize,
) -> isize {
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
        new_pid as isize
    } else {
        unimplemented!();
    }
}

pub fn sys_execve(path: *const u8, mut argv: *const usize, _envp: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let path = translated_str(token, path);

    //处理argv参数
    let mut argv_vec = alloc::vec::Vec::<alloc::string::String>::new();
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

    let task = current_task().unwrap();
    let cwd = task.inner_lock().current_path.clone();
    if let Some(app_inode) = open(&cwd, path.as_str(), OpenFlags::O_RDONLY) {
        let all_data = app_inode.read_all();
        task.inner_lock().file = Some(app_inode.clone());
        task.exec(all_data.as_slice(), &argv_vec);
        task.inner_lock().memory_set.activate();
        debug!("sys_exec end");
        0
    } else {
        -1
    }
}
/// 等待子进程状态发生变化,即子进程终止或被信号停止或被信号挂起
pub fn sys_wait4(pid: isize, wstatus: *mut i32, options: i32) -> isize {
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
            return -1;
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
            return found_pid as isize;
        } else {
            drop(inner);
            drop(task);
            suspend_current_and_run_next();
        }
    }
}

pub fn sys_nanosleep(req: *const u8, _rem: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let req = translated_ref(token, req as *const Timespec);

    let begin = get_time_ms();
    let waittime = req.tv_sec * 1000 + req.tv_nsec / 1000000;

    loop {
        let now = get_time_ms();
        if now - begin >= waittime {
            break;
        }
    }
    0
}

pub struct Utsname {
    sysname: [u8; 65],
    nodename: [u8; 65],
    release: [u8; 65],
    version: [u8; 65],
    machine: [u8; 65],
    domainname: [u8; 65],
}
pub fn sys_uname(buf: *mut u8) -> isize {
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
    let token = current_user_token().unwrap();
    let mut buf_vec = translated_byte_buffer(token, buf, size_of::<Utsname>());
    let mut userbuf = UserBuffer::new(buf_vec);
    userbuf.write(unsafe {
        core::slice::from_raw_parts(
            &uname as *const _ as usize as *const u8,
            size_of::<Utsname>(),
        )
    });
    0
}

pub fn sys_brk(brk_addr: usize) -> isize {
    let former_addr = current_task().unwrap().growproc(0);
    if brk_addr == 0 {
        return former_addr as isize;
    }
    let grow_size: isize = (brk_addr - former_addr) as isize;
    current_task().unwrap().growproc(grow_size) as isize
}
