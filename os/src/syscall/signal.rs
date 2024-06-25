use log::debug;

use crate::{
    mm::{translated_ref, translated_refmut},
    signal::{
        restore_frame, send_access_signal, send_signal_to_thread, send_signal_to_thread_group,
        KSigAction, SigAction, SigOp, SigSet, SIG_MAX_NUM,
    },
    task::{current_task, current_token, suspend_current_and_run_next},
    timer::{get_time_spec, Timespec},
    utils::{SysErrNo, SyscallRet},
};

pub fn sys_rt_sigaction(
    signo: usize,
    act: *const SigAction,
    old_act: *mut SigAction,
) -> SyscallRet {
    if signo > SIG_MAX_NUM {
        return Err(SysErrNo::EINVAL);
    }
    debug!("[sys_rt_sigaction] start");
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let token = task_inner.user_token();
    if old_act as usize != 0 {
        let sig_handler = &task_inner.sig_pending.get_ref().actions[signo].act;
        *translated_refmut(token, old_act) = *sig_handler;
    }
    if act as usize != 0 {
        let mut new_act = *translated_ref(token, act);
        let new_sig: KSigAction = if new_act.sa_handler == 0 || new_act.sa_handler == 1 {
            KSigAction::new(signo, false)
        } else {
            KSigAction {
                act: new_act,
                customed: true,
            }
        };
        task_inner.sig_pending.get_mut().actions[signo] = new_sig;
    }
    Ok(0)
}

pub fn sys_rt_sigreturn() -> SyscallRet {
    restore_frame();
    Ok(0)
}

pub fn sys_rt_sigprocmask(how: u32, set: *const SigSet, old_set: *mut SigSet) -> SyscallRet {
    const SIG_BLOCK: u32 = 0;
    const SIG_UNBLOCK: u32 = 1;
    const SIG_SETMASK: u32 = 2;
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let token = task_inner.user_token();
    if old_set as usize != 0 {
        *translated_refmut(token, old_set) = task_inner.sig_pending.get_ref().blocked;
    }
    if set as usize != 0 {
        let mut mask = *translated_ref(token, set);
        match how {
            SIG_BLOCK => task_inner.sig_pending.get_mut().blocked |= mask,
            SIG_UNBLOCK => task_inner.sig_pending.get_mut().blocked &= !mask,
            SIG_SETMASK => task_inner.sig_pending.get_mut().blocked = mask,
            _ => return Err(SysErrNo::EINVAL),
        }
    }
    Ok(0)
}
/// 在指定时间内挂起给定信号
pub fn sys_rt_sigtimedwait(
    sig: *const SigSet,
    _info: usize,
    timeout: *const Timespec,
) -> SyscallRet {
    let token = current_token();
    let sig = *translated_ref(token, sig);
    let timeout = *translated_ref(token, timeout);

    let end_time = timeout + get_time_spec();
    loop {
        let task = current_task().unwrap();
        let mut task_inner = task.inner_lock();
        for signum in 1..(SIG_MAX_NUM + 1) {
            let signal = SigSet::from_sig(signum);
            if sig.contains(signal) && task_inner.sig_pending.get_ref().pending.contains(signal) {
                task_inner.sig_pending.get_mut().pending &= !signal;
                return Ok(signum);
            }
        }
        if get_time_spec() > end_time {
            return Err(SysErrNo::EAGAIN);
        } else {
            drop(task_inner);
            drop(task);
            suspend_current_and_run_next();
        }
    }
}
///暂时将调用线程的信号掩码替换为 mask 给出的掩码，然后暂停线程，直到传递信号，
/// 其操作是调用信号处理程序或终止进程
/// 始终返回 -1
pub fn sys_rt_sigsuspend(mask: *const SigSet) -> SyscallRet {
    let token = current_token();
    let mut mask = *translated_ref(token, mask);

    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let old_mask = task_inner.sig_pending.get_mut().blocked;
    task_inner.sig_pending.get_mut().blocked = mask;
    drop(task_inner);
    drop(task);
    loop {
        let task = current_task().unwrap();
        let mut task_inner = task.inner_lock();
        for signum in 1..(SIG_MAX_NUM + 1) {
            let signal = SigSet::from_sig(signum);
            if task_inner.sig_pending.get_ref().pending.contains(signal) {
                let sigaction = task_inner.sig_pending.get_mut().actions[signum];
                match sigaction.act.sa_handler {
                    // 缺省操作
                    0 => {
                        if signal.default_op() == SigOp::Terminate {
                            return Ok(usize::MAX);
                        }
                    }
                    // 忽略信号
                    1 => {}
                    // 返回到用户的信号处理程序
                    _ => {
                        task_inner.sig_pending.get_mut().blocked = old_mask;
                        return Err(SysErrNo::EINTR);
                    }
                };
            }
        }
        drop(task_inner);
        drop(task);
        suspend_current_and_run_next();
    }
}

// pid == 0 then sig is sent to every process in the process group of current process
/// pid == -1 then sig is sent to every process which current process has permission ( except init proc )
/// pid > 0 then sig is sent to the process with the ID specified by pid
/// pid < -1 the sig is sent to every process in process group whose ID is -pid
pub fn sys_kill(pid: isize, signo: usize) -> SyscallRet {
    let sig = SigSet::from_sig(signo);
    match pid {
        _ if pid > 0 => send_signal_to_thread_group(pid as usize, sig),
        0 => send_signal_to_thread_group(current_task().unwrap().pid(), sig),
        -1 => send_access_signal(current_task().unwrap().tid(), sig),
        _ => {
            send_signal_to_thread_group(-pid as usize, sig);
        }
    }
    Ok(0)
}

pub fn sys_tkill(tid: usize, signo: usize) -> SyscallRet {
    let sig = SigSet::from_sig(signo);
    send_signal_to_thread(tid, sig);
    Ok(0)
}
