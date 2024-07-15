use log::debug;

use crate::{
    mm::{get_data, put_data},
    signal::{
        restore_frame, send_access_signal, send_signal_to_one_thread_of_thread_group,
        send_signal_to_thread, send_signal_to_thread_group, KSigAction, SigAction, SigOp, SigSet,
        SIG_MAX_NUM,
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
    debug!(
        "[sys_rt_sigaction] sig is {:?}, act is {:x}, old_act is {:x}",
        SigSet::from_sig(signo),
        act as usize,
        old_act as usize
    );
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();
    if old_act as usize != 0 {
        let sig_act = task_inner.sig_pending.action(signo).act;
        put_data(token, old_act, sig_act);
    }
    if act as usize != 0 {
        let new_act = get_data(token, act);
        let new_sig: KSigAction = if new_act.sa_handler == 0 {
            KSigAction::new(signo, false)
        } else if new_act.sa_handler == 1 {
            // 忽略
            KSigAction::ignore()
        } else {
            KSigAction {
                act: new_act,
                customed: true,
            }
        };
        task_inner.sig_pending.set_action(signo, new_sig);
    }
    Ok(0)
}

pub fn sys_rt_sigreturn() -> SyscallRet {
    restore_frame()
}

pub fn sys_rt_sigprocmask(how: u32, set: *const SigSet, old_set: *mut SigSet) -> SyscallRet {
    const SIG_BLOCK: u32 = 0;
    const SIG_UNBLOCK: u32 = 1;
    const SIG_SETMASK: u32 = 2;
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    debug!(
        "[sys_sigprocmask] how is {}, set is {:x}, old_set is {:x}",
        how, set as usize, old_set as usize
    );
    // backtrace();

    if old_set as usize != 0 {
        put_data(token, old_set, task_inner.sig_pending.blocked())
    }
    if set as usize != 0 {
        let mask = get_data(token, set);
        let blocked = task_inner.sig_pending.blocked_mut();
        match how {
            SIG_BLOCK => *blocked |= mask,
            SIG_UNBLOCK => *blocked &= !mask,
            SIG_SETMASK => *blocked = mask,
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
    let sig = get_data(token, sig);
    let timeout = get_data(token, timeout);

    let end_time = timeout + get_time_spec();
    loop {
        // debug!(
        //     "[sys_rt_sigtimedwait] sig={:?}, info:{:#x}, timeout={:?}",
        //     sig, _info, timeout
        // );
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        for signum in 1..(SIG_MAX_NUM + 1) {
            let signal = SigSet::from_sig(signum);
            if sig.contains(signal) && task_inner.sig_pending.is_pending(signal) {
                *task_inner.sig_pending.pending_mut() &= !signal;
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
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();
    let mask = get_data(token, mask);
    let old_mask = task_inner.sig_pending.blocked();
    *task_inner.sig_pending.blocked_mut() = mask;
    drop(task_inner);
    drop(task);
    loop {
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        for signum in 1..(SIG_MAX_NUM + 1) {
            let signal = SigSet::from_sig(signum);
            if task_inner.sig_pending.is_pending(signal) {
                let sigaction = task_inner.sig_pending.action(signum);
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
                        *task_inner.sig_pending.blocked_mut() = old_mask;
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

    debug!("[sys_kill] pid is {}, sig is {:?}", pid, sig);

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

pub fn sys_tgkill(tgid: usize, tid: usize, signo: usize) -> SyscallRet {
    let sig = SigSet::from_sig(signo);

    debug!(
        "[sys_tgkill] tgid is {}, tid is {}, sig is {:?}",
        tgid, tid, sig
    );

    send_signal_to_one_thread_of_thread_group(tgid, tid, sig);
    Ok(0)
}
