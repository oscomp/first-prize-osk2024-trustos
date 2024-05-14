#![no_std]
#![no_main]

use user_lib::{
    close, faccessat, fcntl, fstatat, fsync, ftruncate, lseek, mkdir, openat, pread64, pwrite64,
    read, sendfile, statfs, sync, write, FaccessatMode, Kstat, OpenFlags, Statfs,
};

#[macro_use]
extern crate user_lib;

fn test_fstatat() {
    println!("-----------------test fstatat-----------------");
    let mut kst = Kstat::new();
    mkdir(-100, "nihao\0", 0666);
    let result = fstatat(-100, "nihao\0", &mut kst, 0);
    println!("result is {} and kst is {:?}", result, kst);
    println!("-----------------end fstatat-----------------");
    println!("");
}

fn test_statfs() {
    println!("-----------------test statfs-----------------");
    let mut stat = Statfs::empty();
    let result = statfs(&mut stat);
    println!("result is {} and ourstatfs is {:?}", result, stat);
    println!("-----------------end statfs-----------------");
    println!("");
}

fn test_faccessat() {
    println!("-----------------test faccessat-----------------");
    let mode1 = FaccessatMode::F_OK | FaccessatMode::X_OK | FaccessatMode::W_OK;
    //let mode2 = FaccessatMode::R_OK;
    mkdir(-100, "test_faccessat\0", 0666);
    println!("now test OK:");
    let result = faccessat(-100, "test_faccessat\0", mode1, 0);
    //println!("now test NOT OK:");
    //let result2 = faccessat(-100, "test_faccessat\0", mode2, 0);
    println!("result is {} which should be 0", result);
    //println!("result2 is {} which should be -1", result2);
    println!("-----------------end faccessat-----------------");
    println!("");
}

fn test_lseek() {
    println!("-----------------test lseek-----------------");
    mkdir(-100, "test_lseek\0", 0666);
    let fd = openat(-100, "test_lseek\0", OpenFlags::O_RDWR, 0);
    let result1 = lseek(fd as usize, -100, 2);
    let result2 = lseek(fd as usize, 100, 1);
    close(fd as usize);
    println!("result1 is {} which should be -1", result1);
    println!("result2 is {} which should be 0", result2);
    println!("-----------------end lseek-----------------");
    println!("");
}

fn test_fcntl() {
    println!("-----------------test fcntl-----------------");
    mkdir(-100, "test_fcntl\0", 0666);
    let fd = openat(-100, "test_fcntl\0", OpenFlags::O_RDWR, 0);
    println!("open gets fd as {}", fd);
    let result1 = fcntl(fd as usize, 0, 0); //dup
    let result2 = fcntl(fd as usize, 2, 1); //设置CLOEXEC
    let result3 = fcntl(fd as usize, 1, 0); //获得CLOEXEC
    let flags = OpenFlags::all();
    let result4 = fcntl(fd as usize, 4, flags.bits() as usize); //设置openflags
    let result5 = fcntl(fd as usize, 3, 0); //获得openflags
    close(fd as usize);
    println!("result1 is {} which should be 5 which is fd+1", result1);
    println!("result2 is {} which should be 0", result2);
    println!("result3 is {} which should be 1", result3);
    println!("result4 is {} which should be 0", result4);
    println!(
        "result5 is {} which should be 2098243 which is Openflags::all()",
        result5
    );
    println!("-----------------end fcntl-----------------");
    println!("");
}

fn test_sendfile() {
    println!("-----------------test sendfile-----------------");
    let infd = openat(
        -100,
        "test_infd\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    let outfd = openat(
        -100,
        "test_outfd\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    let inbuf: [u8; 10] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let writeresult = write(infd as usize, &inbuf, 10);
    println!(
        "have written {} bytes [1,2,3,4,5,6,7,8,9,10]\nnow lseek to the beginning of the infile",
        writeresult
    );
    let offset: usize = 5;
    println!("now we need the last 5 number");
    let result = sendfile(outfd as usize, infd as usize, &offset as *const usize, 5);
    println!("sendfile over, now lseek to the beginning of the outfile");
    lseek(outfd as usize, 0, 0);
    println!("lseek over, now let's read");
    let mut outbuf: [u8; 5] = [0; 5];
    let readresult = read(outfd as usize, &mut outbuf, 5);
    println!(
        "read {} bytes , now print send bytes which should be: [6,7,8,9,10]",
        readresult
    );
    for &byte in &outbuf {
        print!("{} ", byte);
    }
    close(infd as usize);
    close(outfd as usize);
    println!("");
    println!("result is {} which should be 5", result);
    println!("-----------------end sendfile-----------------");
    println!("");
}

fn test_pwr64() {
    println!("-----------------test pwrite64 & pread64-----------------");
    let fd = openat(
        -100,
        "test_pwr64\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    let inbuf: [u8; 10] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let writeresult = pwrite64(fd as usize, &inbuf, 10, 50);
    println!(
        "have written {} bytes [1,2,3,4,5,6,7,8,9,10] at offset 50\n",
        writeresult
    );
    let mut outbuf: [u8; 5] = [0; 5];
    let readresult = pread64(fd as usize, &mut outbuf, 5, 55);
    println!(
        "read {} bytes at offset 55 , now print send bytes which should be: [6,7,8,9,10]",
        readresult
    );
    for &byte in &outbuf {
        print!("{} ", byte);
    }
    println!("");
    close(fd as usize);
    println!("-----------------end pwrite64 & pread64-----------------");
    println!("");
}

fn test_ftruncate() {
    println!("-----------------test ftruncate-----------------");
    let fd = openat(
        -100,
        "test_ftruncate\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    let result1 = ftruncate(fd as usize, -5);
    let result2 = ftruncate(fd as usize, 100);
    close(fd as usize);
    println!("result1 is {} which should be -1", result1);
    println!("result2 is {} which should be 0", result2);
    println!("-----------------end ftruncate-----------------");
    println!("");
}

fn test_fsync() {
    println!("-----------------test fsync-----------------");
    let fd = openat(
        -100,
        "test_fsync\0",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
        0,
    );
    let result = fsync(fd as usize);
    close(fd as usize);
    println!("result is {} which should be 0", result);
    println!("-----------------end fsync-----------------");
    println!("");
}

fn test_sync() {
    println!("-----------------test sync-----------------");
    let result = sync();
    println!("result is {} which should be 0", result);
    println!("-----------------end sync-----------------");
    println!("");
}

#[no_mangle]
pub fn main() -> i32 {
    test_fstatat();
    test_statfs();
    test_faccessat();
    test_lseek();
    test_fcntl();
    test_sendfile();
    test_pwr64();
    test_ftruncate();
    test_fsync();
    test_sync();
    0
}
