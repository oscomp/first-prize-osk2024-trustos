#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;
use user_lib::{close, openat, run_busyboxsh, write, OpenFlags};

pub fn test_cat() {
    let fd = openat(
        -100,
        "nihao\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let inbuf: [u8; 10] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    write(fd as usize, &inbuf, 10);
    close(fd as usize);
    println!("have create './nihao' and write 0~10 number, now should print 乱码");
    run_busyboxsh();
}

#[no_mangle]
pub fn main() -> i32 {
    test_cat();
    0
}
