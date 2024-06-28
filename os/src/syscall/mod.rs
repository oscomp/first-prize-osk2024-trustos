//! Implementation of syscalls
//!
//! The single entry point to all system calls, [`syscall()`], is called
//! whenever userspace wishes to perform a system call using the `ecall`
//! instruction. In this case, the processor raises an 'Environment call from
//! U-mode' exception, which is handled as one of the cases in
//! [`crate::trap::trap_handler`].
//!
//! For clarity, each single syscall is implemented as its own function, named
//! `sys_` then the name of the syscall. You can find functions like this in
//! submodules, and you should also implement syscalls this way.
use num_enum::FromPrimitive;
#[derive(Debug, PartialEq, FromPrimitive)]
#[repr(usize)]
pub enum Syscall {
    Getcwd = 17,
    Dup = 23,
    Dup3 = 24,
    Fcntl = 25,
    Ioctl = 29,
    Mkdirat = 34,
    Unlinkat = 35,
    // Symlinkat = 36,
    Linkat = 37,
    Umount2 = 39,
    Mount = 40,
    Statfs = 43,
    Ftruncate = 46,
    Faccessat = 48,
    Chdir = 49,
    Openat = 56,
    Close = 57,
    Pipe2 = 59,
    Getdents64 = 61,
    Lseek = 62,
    Read = 63,
    Write = 64,
    Readv = 65,
    Writev = 66,
    Pread64 = 67,
    Pwrite64 = 68,
    Sendfile = 71,
    Pselect6 = 72,
    Ppoll = 73,
    Readlinkat = 78,
    Fstatat = 79,
    Fstat = 80,
    Sync = 81,
    Fsync = 82,
    Utimensat = 88,
    Exit = 93,
    Exitgroup = 94,
    Settidaddress = 96,
    Nanosleep = 101,
    Setitimer = 103,
    ClockGettime = 113,
    ClockGetres = 114,
    Syslog = 116,
    SchedSetScheduler = 119,
    SchedGetScheduler = 120,
    SchedGetParam = 121,
    SchedSetaffinity = 122,
    SchedGetaffinity = 123,
    SchedYield = 124,
    SigKill = 129,
    Tkill = 130,
    Sigsupend = 133,
    Sigaction = 134,
    Sigprocmask = 135,
    Sigtimedwait = 137,
    SigReturn = 139,
    Times = 153,
    Setpgid = 154,
    Getpgid = 155,
    Uname = 160,
    Getrusage = 165,
    Umask = 166,
    Gettimeofday = 169,
    Getpid = 172,
    Getppid = 173,
    Getuid = 174,
    Geteuid = 175,
    Getgid = 176,
    Getegid = 177,
    Gettid = 178,
    Sysinfo = 179,
    Shmget = 194,
    Shmctl = 195,
    Shmat = 196,
    Brk = 214,
    Munmap = 215,
    Clone = 220,
    Mmap = 222,
    Execve = 221,
    Mprotect = 226,
    Madvise = 233,
    Wait4 = 260,
    Prlimit = 261,
    Renameat2 = 276,
    Getrandom = 278,
    CopyFileRange = 285,
    // 非标准系统调用
    Shutdown = 1000,
    #[num_enum(default)]
    Default = 0,
}

mod fs;
mod memory;
mod options;
mod process;
mod signal;
mod time;

use fs::*;
use memory::*;
pub use options::*;
use process::*;
use signal::*;
use time::*;

use crate::{
    sbi::shutdown,
    signal::{SigAction, SigSet},
    timer::Timespec,
    utils::SyscallRet,
};
use log::debug;

/// handle syscall exception with `syscall_id` and other arguments
pub fn syscall(syscall_id: usize, args: [usize; 6]) -> SyscallRet {
    // debug!("syscall:{}", syscall_id);
    let id = syscall_id;
    let syscall_id: Syscall = Syscall::from(syscall_id);
    debug!("syscall:{:?}", syscall_id);
    match syscall_id {
        Syscall::Getcwd => sys_getcwd(args[0] as *const u8, args[1]),
        Syscall::Dup => sys_dup(args[0]),
        Syscall::Dup3 => sys_dup3(args[0], args[1], args[2] as u32),
        Syscall::Fcntl => sys_fcntl(args[0] as usize, args[1] as usize, args[2] as usize),
        Syscall::Ioctl => sys_ioctl(args[0] as usize, args[1] as usize, args[2] as usize),
        Syscall::Mkdirat => sys_mkdirat(args[0] as isize, args[1] as *const u8, args[2] as u32),
        Syscall::Unlinkat => sys_unlinkat(args[0] as isize, args[1] as *const u8, args[2] as u32),
        Syscall::Linkat => sys_linkat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as isize,
            args[3] as *const u8,
            args[4] as u32,
        ),
        Syscall::Umount2 => sys_umount2(args[0] as *const u8, args[1] as u32),
        Syscall::Mount => sys_mount(
            args[0] as *const u8,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as u32,
            args[4] as *const u8,
        ),
        Syscall::Statfs => sys_statfs(args[0] as *const u8, args[1] as *const u8),
        Syscall::Ftruncate => sys_ftruncate(args[0] as usize, args[1] as i32),
        Syscall::Faccessat => sys_faccessat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as u32,
            args[3] as usize,
        ),
        Syscall::Chdir => sys_chdir(args[0] as *const u8),
        Syscall::Openat => sys_openat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as u32,
            args[3] as u32,
        ),
        Syscall::Close => sys_close(args[0]),
        Syscall::Pipe2 => sys_pipe2(args[0] as *mut u32),
        Syscall::Getdents64 => {
            sys_getdents64(args[0] as usize, args[1] as *const u8, args[2] as usize)
        }
        Syscall::Lseek => sys_lseek(args[0] as usize, args[1] as isize, args[2] as usize),
        Syscall::Read => sys_read(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Write => sys_write(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Readv => sys_readv(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Writev => sys_writev(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Pread64 => sys_pread64(
            args[0] as usize,
            args[1] as *const u8,
            args[2] as usize,
            args[3] as isize,
        ),
        Syscall::Pwrite64 => sys_pwrite64(
            args[0] as usize,
            args[1] as *const u8,
            args[2] as usize,
            args[3] as isize,
        ),
        Syscall::Sendfile => sys_sendfile(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
        ),
        Syscall::Pselect6 => sys_pselect6(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
            args[4] as usize,
            args[5] as usize,
        ),
        Syscall::Ppoll => sys_ppoll(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
        ),
        Syscall::Readlinkat => sys_readlinkat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as usize,
        ),
        Syscall::Fstatat => sys_fstatat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as usize,
        ),
        Syscall::Fstat => sys_fstat(args[0] as usize, args[1] as *const u8),
        Syscall::Sync => sys_sync(),
        Syscall::Fsync => sys_fsync(args[0] as usize),
        Syscall::Utimensat => sys_utimensat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as usize,
        ),
        Syscall::Exit => sys_exit(args[0] as i32),
        Syscall::Exitgroup => sys_exit_group(args[0] as i32),
        Syscall::Settidaddress => sys_settidaddress(args[0]),
        Syscall::Nanosleep => sys_nanosleep(args[0] as *const u8, args[1] as *const u8),
        Syscall::Setitimer => sys_setitimer(args[0] as usize, args[1] as usize, args[2] as usize),
        Syscall::ClockGettime => sys_clock_gettime(args[0], args[1] as *const u8),
        Syscall::ClockGetres => sys_clock_getres(args[0] as usize, args[1] as *const u8),
        Syscall::Syslog => sys_syslog(args[0] as isize, args[1] as *const u8, args[2] as usize),
        Syscall::SchedSetScheduler => {
            sys_sched_setscheduler(args[0] as usize, args[1] as usize, args[2] as *const u8)
        }
        Syscall::SchedGetScheduler => sys_sched_getscheduler(args[0] as usize),
        Syscall::SchedGetParam => sys_sched_getparam(args[0] as usize, args[1] as *const u8),
        Syscall::SchedSetaffinity => {
            sys_sched_setaffinity(args[0] as usize, args[1] as usize, args[2] as usize)
        }
        Syscall::SchedGetaffinity => {
            sys_sched_getaffinity(args[0] as usize, args[1] as usize, args[2] as usize)
        }
        Syscall::SchedYield => sys_sched_yield(),
        Syscall::SigKill => sys_kill(args[0] as isize, args[0]),
        Syscall::Tkill => sys_tkill(args[0] as usize, args[1] as usize),
        Syscall::Sigsupend => sys_rt_sigsuspend(args[0] as *const SigSet),
        Syscall::Sigaction => sys_rt_sigaction(
            args[0],
            args[1] as *const SigAction,
            args[2] as *mut SigAction,
        ),
        Syscall::Sigprocmask => sys_rt_sigprocmask(
            args[0] as u32,
            args[1] as *const SigSet,
            args[2] as *mut SigSet,
        ),
        Syscall::Sigtimedwait => sys_rt_sigtimedwait(
            args[0] as *const SigSet,
            args[1],
            args[2] as *const Timespec,
        ),
        Syscall::SigReturn => sys_rt_sigreturn(),
        Syscall::Times => sys_times(args[0] as *const u8),
        Syscall::Setpgid => Ok(0),
        Syscall::Getpgid => Ok(0),
        Syscall::Getrusage => sys_getrusage(args[0] as isize, args[1] as *const u8),
        Syscall::Gettimeofday => sys_gettimeofday(args[0] as *const u8),
        Syscall::Umask => sys_umask(args[0] as u32),
        Syscall::Uname => sys_uname(args[0] as *mut u8),
        Syscall::Getpid => sys_getpid(),
        Syscall::Getppid => sys_getppid(),
        Syscall::Getuid => sys_getuid(),
        Syscall::Geteuid => sys_geteuid(),
        Syscall::Getgid => sys_getgid(),
        Syscall::Getegid => sys_getegid(),
        Syscall::Gettid => sys_gettid(),
        Syscall::Sysinfo => sys_sysinfo(args[0] as *const u8),
        Syscall::Shmget => sys_shmget(args[0] as usize, args[1] as usize, args[2] as u32),
        Syscall::Shmctl => sys_shmctl(args[0] as usize, args[1] as usize, args[2] as usize),
        Syscall::Shmat => sys_shmat(args[0] as usize, args[1] as usize, args[2] as u32),
        Syscall::Clone => sys_clone(args[0], args[1], args[2], args[3], args[4]),
        Syscall::Brk => sys_brk(args[0]),
        Syscall::Execve => sys_execve(
            args[0] as *const u8,
            args[1] as *const usize,
            args[2] as *const usize,
        ),
        Syscall::Mmap => sys_mmap(
            args[0],
            args[1],
            args[2] as u32,
            args[3] as u32,
            args[4],
            args[5],
        ),
        Syscall::Munmap => sys_munmap(args[0], args[1]),
        Syscall::Mprotect => sys_mprotect(args[0], args[1], args[2] as u32),
        Syscall::Madvise => sys_madvise(args[0] as usize, args[1] as usize, args[2] as usize),
        Syscall::Wait4 => sys_wait4(args[0] as isize, args[1] as *mut i32, args[2] as i32),
        Syscall::Prlimit => sys_prlimit(
            args[0] as usize,
            args[1] as u32,
            args[2] as *const RLimit,
            args[3] as *mut RLimit,
        ),
        Syscall::Renameat2 => sys_renameat2(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as isize,
            args[3] as *const u8,
            args[4] as u32,
        ),
        Syscall::Getrandom => sys_getrandom(args[0] as *const u8, args[1] as usize, args[2] as u32),
        Syscall::CopyFileRange => sys_copy_file_range(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
            args[4] as usize,
            args[5] as u32,
        ),
        Syscall::Shutdown => shutdown(false),
        _ => panic!("Unsupported syscall_id: {}", id),
    }
}
