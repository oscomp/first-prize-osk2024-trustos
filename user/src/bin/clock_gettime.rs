#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;

use user_lib::{clock_gettime, Clockid, Timespec};

#[no_mangle]
pub fn main() -> i32 {
    //sys_clock_gettime
    let clockid = Clockid::CLOCK_REALTIME;
    let mut tp = Timespec::new(0, 0);
    let result = clock_gettime(clockid, &mut tp);
    println!("tp is {:?} and result is {}", tp, result);
    0
}
