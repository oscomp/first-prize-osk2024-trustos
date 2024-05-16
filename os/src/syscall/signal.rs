use log::{debug, info};

use crate::{
    mm::{translated_ref, translated_refmut},
    signal::{
        add_signal, restore_frame, send_access_signal, send_signal_to_thread_group, KSigAction,
        SigAction, SigSet, SIG_MAX_NUM,
    },
    task::{current_task, tid2task},
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
