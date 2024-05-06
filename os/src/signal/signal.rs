/// 仿照Linux signal实现
pub const SIGHUP: usize = 1; /* Hangup.  */
pub const SIGINT: usize = 2; /* Interactive attention signal.  */
pub const SIGQUIT: usize = 3; /* Quit.  */
pub const SIGILL: usize = 4; /* Illegal instruction.  */
pub const SIGTRAP: usize = 5; /* Trace/breakpoint trap.  */
// aka SIGIOT
pub const SIGABRT: usize = 6; /* Abnormal termination.  */
pub const SIGBUS: usize = 7; /* Bus error.  */
pub const SIGFPE: usize = 8; /* Erroneous arithmetic operation.  */
pub const SIGKILL: usize = 9; /* Killed.  */
pub const SIGUSR1: usize = 10;
pub const SIGSEGV: usize = 11; /* Invalid access to storage.  */
pub const SIGUSR2: usize = 12;
pub const SIGPIPE: usize = 13; /* Broken pipe.  */
pub const SIGALRM: usize = 14; /* Alarm clock.  */
pub const SIGTERM: usize = 15; /* Termination request.  */
pub const SIGSTKFLT: usize = 16; /* Stack fault (obsolete).  */
// aka SIGCLD
pub const SIGCHLD: usize = 17; /* Child terminated or stopped.  */
pub const SIGCONT: usize = 18; /* Continue.  */
pub const SIGSTOP: usize = 19; /* Stop, unblockable.  */
pub const SIGTSTP: usize = 20; /* Keyboard stop.  */
pub const SIGTTIN: usize = 21; /* Background read from control terminal.  */
pub const SIGTTOU: usize = 22; /* Background write to control terminal.  */
pub const SIGURG: usize = 23; /* Urgent data is available at a socket.  */
pub const SIGXCPU: usize = 24; /* CPU time limit exceeded.  */
pub const SIGXFSZ: usize = 25; /* File size limit exceeded.  */
pub const SIGVTALRM: usize = 26; /* Virtual timer expired.  */
pub const SIGPROF: usize = 27; /* Profiling timer expired.  */
pub const SIGWINCH: usize = 28; /* Window size change (4.3 BSD, Sun).  */
// aka SIGPOLL
pub const SIGIO: usize = 29; /* Pollable event occurred (System V).  */
pub const SIGPWR: usize = 30; /* Power failure imminent.  */
pub const SIGSYS: usize = 31; /* Bad system call.  */
pub const SIGRTMIN: usize = 32;
// User Custom
pub const SIGRT_1: usize = SIGRTMIN + 1;

/// Signal位图
bitflags! {
    pub struct SigSet: usize {
        const SIGHUP    = 1 << SIGHUP;
        const SIGINT    = 1 << SIGINT;
        const SIGQUIT   = 1 << SIGQUIT;
        const SIGILL    = 1 << SIGILL;
        const SIGTRAP   = 1 << SIGTRAP;
        const SIGABRT   = 1 << SIGABRT;
        const SIGBUS    = 1 << SIGBUS;
        const SIGFPE    = 1 << SIGFPE;
        const SIGKILL   = 1 << SIGKILL;
        const SIGUSR1   = 1 << SIGUSR1;
        const SIGSEGV   = 1 << SIGSEGV;
        const SIGUSR2   = 1 << SIGUSR2;
        const SIGPIPE   = 1 << SIGPIPE;
        const SIGALRM   = 1 << SIGALRM;
        const SIGTERM   = 1 << SIGTERM;
        const SIGSTKFLT = 1 << SIGSTKFLT;
        const SIGCHLD   = 1 << SIGCHLD;
        const SIGCONT   = 1 << SIGCONT;
        const SIGSTOP   = 1 << SIGSTOP;
        const SIGTSTP   = 1 << SIGTSTP;
        const SIGTTIN   = 1 << SIGTTIN;
        const SIGTTOU   = 1 << SIGTTOU;
        const SIGURG    = 1 << SIGURG;
        const SIGXCPU   = 1 << SIGXCPU;
        const SIGXFSZ   = 1 << SIGXFSZ;
        const SIGVTALRM = 1 << SIGVTALRM;
        const SIGPROF   = 1 << SIGPROF;
        const SIGWINCH  = 1 << SIGWINCH;
        const SIGIO     = 1 << SIGIO;
        const SIGPWR    = 1 << SIGPWR;
        const SIGSYS    = 1 << SIGSYS;
        const SIGRTMIN  = 1 << SIGRTMIN;
        const SIGRT_1   = 1 << SIGRT_1;
    }
}

// typedef void (*__sighandler_t)(int);

// struct sigaction {
// 	__sighandler_t sa_handler;
// 	unsigned long sa_flags;
// 	void (*sa_restorer)(void);
// 	sigset_t sa_mask;
// };
#[repr(C)]
#[derive(Clone, Copy)]
pub struct SigAction {
    pub sa_handler: usize,
    pub sa_flags: usize,
    pub sa_restore: usize,
    pub sa_mask: SigSet,
}
