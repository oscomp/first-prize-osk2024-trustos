#![no_std]
#![no_main]
#![allow(unused_imports)]
#![allow(unused_variables)]

#[macro_use]
extern crate user_lib;

use user_lib::{close, exec, fork, openat, run_busyboxsh, shutdown, sleep, wait, write, OpenFlags};

#[no_mangle]
fn main() -> i32 {
    println!("initproc running...");
    if fork() == 0 {
        exec("user_shell\0");
        // exec("onlinetests\0");
        //run_busyboxsh();
    } else {
        loop {
            let mut exit_code: i32 = 0;
            let pid = wait(&mut exit_code);
            // shutdown();
            // sleep(5000);
            /*
            println!(
                "[initproc] Released a zombie process, pid={}, exit_code={}",
                pid, exit_code,
            );
            */
        }
    }
    0
}
