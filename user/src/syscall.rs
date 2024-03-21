#![allow(dead_code)]
use core::arch::asm;

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
const SYSCALL_GETTIMEOFDAY: usize = 169;
const SYSCALL_GETPID: usize = 172;
const SYSCALL_GETPPID: usize = 173;
const SYSCALL_FORK: usize = 220;
const SYSCALL_EXECVE: usize = 221;
const SYSCALL_WAIT4: usize = 260;

fn syscall(id: usize, args: [isize; 6]) -> isize {
    let mut ret: isize;
    unsafe {
        asm!(
            "ecall",
            inlateout("x10") args[0] => ret,
            in("x11") args[1],
            in("x12") args[2],
            in("x13") args[3],
            in("x14") args[4],
            in("x15") args[5],
            in("x17") id
        );
    }
    ret
}

pub fn sys_openat(fd: isize, path: &str, flags: u32, mode: usize) -> isize {
    syscall(
        SYSCALL_OPENAT,
        [
            fd,
            path.as_ptr() as isize,
            flags as isize,
            mode as isize,
            0,
            0,
        ],
    )
}

pub fn sys_close(fd: usize) -> isize {
    syscall(SYSCALL_CLOSE, [fd as isize, 0, 0, 0, 0, 0])
}

pub fn sys_read(fd: usize, buffer: &mut [u8], count: usize) -> isize {
    syscall(
        SYSCALL_READ,
        [
            fd as isize,
            buffer.as_mut_ptr() as isize,
            count as isize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_write(fd: usize, buffer: &[u8], count: usize) -> isize {
    syscall(
        SYSCALL_WRITE,
        [
            fd as isize,
            buffer.as_ptr() as isize,
            count as isize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_exit(exit_code: i32) -> ! {
    syscall(SYSCALL_EXIT, [exit_code as isize, 0, 0, 0, 0, 0]);
    panic!("sys_exit never returns!");
}

pub fn sys_yield() -> isize {
    syscall(SYSCALL_SCHED_YIELD, [0, 0, 0, 0, 0, 0])
}

pub fn sys_gettimeofday(ts: &mut [u8]) -> isize {
    syscall(
        SYSCALL_GETTIMEOFDAY,
        [ts.as_mut_ptr() as isize, 0, 0, 0, 0, 0],
    )
}

pub fn sys_getpid() -> isize {
    syscall(SYSCALL_GETPID, [0, 0, 0, 0, 0, 0])
}

pub fn sys_fork() -> isize {
    syscall(SYSCALL_FORK, [0, 0, 0, 0, 0, 0])
}

pub fn sys_exec(path: &str) -> isize {
    syscall(SYSCALL_EXECVE, [path.as_ptr() as isize, 0, 0, 0, 0, 0])
}

pub fn sys_waitpid(pid: isize, exit_code: *mut i32, options: i32) -> isize {
    syscall(
        SYSCALL_WAIT4,
        [pid as isize, exit_code as isize, options as isize, 0, 0, 0],
    )
}
pub fn sys_getcwd(buf: &mut [u8], size: usize) -> isize {
    syscall(
        SYSCALL_GETCWD,
        [buf.as_mut_ptr() as isize, size as isize, 0, 0, 0, 0],
    )
}

pub fn sys_dup(fd: usize) -> isize {
    syscall(SYSCALL_DUP, [fd as isize, 0, 0, 0, 0, 0])
}

pub fn sys_dup3(old: usize, new: usize) -> isize {
    syscall(SYSCALL_DUP3, [old as isize, new as isize, 0, 0, 0, 0])
}

pub fn sys_chdir(path: &str) -> isize {
    syscall(SYSCALL_CHDIR, [path.as_ptr() as isize, 0, 0, 0, 0, 0])
}

pub fn sys_mkdirat(dirfd: isize, path: &str, mode: usize) -> isize {
    syscall(
        SYSCALL_MKDIRAT,
        [dirfd, path.as_ptr() as isize, mode as isize, 0, 0, 0],
    )
}

pub fn sys_getdents64(fd: usize, buf: &mut [u8], len: usize) -> isize {
    syscall(
        SYSCALL_GETDENTS64,
        [
            fd as isize,
            buf.as_mut_ptr() as isize,
            len as isize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_linkat(oldfd: isize, oldpath: &str, newfd: isize, newpath: &str, flags: u32) -> isize {
    syscall(
        SYSCALL_LINKAT,
        [
            oldfd,
            oldpath.as_ptr() as isize,
            newfd,
            newpath.as_ptr() as isize,
            flags as isize,
            0,
        ],
    )
}

pub fn sys_unlinkat(dirfd: isize, path: &str, flags: u32) -> isize {
    syscall(
        SYSCALL_UNLINKAT,
        [dirfd, path.as_ptr() as isize, flags as isize, 0, 0, 0],
    )
}

pub fn sys_umount2(special: &str, flags: u32) -> isize {
    syscall(
        SYSCALL_UMOUNT2,
        [special.as_ptr() as isize, flags as isize, 0, 0, 0, 0],
    )
}

pub fn sys_mount(special: &str, dir: &str, ftype: &str, flags: u32, data: &mut [u8]) -> isize {
    syscall(
        SYSCALL_MOUNT,
        [
            special.as_ptr() as isize,
            dir.as_ptr() as isize,
            ftype.as_ptr() as isize,
            flags as isize,
            data.as_ptr() as isize,
            0,
        ],
    )
}

pub fn sys_fstat(fd: usize, kst: &mut [u8]) -> isize {
    syscall(
        SYSCALL_FSTAT,
        [fd as isize, kst.as_mut_ptr() as isize, 0, 0, 0, 0],
    )
}

pub fn sys_pipe2(fd: &mut [u32], _zero: isize) -> isize {
    syscall(SYSCALL_PIPE2, [fd.as_mut_ptr() as isize, 0, 0, 0, 0, 0])
}

pub fn sys_getppid() -> isize {
    syscall(SYSCALL_GETPPID, [0, 0, 0, 0, 0, 0])
}

pub fn sys_times(tms: &mut [u8]) -> isize {
    syscall(SYSCALL_TIMES, [tms.as_mut_ptr() as isize, 0, 0, 0, 0, 0])
}

pub fn sys_nanosleep(req: &mut [u8], rem: &mut [u8]) -> isize {
    syscall(
        SYSCALL_NANOSLEEP,
        [
            req.as_mut_ptr() as isize,
            rem.as_mut_ptr() as isize,
            0,
            0,
            0,
            0,
        ],
    )
}
