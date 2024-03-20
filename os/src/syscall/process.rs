use core::mem::size_of;

use crate::fs::{open, open_file, OpenFlags};
use crate::mm::{translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer, VirtAddr};
use crate::task::{
    add_task, current_task, current_user_token, exit_current_and_run_next,
    suspend_current_and_run_next,
};
use crate::timer::{Timespec,Tms,get_time_ms};
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
    let token = current_user_token();
    let mut ts = UserBuffer::new(translated_byte_buffer(token, ts,core::mem::size_of::<Timespec>()));
    let mut timespec = Timespec::new(get_time_ms()/1000,(get_time_ms()%1000)*1000000); 
    ts.write(timespec.as_bytes());
    0
}

pub fn sys_times(tms: *const u8) -> isize {
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let mut tms = UserBuffer::new(translated_byte_buffer(token, tms,core::mem::size_of::<Timespec>()));
    let mut times = Tms::new(&inner.time_data); 
    tms.write(times.as_bytes());
    0
}

pub fn sys_getpid() -> isize {
    current_task().unwrap().pid.0 as isize
}

pub fn sys_getppid() -> isize {
    if let Some(weak_parent) = current_task().unwrap().inner_lock().parent.clone() {
        if let Some(parent) = weak_parent.upgrade(){
            parent.pid.0 as isize
        } else {
            -1
        }
    } else {
        -1
    }
    
}

pub fn sys_fork() -> isize {
    let current_task = current_task().unwrap();
    let new_task = current_task.fork();
    let new_pid = new_task.pid.0;
    // modify trap context of new_task, because it returns immediately after switching
    let trap_cx = new_task.inner_lock().trap_cx();
    // we do not have to move to next instruction since we have done it before
    // for child process, fork returns 0
    trap_cx.x[10] = 0;
    // add new task to scheduler
    add_task(new_task);
    new_pid as isize
}

pub fn sys_exec(path: *const u8) -> isize {
    let token = current_user_token();
    let path = translated_str(token, path);
    let task = current_task().unwrap();
    let cwd = task.inner_lock().current_path.clone();
    if let Some(app_inode) = open(&cwd, path.as_str(), OpenFlags::O_RDONLY) {
        let all_data = app_inode.read_all();
        task.exec(all_data.as_slice());
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
    assert!(options == 0, "not support options yet");
    loop {
        let task = current_task().unwrap();
        // find a child process
        // ---- access current PCB exclusively
        let mut inner = task.inner_lock();
        if !inner
            .children
            .iter()
            .any(|p| pid == -1 || pid as usize == p.getpid())
        {
            return -1;
            // ---- release current PCB
        }
        let pair = inner.children.iter().enumerate().find(|(_, p)| {
            // ++++ temporarily access child PCB exclusively
            p.inner_lock().is_zombie() && (pid == -1 || pid as usize == p.getpid())
            // ++++ release child PCB
        });
        if let Some((idx, _)) = pair {
            let child = inner.children.remove(idx);
            // confirm that child will be deallocated after being removed from children list
            assert_eq!(
                Arc::strong_count(&child),
                1,
                "process{} cant recycled",
                child.getpid()
            );
            let found_pid = child.getpid();
            // ++++ temporarily access child PCB exclusively
            let exit_code = child.inner_lock().exit_code;
            // ++++ release child PCB
            if wstatus as usize != 0x0 {
                *translated_refmut(inner.memory_set.token(), wstatus) = exit_code;
            }
            return found_pid as isize;
        } else {
            drop(inner);
            drop(task);
            suspend_current_and_run_next();
        }
    }
}

/// If there is not a child process whose pid is same as given, return -1.
/// Else if there is a child process but it is still running, return -2.
#[allow(unused)]
pub fn sys_waitpid(pid: isize, exit_code_ptr: *mut i32) -> isize {
    let task = current_task().unwrap();
    // find a child process

    // ---- access current PCB exclusively
    let mut inner = task.inner_lock();
    if !inner
        .children
        .iter()
        .any(|p| pid == -1 || pid as usize == p.getpid())
    {
        return -1;
        // ---- release current PCB
    }
    let pair = inner.children.iter().enumerate().find(|(_, p)| {
        // ++++ temporarily access child PCB exclusively
        p.inner_lock().is_zombie() && (pid == -1 || pid as usize == p.getpid())
        // ++++ release child PCB
    });
    if let Some((idx, _)) = pair {
        let child = inner.children.remove(idx);
        // confirm that child will be deallocated after being removed from children list
        assert_eq!(
            Arc::strong_count(&child),
            1,
            "process{} cant recycled",
            child.getpid()
        );

        let mut childinner = child.inner_lock();

        inner.time_data.cutime += childinner.time_data.utime;
        inner.time_data.cstime += childinner.time_data.stime;

        let found_pid = child.getpid();
        // ++++ temporarily access child PCB exclusively
        let exit_code = childinner.exit_code;
        // ++++ release child PCB
        if exit_code_ptr as usize != 0x0 {
            *translated_refmut(inner.memory_set.token(), exit_code_ptr) = exit_code;
        }
        found_pid as isize
    } else {
        -2
    }
    // ---- release current PCB automatically
}

pub fn sys_nanosleep(req: *const u8, _rem: *const u8) ->isize {
    let token = current_user_token();
    let req =translated_ref(token, req as *const Timespec);

    let begin = get_time_ms();
    let waittime = req.tv_sec*1000+req.tv_nsec/1000000;

    loop{
        let now = get_time_ms();
        if now-begin >= waittime {
            break;
        }
    }
    0
}

pub struct Utsname{
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
        release:  str2u8("Alpha"),
        version:  str2u8("v1.0"),
        machine:  str2u8("RISC-V64"),
        domainname: str2u8("TrustOS"),
    };
    let token = current_user_token();
    let mut buf_vec = translated_byte_buffer(token, buf, size_of::<Utsname>());
    let mut userbuf = UserBuffer::new(buf_vec);
    userbuf.write(
        unsafe {
            core::slice::from_raw_parts(
                &uname as *const _ as usize as *const u8,
                size_of::<Utsname>(),
            )
        });
    0
}
