#![no_std]
#![no_main]

use user_lib::{fstatat, mkdir, Kstat};

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

#[no_mangle]
pub fn main() -> i32 {
    test_fstatat();
    0
}
