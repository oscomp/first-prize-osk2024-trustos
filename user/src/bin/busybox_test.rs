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

pub fn test_mkdir_date_df() {
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
    /*
    "busybox\0".as_ptr() as isize,
    "cp\0".as_ptr() as isize,
    "./test_cp.txt\0".as_ptr() as isize,
    "./test_copy.txt\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_head() {
    let fd = openat(
        -100,
        "test_head\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let inbuf: [u8; 10] = [1, b'\n', 3, 4, b'\n', 6, 7, 8, b'\n', 10];
    write(fd as usize, &inbuf, 10);
    close(fd as usize);
    println!("have create './test_head' and write 4 lines, now head 2 lines");
    /*"busybox\0".as_ptr() as isize,
    "head\0".as_ptr() as isize,
    "-n\0".as_ptr() as isize,
    "2\0".as_ptr() as isize,
    "./test_head\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_hexdump() {
    let fd = openat(
        -100,
        "test_hexdump\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let inbuf: [u8; 10] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    write(fd as usize, &inbuf, 10);
    close(fd as usize);
    println!("have create './test_hexdump' and write 1~10 number, now hexdump show");
    /*"busybox\0".as_ptr() as isize,
    "hexdump\0".as_ptr() as isize,
    "./test_hexdump\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_mv() {
    let fd1 = openat(-100, "./mnt\0", OpenFlags::O_DIRECTROY, 0);
    let fd2 = openat(
        -100,
        "test_mv.txt\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    close(fd1 as usize);
    close(fd2 as usize);
    //println!("have create './test_mv.txt' now mv to ./mnt/test_mvnew.txt");
    println!("have create './test_mv.txt' now mv to ./mnt/");
    /*"busybox\0".as_ptr() as isize,
    "mv\0".as_ptr() as isize,
    "./test_mv.txt\0".as_ptr() as isize,
    "./mnt/\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_rmdir() {
    let fd1 = openat(
        -100,
        "./test_rmdir\0",
        OpenFlags::O_DIRECTROY | OpenFlags::O_CREATE,
        0,
    );
    close(fd1 as usize);
    println!("have create './test_rmdir' now rmdir it");
    /*"busybox\0".as_ptr() as isize,
    "rmdir\0".as_ptr() as isize,
    "./test_rmdir\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_rm() {
    let fd1 = openat(-100, "./test_rm\0", OpenFlags::O_CREATE, 0);
    close(fd1 as usize);
    println!("have create './test_rm' now rm it");
    /*"busybox\0".as_ptr() as isize,
    "rm\0".as_ptr() as isize,
    "./test_rm\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_sleep() {
    /*"busybox\0".as_ptr() as isize,
    "sleep\0".as_ptr() as isize,
    "2\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

pub fn test_sort() {
    let fd = openat(
        -100,
        "test_sort\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0666,
    );
    let inbuf: [u8; 10] = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    write(fd as usize, &inbuf, 10);
    close(fd as usize);
    println!("have create './test_sort' and write 10~1 number, now sort it");
    /*"busybox\0".as_ptr() as isize,
    "sort\0".as_ptr() as isize,
    "./test_sort\0".as_ptr() as isize,
    0, */
    run_busyboxsh();
}

#[no_mangle]
pub fn main() -> i32 {
    //test_cat();
    //test_dirname();
    //test_mkdir_date_df();
    //test_basename();
    //test_cp();
    //test_head();
    //test_hexdump();
    //test_mv();
    //test_rmdir();
    //test_rm();
    //test_sleep();
    test_sort();
    0
}
