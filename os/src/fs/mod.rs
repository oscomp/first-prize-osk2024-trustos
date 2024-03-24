mod dirent;
mod inode;
mod mount;
mod pipe;
mod stat;
mod stdio;

use crate::mm::UserBuffer;
use alloc::string::String;

pub type RFile = dyn File + Send + Sync;

pub trait File: Send + Sync {
    fn readable(&self) -> bool;
    fn writable(&self) -> bool;
    /// read 指的是从文件中读取数据放到缓冲区中，最多将缓冲区填满，并返回实际读取的字节数
    fn read(&self, buf: UserBuffer) -> usize;
    /// 将缓冲区中的数据写入文件，最多将缓冲区中的数据全部写入，并返回直接写入的字节数
    fn write(&self, buf: UserBuffer) -> usize;

    fn fstat(&self, kstat: &mut Kstat);

    fn dirent(&self, dirent: &mut Dirent) -> isize;

    fn name(&self) -> String;

    fn set_offset(&self, offset: usize);
    /// 获取当前文件偏移,INODE需实现该函数
    fn offset(&self) -> usize {
        0
    }
}

use alloc::{sync::Arc, vec, vec::Vec};
pub use dirent::Dirent;
pub use inode::{chdir, list_apps, open, open_file, OSInode, OpenFlags, ROOT_INODE};
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
    // for ppn in crate::mm::PPNRange::new(
    //     crate::mm::PhysAddr::from(sinitproc as usize).floor(),
    //     crate::mm::PhysAddr::from(einitproc as usize).floor(),
    // ) {
    //     crate::mm::frame_dealloc(ppn);
    // }
    let shell = open_file("user_shell", OpenFlags::O_CREATE).unwrap();
    let mut v = Vec::new();
    v.push(unsafe {
        core::slice::from_raw_parts_mut(
            shell_start as *mut u8,
            shell_end as usize - shell_start as usize,
        ) as &'static mut [u8]
    });
    shell.write(UserBuffer::new(v));
    // for ppn in crate::mm::PPNRange::new(
    //     crate::mm::PhysAddr::from(sbash as usize).floor(),
    //     crate::mm::PhysAddr::from(ebash as usize).floor(),
    // ) {
    //     crate::mm::frame_dealloc(ppn);
    // }
}
