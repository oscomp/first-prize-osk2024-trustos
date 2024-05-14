use log::{debug, info};

use crate::{
    mm::{translated_ref, translated_refmut},
    signal::{add_signal, restore_frame, KSigAction, SigAction, SigSet, SIG_MAX_NUM},
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

// pid == 0 then sig is sent to every process in the process group of current process
/// pid == -1 then sig is sent to every process which current process has permission ( except init proc )
/// pid > 0 then sig is sent to the process with the ID specified by pid
/// pid < -1 the sig is sent to every process in process group whose ID is -pid
pub fn sys_kill(pid: usize, signo: usize) -> SyscallRet {
    match pid {
        _ if pid > 0 => {
            // 目前没有线程组,发送给单进程
            if let Some(task) = tid2task(pid) {
                add_signal(task, SigSet::from_sig(signo));
            }
        }
        _ => {
            unimplemented!()
        }
    }
    Ok(0)
}
