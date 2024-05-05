mod dirent;
mod fsidx;
mod inode;
mod mount;
mod pipe;
mod stat;
mod stdio;

use crate::mm::UserBuffer;
use alloc::string::String;
pub use fsidx::*;

pub type RFile = dyn File + Send + Sync;

/// 枚举类型，分为普通文件和抽象文件
/// 普通文件File，特点是支持更多类型的操作，包含seek, offset等
/// 抽象文件Abs，抽象文件，只支持File trait的一些操作
#[derive(Clone)]
pub enum FileClass {
    File(Arc<OSInode>),
    Abs(Arc<RFile>),
}

pub trait File: Send + Sync {
    fn readable(&self) -> bool;
    fn writable(&self) -> bool;
    /// read 指的是从文件中读取数据放到缓冲区中，最多将缓冲区填满，并返回实际读取的字节数
    fn read(&self, buf: UserBuffer) -> usize;
    /// 将缓冲区中的数据写入文件，最多将缓冲区中的数据全部写入，并返回直接写入的字节数
    fn write(&self, buf: UserBuffer) -> usize;
}

use alloc::{sync::Arc, vec, vec::Vec};
pub use dirent::Dirent;
pub use inode::{is_abs_path, list_apps, open, open_file, OSInode, OpenFlags, ROOT_INODE};
pub use mount::MNT_TABLE;
pub use pipe::{make_pipe, Pipe};
pub use stat::Kstat;
pub use stdio::{Stdin, Stdout};
core::arch::global_asm!(include_str!("preload.S"));

// os\src\fs\mod.rs
//将预加载到内存中的程序写入文件根目录
pub fn flush_preload() {
    extern "C" {
        fn initproc_start();
        fn initproc_end();
        fn shell_start();
        fn shell_end();
    }

    let initproc = open_file("initproc", OpenFlags::O_CREATE).unwrap();
    let mut v = Vec::new();
    v.push(unsafe {
        core::slice::from_raw_parts_mut(
            initproc_start as *mut u8,
            initproc_end as usize - initproc_start as usize,
        ) as &'static mut [u8]
    });
    initproc.write(UserBuffer::new(v));

    // let onlinetests = open_file("onlinetests", OpenFlags::O_CREATE).unwrap();
    // let mut v = Vec::new();
    // v.push(unsafe {
    //     core::slice::from_raw_parts_mut(
    //         shell_start as *mut u8,
    //         shell_end as usize - shell_start as usize,
    //     ) as &'static mut [u8]
    // });
    // onlinetests.write(UserBuffer::new(v));
}

pub fn path2abs<'a>(cwdv: &mut Vec<&'a str>, pathv: &Vec<&'a str>) -> String {
    for &path_element in pathv.iter() {
        if path_element == "." {
            continue;
        } else if path_element == ".." {
            cwdv.pop();
        } else {
            cwdv.push(path_element);
        }
    }
    let mut abs_path = String::from("/");
    abs_path.push_str(&cwdv.join("/"));
    abs_path
}
