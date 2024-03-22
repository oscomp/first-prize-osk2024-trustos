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
const SYSCALL_GETCWD: usize = 17;
const SYSCALL_DUP: usize = 23;
const SYSCALL_DUP3: usize = 24;
const SYSCALL_MKDIRAT: usize = 34;
const SYSCALL_UNLINKAT: usize = 35;
const SYSCALL_LINKAT: usize = 37;
const SYSCALL_UMOUNT2: usize = 39;
const SYSCALL_MOUNT: usize = 40;
const SYSCALL_CHDIR: usize = 49;
const SYSCALL_OPENAT: usize = 56;
const SYSCALL_CLOSE: usize = 57;
const SYSCALL_PIPE2: usize = 59;
const SYSCALL_GETDENTS64: usize = 61;
const SYSCALL_READ: usize = 63;
const SYSCALL_WRITE: usize = 64;
const SYSCALL_FSTAT: usize = 80;
const SYSCALL_EXIT: usize = 93;
const SYSCALL_NANOSLEEP: usize = 101;
const SYSCALL_SCHED_YIELD: usize = 124;
const SYSCALL_TIMES: usize = 153;
const SYSCALL_UNAME: usize = 160;
const SYSCALL_GETTIMEOFDAY: usize = 169;
const SYSCALL_GETPID: usize = 172;
const SYSCALL_GETPPID: usize = 173;
const SYSCALL_GETTID: usize = 178;
const SYSCALL_CLONE: usize = 220;
const SYSCALL_BRK: usize = 214;
const SYSCALL_EXECVE: usize = 221;
const SYSCALL_WAIT4: usize = 260;

mod fs;
mod options;
mod process;

use fs::*;
use options::*;
use process::*;

use crate::console::print;
/// handle syscall exception with `syscall_id` and other arguments
pub fn syscall(syscall_id: usize, args: [isize; 6]) -> isize {
    match syscall_id {
        SYSCALL_GETCWD => sys_getcwd(args[0] as *const u8, args[1] as usize),
        SYSCALL_DUP => sys_dup(args[0] as usize),
        SYSCALL_DUP3 => sys_dup3(args[0] as usize, args[1] as usize),
        SYSCALL_MKDIRAT => sys_mkdirat(args[0], args[1] as *const u8, args[2] as usize),
        SYSCALL_UNLINKAT => sys_unlinkat(args[0], args[1] as *const u8, args[2] as u32),
        SYSCALL_LINKAT => sys_linkat(
            args[0],
            args[1] as *const u8,
            args[2],
            args[3] as *const u8,
            args[4] as u32,
        ),
        SYSCALL_UMOUNT2 => sys_umount2(args[0] as *const u8, args[1] as u32),
        SYSCALL_MOUNT => sys_mount(
            args[0] as *const u8,
            args[1] as *const u8,
            args[2] as *const u8,
            args[3] as u32,
            args[4] as *const u8,
        ),
        SYSCALL_CHDIR => sys_chdir(args[0] as *const u8),
        SYSCALL_OPENAT => sys_openat(
            args[0],
            args[1] as *const u8,
            args[2] as u32,
            args[3] as usize,
        ),
        SYSCALL_CLOSE => sys_close(args[0] as usize),
        SYSCALL_PIPE2 => sys_pipe2(args[0] as *mut u32),
        SYSCALL_GETDENTS64 => {
            sys_getdents64(args[0] as usize, args[1] as *const u8, args[2] as usize)
        }
        SYSCALL_READ => sys_read(args[0] as usize, args[1] as *const u8, args[2] as usize),
        SYSCALL_WRITE => sys_write(args[0] as usize, args[1] as *const u8, args[2] as usize),
        SYSCALL_FSTAT => sys_fstat(args[0] as usize, args[1] as *const u8),
        SYSCALL_EXIT => sys_exit(args[0] as i32),
        SYSCALL_NANOSLEEP => sys_nanosleep(args[0] as *const u8, args[1] as *const u8),
        SYSCALL_SCHED_YIELD => sys_sched_yield(),
        SYSCALL_TIMES => sys_times(args[0] as *const u8),
        SYSCALL_GETTIMEOFDAY => sys_gettimeofday(args[0] as *const u8),
        SYSCALL_UNAME => sys_uname(args[0] as *mut u8),
        SYSCALL_GETPID => sys_getpid(),
        SYSCALL_GETPPID => sys_getppid(),
        SYSCALL_GETTID => sys_gettid(),
        SYSCALL_CLONE => sys_clone(
            args[0] as usize,
            args[1] as usize,
            args[2] as usize,
            args[3] as usize,
            args[4] as usize,
        ),
        SYSCALL_BRK => sys_brk(args[0] as usize),
        SYSCALL_EXECVE => sys_execve(
            args[0] as *const u8,
            args[1] as *const usize,
            args[2] as *const u8,
        ),
        SYSCALL_WAIT4 => sys_wait4(args[0] as isize, args[1] as *mut i32, args[2] as i32),
        _ => panic!("Unsupported syscall_id: {}", syscall_id),
    }
}
