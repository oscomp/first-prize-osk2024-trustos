use alloc::sync::Arc;

use crate::{drivers::BlockDeviceImpl, sync::SyncUnsafeCell};

use super::{KSigAction, SigSet, SIG_MAX_NUM};
// struct task_struct {
//  int sigpending;
//  struct signal_struct *sig;
//  sigset_t blocked;
//  struct sigpending pending;
// }

// struct k_sigaction {
// 	struct sigaction sa;
// };

pub struct SigPending {
    pub inner: SyncUnsafeCell<SigPendingInner>,
}

impl SigPending {
    pub fn new() -> Self {
        Self {
            inner: SyncUnsafeCell::new(SigPendingInner::new()),
        }
    }
    pub fn from_another(another: &Arc<SigPending>) -> Self {
        Self {
            inner: SyncUnsafeCell::new(SigPendingInner::from_another(another.get_ref())),
        }
    }
    pub fn get_ref(&self) -> &SigPendingInner {
        self.inner.get_unchecked_ref()
    }
    pub fn get_mut(&self) -> &mut SigPendingInner {
        self.inner.get_unchecked_mut()
    }

    pub fn need_handle(&self, sig: SigSet) -> bool {
        let pend = &self.get_ref();
        pend.pending.contains(sig) && !pend.blocked.contains(sig)
    }
    pub fn blocked(&self) -> SigSet {
        self.get_ref().blocked
    }
    pub fn blocked_mut(&self) -> &mut SigSet {
        &mut self.get_mut().blocked
    }
    pub fn pending(&self) -> SigSet {
        self.get_mut().pending
    }
    pub fn pending_mut(&self) -> &mut SigSet {
        &mut self.get_mut().pending
    }
    pub fn is_pending(&self, sig: SigSet) -> bool {
        self.get_ref().pending.contains(sig)
    }

    pub fn action(&self, signo: usize) -> KSigAction {
        self.get_ref().actions[signo]
    }
    pub fn set_action(&self, signo: usize, act: KSigAction) {
        self.get_mut().actions[signo] = act
    }
    pub fn exit_code(&self) -> i32 {
        self.get_ref().group_exit_code.unwrap()
    }
    pub fn is_exited(&self) -> bool {
        self.get_ref().group_exit_code.is_some()
    }
    pub fn not_exited(&self) -> bool {
        self.get_ref().group_exit_code.is_none()
    }
    pub fn set_exit_code(&self, exit_code: i32) {
        self.get_mut().group_exit_code = Some(exit_code)
    }
}

pub struct SigPendingInner {
    pending: SigSet,
    blocked: SigSet,
    actions: [KSigAction; SIG_MAX_NUM + 1],
    group_exit_code: Option<i32>,
}

impl SigPendingInner {
    pub fn new() -> Self {
        Self {
            pending: SigSet::empty(),
            blocked: SigSet::empty(),
            actions: [KSigAction::default(); SIG_MAX_NUM + 1],
            group_exit_code: None,
        }
    }
    pub fn from_another(other: &SigPendingInner) -> Self {
        Self {
            pending: SigSet::empty(),
            blocked: SigSet::empty(),
            actions: other.actions.clone(),
            group_exit_code: None,
        }
    }
}
