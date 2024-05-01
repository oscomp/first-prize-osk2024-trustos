#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;

use user_lib::{clock_gettime, sched_getaffinity, sched_setaffinity, Clockid, Timespec};

#[no_mangle]
pub fn main() -> i32 {
    println!("Hello world from user mode program!");
    //sys_clock_gettime
    let clockid = Clockid::CLOCK_REALTIME;
    let mut tp = Timespec::new(0, 0);
    let result = clock_gettime(clockid, &mut tp);
    println!("tp is {:?} and result is {}", tp, result);

    //sys_sched_getaffinity & sys_sched_setaffinity
    let mask: usize = 10;
    let result1 = sched_setaffinity(1, &mask as *const usize);
    println!("mask first is {}", mask);
    let mut mask: usize = 5;
    let result2 = sched_getaffinity(1, &mut mask as *mut usize);
    println!("mask second is {}", mask);
    println!("result1 is {} and result2 is {}", result1, result2);
    0
}
