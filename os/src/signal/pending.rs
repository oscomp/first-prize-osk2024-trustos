use alloc::collections::VecDeque;

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
    pub pending: SigSet,
    pub blocked: SigSet,
    pub actions: [KSigAction; SIG_MAX_NUM + 1],
}

impl SigPending {
    pub fn new() -> Self {
        Self {
            pending: SigSet::empty(),
            blocked: SigSet::empty(),
            actions: [KSigAction::new(0, false); SIG_MAX_NUM + 1],
        }
    }
    pub fn from_another(other: &SigPending) -> Self {
        Self {
            pending: SigSet::empty(),
            blocked: SigSet::empty(),
            actions: other.actions.clone(),
        }
    }
}
