pub mod pending;
pub mod signal;

use alloc::sync::Arc;
use log::{debug, info};
pub use pending::*;
pub use signal::*;

use crate::{
    mm::{translated_ref, translated_refmut},
    task::{current_task, TaskControlBlock},
    trap::TrapContext,
};

pub const SIG_MAX_NUM: usize = 33;
pub const SIG_ERR: usize = usize::MAX;
pub const SIG_DFL: usize = 0;
pub const SIG_IGN: usize = 1;

extern "C" {
    pub fn sigreturn_trampoline();
}

pub fn check_signal_for_current_task() {
    for signo in 1..(SIG_MAX_NUM + 1) {
        let task = current_task().unwrap();
        let task_inner = task.inner_lock();
        let sig = SigSet::from_sig(signo);
        if task_inner.sig_pending.pending.contains(sig)
            && !task_inner.sig_pending.blocked.contains(sig)
        {
            debug!("handle signal {}", signo);

            let sig_act = task_inner.sig_pending.actions[signo];
            drop(task_inner);
            drop(task);
            handle_signal(signo, sig_act);
            return;
        }
    }
}

pub fn handle_signal(signo: usize, sig_action: KSigAction) {
    if sig_action.customed {
        setup_frame(signo, sig_action);
        let task = current_task().unwrap();
        let mut task_inner = task.inner_lock();
        task_inner.sig_pending.blocked |= sig_action.act.sa_mask;
        task_inner.sig_pending.blocked |= SigSet::from_sig(signo);
        task_inner.sig_pending.pending ^= SigSet::from_sig(signo);
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
pub fn setup_frame(signo: usize, sig_action: KSigAction) {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    let mut trap_cx = task_inner.trap_cx();
    let mut user_sp = trap_cx.x[2];

    // 保存 Trap 上下文
    user_sp -= core::mem::size_of::<TrapContext>();
    *translated_refmut(token, user_sp as *mut TrapContext) = *trap_cx;

    // signal mask
    user_sp -= core::mem::size_of::<SigSet>();
    *translated_refmut(token, user_sp as *mut SigSet) = task_inner.sig_pending.blocked;

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
    trap_cx.x[10] = signo;
}
/// 恢复栈帧
pub fn restore_frame() {
    let task = current_task().unwrap();
    let mut task_inner = task.inner_lock();
    let token = task_inner.user_token();

    let trap_cx = task_inner.trap_cx();
    let mut user_sp = trap_cx.x[2];

    let checkout = *translated_ref(token, user_sp as *const usize);
    assert!(checkout == 0xdeadbeef, "restore frame checkout error!");
    user_sp += core::mem::size_of::<usize>();
    // signal mask
    task_inner.sig_pending.blocked = *translated_ref(token, user_sp as *const SigSet);
    user_sp += core::mem::size_of::<SigSet>();
    // Trap cx
    *trap_cx = *translated_ref(token, user_sp as *const TrapContext);
    user_sp += core::mem::size_of::<TrapContext>();
}

pub fn add_signal(task: Arc<TaskControlBlock>, signal: SigSet) {
    let mut task_inner = task.inner_lock();
    task_inner.sig_pending.pending |= signal;
}
