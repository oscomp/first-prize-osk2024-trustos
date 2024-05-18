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

pub fn test_dirname() {
    let fd1 = openat(-100, "./mnt\0", OpenFlags::O_DIRECTROY, 0);
    let fd2 = openat(
        fd1,
        "test_dirname\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    close(fd1 as usize);
    close(fd2 as usize);
    println!("have create './mnt/test_dirname' now should print ./mnt");
    run_busyboxsh();
}

pub fn test_mkdir() {
    run_busyboxsh();
}

pub fn test_basename() {
    let fd1 = openat(-100, "./mnt\0", OpenFlags::O_DIRECTROY, 0);
    let fd2 = openat(
        fd1,
        "test_basename.txt\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    close(fd1 as usize);
    close(fd2 as usize);
    println!("have create './mnt/test_basename.txt' now should print test_basename");
    run_busyboxsh();
}

pub fn test_cp() {
    let fd = openat(
        -100,
        "test_cp.txt\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let fd2 = openat(
        -100,
        "test_copy.txt\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let inbuf: [u8; 10] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    write(fd as usize, &inbuf, 10);
    close(fd as usize);
    close(fd2 as usize);
    println!("have create './test_cp.txt' and write 0~10 number, now cp to ./test_copy.txt");
    run_busyboxsh();
}

#[no_mangle]
pub fn main() -> i32 {
    //test_cat();
    //test_dirname();
    //test_mkdir();
    //test_basename();
    test_cp();
    0
}
