use log::debug;

use crate::{
    mm::{get_data, put_data},
    signal::{
        restore_frame, send_access_signal, send_signal_to_thread, send_signal_to_thread_group,
        KSigAction, SigAction, SigInfo, SigOp, SigSet, SIG_MAX_NUM,
    },
    syscall::SignalMaskFlag,
    task::{current_task, current_token, suspend_current_and_run_next},
    timer::{add_stopped_task_timer, get_time_spec, Timespec},
    utils::{backtrace, SysErrNo, SyscallRet},
};

pub fn sys_rt_sigaction(
    signo: usize,
    act: *const SigAction,
    old_act: *mut SigAction,
) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();
    if old_act as usize != 0 {
        let sig_act = task_inner.sig_table.action(signo).act;
        put_data(token, old_act, sig_act);
    }
    if act as usize != 0 {
        let new_act = get_data(token, act);
        debug!(
            "[sys_rt_sigaction] sig is {:?}, act is {:?}",
            SigSet::from_sig(signo),
            new_act
        );
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
        task_inner.sig_table.set_action(signo, new_sig);
    }
    Ok(0)
}

pub fn sys_rt_sigreturn() -> SyscallRet {
    restore_frame()
}

pub fn sys_rt_sigprocmask(how: u32, set: *const SigSet, old_set: *mut SigSet) -> SyscallRet {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let token = task_inner.user_token();
    let how = SignalMaskFlag::from_bits(how).ok_or(SysErrNo::EINVAL)?;

    if old_set as usize != 0 {
        put_data(token, old_set, task_inner.sig_mask)
    }
    if set as usize != 0 {
        let mask = get_data(token, set);
        debug!(
            "[sys_sigprocmask] how is {:?}, mask is {:?}, old_set is {:x}",
            how, mask, old_set as usize
        );
        // let mut blocked = &mut task_inner.sig_mask;
        match how {
            SignalMaskFlag::SIG_BLOCK => task_inner.sig_mask |= mask,
            SignalMaskFlag::SIG_UNBLOCK => task_inner.sig_mask &= !mask,
            SignalMaskFlag::SIG_SETMASK => task_inner.sig_mask = mask,
            _ => return Err(SysErrNo::EINVAL),
        }
    }
    Ok(0)
}
/// 在指定时间内挂起给定信号
pub fn sys_rt_sigtimedwait(
    _sig: *const SigSet,
    _info: *mut SigInfo,
    _timeout: *const Timespec,
) -> SyscallRet {
    Ok(0)
    // if timeout.is_null() {
    //     return Err(SysErrNo::EINVAL);
    // }
    // let task = current_task().unwrap();
    // let task_inner = task.inner_lock();
    // let token = task_inner.user_token();
    // let sig = get_data(token, sig);
    // let timeout = get_data(token, timeout);

    // debug!(
    //     "[sys_rt_sigtimedwait] signal:{:?},timeout:{:?}",
    //     sig, timeout
    // );
    // drop(task_inner);
    // add_stopped_task_timer(get_time_spec() + timeout, task);

    // stop_current_and_run_next();

    // let task = current_task().unwrap();
    // let task_inner = task.inner_lock();
    // let token = task_inner.user_token();
    // if !task_inner.sig_pending.is_empty() {
    //     match (task_inner.sig_pending & sig).peek_front() {
    //         Some(signo) => {
    //             if !info.is_null() {
    //                 put_data(token, info, SigInfo::new(signo, 0, 0));
    //             }
    //             Ok(signo)
    //         }
    //         None => Err(SysErrNo::EINTR),
    //     }
    // } else {
    //     Err(SysErrNo::EAGAIN)
    // }
}
/// 暂时将调用线程的信号掩码替换为 mask 给出的掩码，然后暂停线程，直到传递信号，
/// 其操作是调用信号处理程序或终止进程
pub fn sys_rt_sigsuspend(mask: *const SigSet) -> SyscallRet {
    // TODO(ZMY): 暂停线程
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let token = task_inner.user_token();
    let mask = get_data(token, mask);
    let old_mask = task_inner.sig_mask;
    task_inner.sig_mask = mask;
    drop(task_inner);
    drop(task);
    loop {
        let task = current_task().unwrap();
        let mut task_inner = task.inner_lock();
        if !task_inner.sig_pending.is_empty() {
            task_inner.sig_mask = old_mask;
            return Err(SysErrNo::EINTR);
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
        0 => {
            todo!()
            // send_signal_to_thread_group(current_task().unwrap().pid(), sig)
        }
        -1 => {
            todo!()
            // send_access_signal(current_task().unwrap().tid(), sig)
        }
        _ => {
            todo!()
            // send_signal_to_thread_group(-pid as usize, sig);
        }
    }
    Ok(0)
}

pub fn sys_tkill(tid: usize, signo: usize) -> SyscallRet {
    let sig = SigSet::from_sig(signo);
    debug!("[sys_tkill] thread {} receive signal {:?}", tid, sig);
    send_signal_to_thread(tid, sig);
    Ok(0)
}

pub fn sys_tgkill(tgid: usize, tid: usize, signo: usize) -> SyscallRet {
    let sig = SigSet::from_sig(signo);

    debug!(
        "[sys_tgkill] tgid is {}, tid is {}, sig is {:?}",
        tgid, tid, sig
    );

    unimplemented!();
    // send_signal_to_one_thread_of_thread_group(tgid, tid, sig);
    // Ok(0)
}
