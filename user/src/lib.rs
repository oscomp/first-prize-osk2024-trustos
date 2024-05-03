#![no_std]
#![feature(linkage)]
#![feature(panic_info_message)]
#![feature(alloc_error_handler)]

#[macro_use]
pub mod console;
mod lang_items;
mod syscall;

extern crate alloc;
#[macro_use]
extern crate bitflags;

use buddy_system_allocator::LockedHeap;
use syscall::*;

const USER_HEAP_SIZE: usize = 32768;

static mut HEAP_SPACE: [u8; USER_HEAP_SIZE] = [0; USER_HEAP_SIZE];

#[global_allocator]
static HEAP: LockedHeap = LockedHeap::empty();

#[alloc_error_handler]
pub fn handle_alloc_error(layout: core::alloc::Layout) -> ! {
    panic!("Heap allocation error, layout = {:?}", layout);
}

#[no_mangle]
#[link_section = ".text.entry"]
pub extern "C" fn _start() -> ! {
    unsafe {
        HEAP.lock()
            .init(HEAP_SPACE.as_ptr() as usize, USER_HEAP_SIZE);
    }
    exit(main());
}

#[linkage = "weak"]
#[no_mangle]
fn main() -> i32 {
    panic!("Cannot find main!");
}

bitflags! {
    pub struct OpenFlags: u32 {
        const O_RDONLY = 0;
        const O_WRONLY = 1 << 0;
        const O_RDWR = 1 << 1;
        const O_CREATE = 1 << 6;
        const O_TRUNC = 1 << 10;
        const O_DIRECTROY = 1 << 21;
    }
}

pub fn openat(fd: isize, path: &str, flags: OpenFlags, mode: usize) -> isize {
    sys_openat(fd, path, flags.bits, mode)
}
pub fn close(fd: usize) -> isize {
    sys_close(fd)
}
pub fn read(fd: usize, buf: &mut [u8], count: usize) -> isize {
    sys_read(fd, buf, count)
}
pub fn write(fd: usize, buf: &[u8], count: usize) -> isize {
    sys_write(fd, buf, count)
}
pub fn exit(exit_code: i32) -> ! {
    sys_exit(exit_code);
}
pub fn yield_() -> isize {
    sys_yield()
}
pub fn shutdown() -> isize {
    println!("shutdown!");
    sys_shutdown()
}

/// 如果参数为0 跟踪所有
pub fn strace(mask: usize) -> isize {
    let mask = if mask == 0 { usize::MAX } else { mask };
    sys_strace(mask)
}

/// 返回ms
pub fn get_time() -> isize {
    let mut time_sepc: [usize; 2] = [0, 0];
    unsafe {
        sys_gettimeofday(core::slice::from_raw_parts_mut(
            &mut time_sepc as *mut usize as *mut u8,
            2 * core::mem::size_of::<usize>(),
        ));
    }
    return (time_sepc[0] * 1000 + time_sepc[1] / 100000) as isize;
}
pub fn getpid() -> isize {
    sys_getpid()
}
pub fn fork() -> isize {
    sys_fork()
}
pub fn exec(path: &str) -> isize {
    sys_exec(path)
}
pub fn busy() {
    strace(0);
    sys_busy();
}
pub fn wait(exit_code: &mut i32) -> isize {
    sys_waitpid(-1, exit_code as *mut _, 0)
}

pub fn waitpid(pid: usize, exit_code: &mut i32) -> isize {
    sys_waitpid(pid as isize, exit_code as *mut _, 0)
}

pub struct Timespec {
    pub tv_sec: usize,  //秒
    pub tv_nsec: usize, //纳秒
}

pub fn sleep(period_ms: usize) {
    let mut req: [usize; 2] = [0, period_ms * 1_000_000];
    let mut rem: [usize; 2] = [0, 0];
    unsafe {
        use ::core::slice::from_raw_parts_mut;
        use core::mem::size_of;
        sys_nanosleep(
            from_raw_parts_mut(&mut req as *mut usize as *mut _, size_of::<Timespec>()),
            from_raw_parts_mut(&mut rem as *mut usize as *mut _, size_of::<Timespec>()),
        );
    }
}

pub fn getcwd(buf: &mut [u8], size: usize) -> isize {
    sys_getcwd(buf, size)
}

pub fn dup(fd: usize) -> isize {
    sys_dup(fd)
}

pub fn dup2(old: usize, new: usize, _zero: usize) -> isize {
    sys_dup3(old, new)
}

pub fn chdir(path: &str) -> isize {
    sys_chdir(path)
}

pub fn mkdir(dirfd: isize, path: &str, mode: usize) -> isize {
    sys_mkdirat(dirfd, path, mode)
}

pub fn getdents(fd: usize, buf: &mut [u8], len: usize) -> isize {
    sys_getdents64(fd, buf, len)
}

pub fn link(oldfd: isize, oldpath: &str, newfd: isize, newpath: &str, flags: u32) -> isize {
    sys_linkat(oldfd, oldpath, newfd, newpath, flags)
}

pub fn unlink(dirfd: isize, path: &str, flags: OpenFlags) -> isize {
    sys_unlinkat(dirfd, path, flags.bits)
}

pub fn umount(special: &str, flags: u32) -> isize {
    sys_umount2(special, flags)
}

pub fn mount(special: &str, dir: &str, ftype: &str, flags: u32, data: &mut [u8]) -> isize {
    sys_mount(special, dir, ftype, flags, data)
}

pub fn fstat(fd: usize, kst: &mut [u8]) -> isize {
    sys_fstat(fd, kst)
}

pub fn pipe(fd: &mut [u32], zero: isize) -> isize {
    sys_pipe2(fd, zero)
}

pub fn getppid() -> isize {
    sys_getppid()
}

pub fn times(tms: &mut [u8]) -> isize {
    sys_times(tms)
}
