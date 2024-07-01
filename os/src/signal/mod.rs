pub mod pending;
pub mod signal;

use alloc::sync::Arc;
use log::debug;
pub use pending::*;
pub use signal::*;

use crate::{
    mm::{translated_ref, translated_refmut},
    task::{current_task, TaskControlBlock, THREAD_GROUP, TID_TO_TASK},
    trap::TrapContext,
    utils::{SysErrNo, SyscallRet},
};

pub const SIG_MAX_NUM: usize = 33;
pub const SIG_ERR: usize = usize::MAX;
pub const SIG_DFL: usize = 0;
pub const SIG_IGN: usize = 1;

extern "C" {
    pub fn sigreturn_trampoline();
}

pub fn check_if_any_sig_for_current_task() -> Option<usize> {
    for signo in 1..(SIG_MAX_NUM + 1) {
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        let sig = SigSet::from_sig(signo);
        if task_inner.sig_pending.need_handle(sig) {
            return Some(signo);
        }
    }
    None
}

pub fn ready_to_handle_signal(signo: usize) {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    debug!("handle signal {:?}", SigSet::from_sig(signo));
    let sig_act = task_inner.sig_pending.get_ref().actions[signo];
    drop(task_inner);
    drop(task);
    handle_signal(signo, sig_act);
}

pub fn handle_signal(signo: usize, sig_action: KSigAction) {
    if sig_action.customed {
        setup_frame(signo, sig_action);
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        let sig_pending = task_inner.sig_pending.get_mut();
        sig_pending.blocked |= sig_action.act.sa_mask;
        sig_pending.blocked |= SigSet::from_sig(signo);
        sig_pending.pending ^= SigSet::from_sig(signo);
    } else {
        // 就在S模式运行,转换成fn(i32)
        let handler: fn(i32) =
            unsafe { core::mem::transmute(sig_action.act.sa_handler as *const ()) };
        handler(signo as i32);
    }
}
/// 在用户态栈空间构建一个 Frame
/// 构建这个帧的目的就是为了执行完信号处理程序后返回到内核态，
/// 并恢复原来内核栈的内容
pub fn setup_frame(_signo: usize, sig_action: KSigAction) {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    let trap_cx = task_inner.trap_cx();
    let mut user_sp = trap_cx.x[2];

    // 保存 Trap 上下文
    user_sp -= core::mem::size_of::<TrapContext>();
    *translated_refmut(token, user_sp as *mut TrapContext) = *trap_cx;

    // signal mask
    user_sp -= core::mem::size_of::<SigSet>();
    *translated_refmut(token, user_sp as *mut SigSet) = task_inner.sig_pending.get_ref().blocked;

    // checkout(Magic Num)
    user_sp -= core::mem::size_of::<usize>();
    *translated_refmut(token, user_sp as *mut usize) = 0xdeadbeef;

    // 修改Trap
    trap_cx.sepc = sig_action.act.sa_handler;
    // ra
    trap_cx.x[1] = sigreturn_trampoline as usize;
    // sp
    trap_cx.x[2] = user_sp;
    // a0
    trap_cx.x[10] = -(SysErrNo::EINTR as isize) as usize;
}
/// 恢复栈帧
pub fn restore_frame() -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    let trap_cx = task_inner.trap_cx();
    let mut user_sp = trap_cx.x[2];

    let checkout = *translated_ref(token, user_sp as *const usize);
    assert!(checkout == 0xdeadbeef, "restore frame checkout error!");
    user_sp += core::mem::size_of::<usize>();
    // signal mask
    task_inner.sig_pending.get_mut().blocked = *translated_ref(token, user_sp as *const SigSet);
    user_sp += core::mem::size_of::<SigSet>();
    // Trap cx
    *trap_cx = *translated_ref(token, user_sp as *const TrapContext);

    Ok(trap_cx.x[10])
    // user_sp += core::mem::size_of::<TrapContext>();
}

pub fn add_signal(task: Arc<TaskControlBlock>, signal: SigSet) {
    let task_inner = task.inner_lock();
    task_inner.sig_pending.get_mut().pending |= signal;
}

pub fn send_signal_to_thread_group(pid: usize, sig: SigSet) {
    let thread_group = THREAD_GROUP.lock();
    if let Some(tasks) = thread_group.get(&pid) {
        for task in tasks.iter() {
            add_signal(task.clone(), sig);
        }
    }
}

pub fn send_signal_to_thread(tid: usize, sig: SigSet) {
    let tid2task = TID_TO_TASK.lock();
    if let Some(task) = tid2task.get(&tid) {
        add_signal(Arc::clone(task), sig);
    }
}

pub fn send_signal_to_one_thread_of_thread_group(pid: usize, tid: usize, sig: SigSet) {
    let thread_group = THREAD_GROUP.lock();
    if let Some(tasks) = thread_group.get(&pid) {
        for task in tasks.iter() {
            if task.tid() == tid {
                add_signal(task.clone(), sig);
            }
        }
    }
}

// 目前的进程组只是一个进程的所有子进程的集合
pub fn send_signal_to_process_group(_pid: usize, _sig: SigSet) {
    todo!()
}

/// 向除自身以及 `init` 进程之外的所有进程发送信号
pub fn send_access_signal(tid: usize, sig: SigSet) {
    TID_TO_TASK
        .lock()
        .iter()
        .filter(|(k, _)| **k != tid && **k != 0)
        .for_each(|(_, task)| add_signal(task.clone(), sig));
}
