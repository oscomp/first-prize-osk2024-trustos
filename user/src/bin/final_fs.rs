#![no_std]
#![no_main]

use user_lib::{
    faccessat, fcntl, fstatat, lseek, mkdir, openat, statfs, FaccessatMode, Kstat, OpenFlags,
    Statfs,
};

#[macro_use]
extern crate user_lib;

fn test_fstatat() {
    println!("-----------------test fstatat-----------------");
    let mut kst = Kstat::new();
    mkdir(-100, "nihao\0", 0666);
    let result = fstatat(-100, "nihao\0", &mut kst, 0);
    println!("result is {} and kst is {:?}", result, kst);
    println!("-----------------end fstatat-----------------");
    println!("");
}

fn test_statfs() {
    println!("-----------------test statfs-----------------");
    let mut stat = Statfs::empty();
    let result = statfs(&mut stat);
    println!("result is {} and ourstatfs is {:?}", result, stat);
    println!("-----------------end statfs-----------------");
    println!("");
}

fn test_faccessat() {
    println!("-----------------test faccessat-----------------");
    let mode =
        FaccessatMode::F_OK | FaccessatMode::X_OK | FaccessatMode::W_OK | FaccessatMode::R_OK;
    mkdir(-100, "wohao1\0", 0666);
    println!("now test OK:");
    let result1 = faccessat(-100, "wohao1\0", mode, 0);
    println!("now test NOT OK:");
    let result2 = faccessat(-100, "wobuhao\0", mode, 0);
    println!("result1 is {} and result2 is {}", result1, result2);
    println!("-----------------end faccessat-----------------");
    println!("");
}

fn test_lseek() {
    println!("-----------------test lseek-----------------");
    mkdir(-100, "test_lseek\0", 0666);
    let fd = openat(-100, "test_lseek\0", OpenFlags::O_RDWR, 0);
    let result1 = lseek(fd as usize, -100, 2);
    let result2 = lseek(fd as usize, 100, 1);
    println!("result1 is {} which should be -1", result1);
    println!("result2 is {} which should be 0", result2);
    println!("-----------------end lseek-----------------");
    println!("");
}

fn test_fcntl() {
    println!("-----------------test fcntl-----------------");
    mkdir(-100, "test_fcntl\0", 0666);
    let fd = openat(-100, "test_fcntl\0", OpenFlags::O_RDWR, 0);
    println!("open gets fd as {}", fd);
    let result1 = fcntl(fd as usize, 0, 0); //dup
    let result2 = fcntl(fd as usize, 2, 1); //设置CLOEXEC
    let result3 = fcntl(fd as usize, 1, 0); //获得CLOEXEC
    let flags = OpenFlags::all();
    let result4 = fcntl(fd as usize, 4, flags.bits() as usize); //设置openflags
    let result5 = fcntl(fd as usize, 3, 0); //获得openflags
    println!("result1 is {} which should be 5 which is fd+1", result1);
    println!("result2 is {} which should be 0", result2);
    println!("result3 is {} which should be 1", result3);
    println!("result4 is {} which should be 0", result4);
    println!(
        "result5 is {} which should be 2098243 which is Openflags::all()",
        result5
    );
    println!("-----------------end fcntl-----------------");
    println!("");
}

#[no_mangle]
pub fn main() -> i32 {
    test_fstatat();
    test_statfs();
    test_faccessat();
    test_lseek();
    test_fcntl();
    0
}
