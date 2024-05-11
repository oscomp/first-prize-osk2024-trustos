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
    Mkdirat = 34,
    Unlinkat = 35,
    Linkat = 37,
    Umount2 = 39,
    Mount = 40,
    Statfs = 43,
    Faccessat = 48,
    Chdir = 49,
    Openat = 56,
    Close = 57,
    Pipe2 = 59,
    Getdents64 = 61,
    Read = 63,
    Write = 64,
    Fstatat = 79,
    Fstat = 80,
    Exit = 93,
    Exitgroup = 94,
    Settidaddress = 96,
    Nanosleep = 101,
    ClockGettime = 113,
    SchedSetaffinity = 122,
    SchedGetaffinity = 123,
    SchedYield = 124,
    SigKill = 129,
    Sigaction = 134,
    SigReturn = 139,
    Times = 153,
    Uname = 160,
    Gettimeofday = 169,
    Getpid = 172,
    Getppid = 173,
    Getuid = 174,
    Geteuid = 175,
    Getgid = 176,
    Getegid = 177,
    Gettid = 178,
    Sysinfo = 179,
    Brk = 214,
    Munmap = 215,
    Clone = 220,
    Mmap = 222,
    Execve = 221,
    Mprotect = 226,
    Wait4 = 260,
    // 非标准系统调用
    Shutdown = 1000,
    Strace = 2000,
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

use crate::{console::print, sbi::shutdown, signal::SigAction, utils::SyscallRet};
use log::{debug, info};
/// handle syscall exception with `syscall_id` and other arguments
pub fn syscall(syscall_id: usize, args: [usize; 6]) -> SyscallRet {
    // debug!("syscall:{}", syscall_id);
    let id = syscall_id;
    let syscall_id: Syscall = Syscall::from(syscall_id);
    debug!("syscall:{:?}", syscall_id);
    match syscall_id {
        Syscall::Getcwd => sys_getcwd(args[0] as *const u8, args[1]),
        Syscall::Dup => sys_dup(args[0]),
        Syscall::Dup3 => sys_dup3(args[0], args[1]),
        Syscall::Mkdirat => sys_mkdirat(args[0] as isize, args[1] as *const u8, args[2]),
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
            args[3],
        ),
        Syscall::Close => sys_close(args[0]),
        Syscall::Pipe2 => sys_pipe2(args[0] as *mut u32),
        Syscall::Getdents64 => {
            sys_getdents64(args[0] as usize, args[1] as *const u8, args[2] as usize)
        }
        Syscall::Read => sys_read(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Write => sys_write(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Fstatat => sys_fstatat(
            args[0] as isize,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as usize,
        ),
        Syscall::Fstat => sys_fstat(args[0] as usize, args[1] as *const u8),
        Syscall::Exit | Syscall::Exitgroup => sys_exit(args[0] as i32),
        Syscall::Settidaddress => sys_settidaddress(args[0]),
        Syscall::Nanosleep => sys_nanosleep(args[0] as *const u8, args[1] as *const u8),
        Syscall::ClockGettime => sys_clock_gettime(args[0], args[1] as *const u8),
        Syscall::SchedSetaffinity => sys_sched_setaffinity(args[0], args[1], args[2]),
        Syscall::SchedGetaffinity => sys_sched_getaffinity(args[0], args[1], args[2]),
        Syscall::SchedYield => sys_sched_yield(),
        Syscall::SigKill => sys_kill(args[0], args[0]),
        Syscall::Sigaction => sys_rt_sigaction(
            args[0],
            args[1] as *const SigAction,
            args[2] as *mut SigAction,
        ),
        Syscall::SigReturn => sys_rt_sigreturn(),
        Syscall::Times => sys_times(args[0] as *const u8),
        Syscall::Gettimeofday => sys_gettimeofday(args[0] as *const u8),
        Syscall::Uname => sys_uname(args[0] as *mut u8),
        Syscall::Getpid => sys_getpid(),
        Syscall::Getppid => sys_getppid(),
        Syscall::Getuid => sys_getuid(),
        Syscall::Geteuid => sys_geteuid(),
        Syscall::Getgid => sys_getgid(),
        Syscall::Getegid => sys_getegid(),
        Syscall::Gettid => sys_gettid(),
        Syscall::Sysinfo => sys_sysinfo(args[0] as *const u8),
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
        Syscall::Wait4 => sys_wait4(args[0] as isize, args[1] as *mut i32, args[2] as i32),
        Syscall::Shutdown => shutdown(false),
        Syscall::Strace => sys_strace(args[0]),
        _ => panic!("Unsupported syscall_id: {}", id),
    }
}
