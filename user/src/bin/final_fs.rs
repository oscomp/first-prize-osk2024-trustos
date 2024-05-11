#![no_std]
#![no_main]

use user_lib::{faccessat, fstatat, mkdir, statfs, FaccessatMode, Kstat, Statfs};

#[macro_use]
extern crate user_lib;

fn test_fstatat() {
    println!("-----------------test fstatat-----------------");
    let mut kst = Kstat::new();
    mkdir(-100, "nihao\0", 0666);
    let result = fstatat(-100, "nihao\0", &mut kst, 0);
    println!("result is {} and kst is {:?}", result, kst);
    println!("-----------------end fstatat-----------------");
}

fn test_statfs() {
    println!("-----------------test statfs-----------------");
    let mut stat = Statfs::empty();
    let result = statfs(&mut stat);
    println!("result is {} and ourstatfs is {:?}", result, stat);
    println!("-----------------end statfs-----------------");
}

fn test_faccessat() {
    println!("-----------------test faccessat-----------------");
    let mode =
        FaccessatMode::F_OK | FaccessatMode::X_OK | FaccessatMode::W_OK | FaccessatMode::R_OK;
    mkdir(-100, "wohao\0", 0666);
    println!("now test OK:");
    let result1 = faccessat(-100, "wohao\0", mode, 0);
    println!("now test NOT OK:");
    let result2 = faccessat(-100, "wobuhao\0", mode, 0);
    println!("result1 is {} and result2 is {}", result1, result2);
    println!("-----------------end faccessat-----------------");
}

#[no_mangle]
pub fn main() -> i32 {
    test_fstatat();
    test_statfs();
    test_faccessat();
    0
}
