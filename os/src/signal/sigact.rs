use alloc::sync::Arc;

use crate::sync::SyncUnsafeCell;

use super::{KSigAction, SIG_MAX_NUM};
// struct task_struct {
//  int sigpending;
//  struct signal_struct *sig;
//  sigset_t blocked;
//  struct sigpending pending;
// }

// struct k_sigaction {
// 	struct sigaction sa;
// };

pub struct SigTable {
    pub inner: SyncUnsafeCell<SigPendingInner>,
}

impl SigTable {
    pub fn new() -> Self {
        Self {
            inner: SyncUnsafeCell::new(SigPendingInner::new()),
        }
    }
    pub fn from_another(another: &Arc<SigTable>) -> Self {
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
    actions: [KSigAction; SIG_MAX_NUM + 1],
    group_exit_code: Option<i32>,
}

impl SigPendingInner {
    pub fn new() -> Self {
        Self {
            actions: [KSigAction::default(); SIG_MAX_NUM + 1],
            group_exit_code: None,
        }
    }
    pub fn from_another(other: &SigPendingInner) -> Self {
        Self {
            actions: other.actions.clone(),
            group_exit_code: None,
        }
    }
}
