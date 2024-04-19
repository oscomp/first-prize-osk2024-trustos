#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;

use user_lib::{busy, exec, fork, wait,sleep};

#[no_mangle]
fn main() -> i32 {
    println!("initproc running...");
    if fork() == 0 {
        // exec("/rCoretests/forktest\0");
        //exec("user_shell\0");
        //exec("busybox_unstripped\0");
        busy();
        // exec("onlinetests\0");
    } else {
        loop {
            let mut exit_code: i32 = 0;
            let pid = wait(&mut exit_code);
            sleep(1000);
            // println!(
            //     "[initproc] Released a zombie process, pid={}, exit_code={}",
            //     pid, exit_code,
            // );
        }
    }
    0
}
