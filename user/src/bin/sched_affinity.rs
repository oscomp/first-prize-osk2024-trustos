#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;

use user_lib::{sched_getaffinity, sched_setaffinity};

#[no_mangle]
pub fn main() -> i32 {
    //sys_sched_getaffinity & sys_sched_setaffinity
    let mask: usize = 10;
    let result1 = sched_setaffinity(1, &mask as *const usize);
    println!("set proc 1 mask : {} which should be 10", mask);
    let mut mask: usize = 5;
    let result2 = sched_getaffinity(1, &mut mask as *mut usize);
    println!("get proc 1 mask : {} which should be 10", mask);
    println!("result1 is {} and result2 is {}", result1, result2);
    0
}
