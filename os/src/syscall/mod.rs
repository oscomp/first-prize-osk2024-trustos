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
    Chdir = 49,
    Openat = 56,
    Close = 57,
    Pipe2 = 59,
    Getdents64 = 61,
    Read = 63,
    Write = 64,
    Fstat = 80,
    Exit = 93,
    Nanosleep = 101,
    ClockGettime = 113,
    SchedSetaffinity = 122,
    SchedGetaffinity = 123,
    SchedYield = 124,
    Times = 153,
    Uname = 160,
    Gettimeofday = 169,
    Getpid = 172,
    Getppid = 173,
    Gettid = 178,
    Brk = 214,
    Munmap = 215,
    Clone = 220,
    Mmap = 222,
    Execve = 221,
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
mod time;

use fs::*;
use memory::*;
pub use options::*;
use process::*;
use time::*;

use crate::console::print;
use crate::sbi::shutdown;
use log::debug;
/// handle syscall exception with `syscall_id` and other arguments
pub fn syscall(syscall_id: usize, args: [isize; 6]) -> isize {
    debug!("syscall:{}", syscall_id);
    let syscall_id: Syscall = Syscall::from(syscall_id);
    match syscall_id {
        Syscall::Getcwd => sys_getcwd(args[0] as *const u8, args[1] as usize),
        Syscall::Dup => sys_dup(args[0] as usize),
        Syscall::Dup3 => sys_dup3(args[0] as usize, args[1] as usize),
        Syscall::Mkdirat => sys_mkdirat(args[0], args[1] as *const u8, args[2] as usize),
        Syscall::Unlinkat => sys_unlinkat(args[0], args[1] as *const u8, args[2] as u32),
        Syscall::Linkat => sys_linkat(
            args[0],
            args[1] as *const u8,
            args[2],
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
        Syscall::Chdir => sys_chdir(args[0] as *const u8),
        Syscall::Openat => sys_openat(
            args[0],
            args[1] as *const u8,
            args[2] as u32,
            args[3] as usize,
        ),
        Syscall::Close => sys_close(args[0] as usize),
        Syscall::Pipe2 => sys_pipe2(args[0] as *mut u32),
        Syscall::Getdents64 => {
            sys_getdents64(args[0] as usize, args[1] as *const u8, args[2] as usize)
        }
        Syscall::Read => sys_read(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Write => sys_write(args[0] as usize, args[1] as *const u8, args[2] as usize),
        Syscall::Fstat => sys_fstat(args[0] as usize, args[1] as *const u8),
        Syscall::Exit => sys_exit(args[0] as i32),
        Syscall::Nanosleep => sys_nanosleep(args[0] as *const u8, args[1] as *const u8),
        Syscall::ClockGettime => sys_clock_gettime(args[0] as usize, args[1] as *const u8),
        Syscall::SchedSetaffinity => {
            sys_sched_setaffinity(args[0] as usize, args[1] as usize, args[2] as usize)
        }
        Syscall::SchedGetaffinity => {
            sys_sched_getaffinity(args[0] as usize, args[1] as usize, args[2] as usize)
        }
        Syscall::SchedYield => sys_sched_yield(),
        Syscall::Times => sys_times(args[0] as *const u8),
        Syscall::Gettimeofday => sys_gettimeofday(args[0] as *const u8),
        Syscall::Uname => sys_uname(args[0] as *mut u8),
        Syscall::Getpid => sys_getpid(),
        Syscall::Getppid => sys_getppid(),
        Syscall::Gettid => sys_gettid(),
        Syscall::Clone => sys_clone(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
            args[4] as usize,
        ),
        Syscall::Brk => sys_brk(args[0] as usize),
        Syscall::Execve => sys_execve(
            args[0] as *const u8,
            args[1] as *const usize,
            args[2] as *const usize,
        ),
        Syscall::Mmap => sys_mmap(
            args[0] as usize,
            args[1] as usize,
            args[2] as u32,
            args[3] as u32,
            args[4] as usize,
            args[5] as usize,
        ),
        Syscall::Munmap => sys_munmap(args[0] as usize, args[1] as usize),
        Syscall::Wait4 => sys_wait4(args[0] as isize, args[1] as *mut i32, args[2] as i32),
        Syscall::Shutdown => shutdown(false),
        Syscall::Strace => sys_strace(args[0] as usize),
        _ => panic!("Unsupported syscall_id: {:?}", syscall_id),
    }
}
