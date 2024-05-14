use alloc::{collections::VecDeque, sync::Arc};

use crate::sync::SyncUnsafeCell;

use super::{KSigAction, SigAction, SigSet, SIG_MAX_NUM};
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
}

pub struct SigPendingInner {
    pub pending: SigSet,
    pub blocked: SigSet,
    pub actions: [KSigAction; SIG_MAX_NUM + 1],
    pub group_exit_code: Option<i32>,
}

impl SigPendingInner {
    pub fn new() -> Self {
        Self {
            pending: SigSet::empty(),
            blocked: SigSet::empty(),
            actions: [KSigAction::new(0, false); SIG_MAX_NUM + 1],
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
