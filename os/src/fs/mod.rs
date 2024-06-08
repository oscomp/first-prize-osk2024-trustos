mod devfs;
mod dirent;
mod ext4;
mod fat32;
mod fstruct;
mod mount;
mod pipe;
mod stat;
mod stdio;
mod vfs;

cfg_if::cfg_if! {
    if #[cfg(feature="fat32")]{
        pub use fat32::{
            create_init_files, is_abs_path, list_apps, open, open_file, path2vec, Mode,
            ROOT_INODE,remove_vfile_idx
        };
        pub use fat32_fs::{sync_all,BlockDevice};
    }
}

use crate::mm::UserBuffer;
use crate::utils::SysErrNo;
use alloc::string::String;
use alloc::{sync::Arc, vec, vec::Vec};
pub use devfs::*;
pub use dirent::Dirent;
pub use fstruct::{FdTable, FdTableInner, FsInfo};
pub use mount::MNT_TABLE;
pub use pipe::{make_pipe, Pipe};
use spin::{Mutex, MutexGuard};
pub use stat::{Kstat, Statfs};
pub use stdio::{Stdin, Stdout};
pub use vfs::*;

// 定义一份打开文件的标志
bitflags! {
    pub struct OpenFlags: u32 {
        // reserve 3 bits for the access mode
        const O_RDONLY      = 0;
        const O_WRONLY      = 1;
        const O_RDWR        = 2;
        const O_ACCMODE     = 3;
        const O_CREATE      = 0o100;
        const O_EXCL        = 0o200;
        const O_NOCTTY      = 0o400;
        const O_TRUNC       = 0o1000;
        const O_APPEND      = 0o2000;
        const O_NONBLOCK    = 0o4000;
        const O_DSYNC       = 0o10000;
        const O_SYNC        = 0o4010000;
        const O_RSYNC       = 0o4010000;
        const O_DIRECTORY   = 0o200000;
        const O_NOFOLLOW    = 0o400000;
        const O_CLOEXEC     = 0o2000000;    //描述符标志

        const O_ASYNC       = 0o20000;
        const O_DIRECT      = 0o40000;
        const O_LARGEFILE   = 0o100000;
        const O_NOATIME     = 0o1000000;
        const O_PATH        = 0o10000000;
        const O_TMPFILE     = 0o20200000;
    }
}

impl OpenFlags {
    pub fn read_write(&self) -> (bool, bool) {
        if self.is_empty() {
            (true, false)
        } else if self.contains(Self::O_WRONLY) {
            (false, true)
        } else {
            (true, true)
        }
    }
}

pub const SEEK_SET: usize = 0;
pub const SEEK_CUR: usize = 1;
pub const SEEK_END: usize = 2;

/// 枚举类型，分为普通文件和抽象文件
/// 普通文件File，特点是支持更多类型的操作，包含seek, offset等
/// 抽象文件Abs，抽象文件，只支持File trait的一些操作
#[derive(Clone)]
pub enum FileClass {
    File(Arc<OSInode>),
    Abs(Arc<dyn File>),
}

impl FileClass {
    pub fn file(&self) -> Result<Arc<OSInode>, SysErrNo> {
        match self {
            FileClass::File(f) => Ok(f.clone()),
            FileClass::Abs(f) => Err(SysErrNo::EINVAL),
        }
    }
    pub fn abs(&self) -> Result<Arc<dyn File>, SysErrNo> {
        match self {
            FileClass::File(f) => Err(SysErrNo::EINVAL),
            FileClass::Abs(f) => Ok(f.clone()),
        }
    }
}
#[repr(u8)]
#[derive(Debug, Clone, Copy, Eq, PartialEq)]
pub enum InodeType {
    /// FIFO (named pipe)
    Fifo = 0o1,
    /// Character device
    CharDevice = 0o2,
    /// Directory
    Dir = 0o4,
    /// Block device
    BlockDevice = 0o6,
    /// Regular file
    File = 0o10,
    /// Symbolic link
    SymLink = 0o12,
    /// Socket
    Socket = 0o14,
}

impl InodeType {
    /// Tests whether this node type represents a regular file.
    pub const fn is_file(self) -> bool {
        matches!(self, Self::File)
    }
    /// Tests whether this node type represents a directory.
    pub const fn is_dir(self) -> bool {
        matches!(self, Self::Dir)
    }
    /// Tests whether this node type represents a symbolic link.
    pub const fn is_symlink(self) -> bool {
        matches!(self, Self::SymLink)
    }
    /// Returns `true` if this node type is a block device.
    pub const fn is_block_device(self) -> bool {
        matches!(self, Self::BlockDevice)
    }
    /// Returns `true` if this node type is a char device.
    pub const fn is_char_device(self) -> bool {
        matches!(self, Self::CharDevice)
    }
    /// Returns `true` if this node type is a fifo.
    pub const fn is_fifo(self) -> bool {
        matches!(self, Self::Fifo)
    }
    /// Returns `true` if this node type is a socket.
    pub const fn is_socket(self) -> bool {
        matches!(self, Self::Socket)
    }
    /// Returns a character representation of the node type.
    ///
    /// For example, `d` for directory, `-` for regular file, etc.
    pub const fn as_char(self) -> char {
        match self {
            Self::Fifo => 'p',
            Self::CharDevice => 'c',
            Self::Dir => 'd',
            Self::BlockDevice => 'b',
            Self::File => '-',
            Self::SymLink => 'l',
            Self::Socket => 's',
        }
    }
}

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

    if let Some(FileClass::File(initproc)) = open_file("initproc", OpenFlags::O_CREATE) {
        let mut v = Vec::new();
        v.push(unsafe {
            core::slice::from_raw_parts_mut(
                initproc_start as *mut u8,
                initproc_end as usize - initproc_start as usize,
            ) as &'static mut [u8]
        });
        initproc.write(UserBuffer::new(v));
    }

    if let Some(FileClass::File(onlinetests)) = open_file("onlinetests", OpenFlags::O_CREATE) {
        let mut v = Vec::new();
        v.push(unsafe {
            core::slice::from_raw_parts_mut(
                shell_start as *mut u8,
                shell_end as usize - shell_start as usize,
            ) as &'static mut [u8]
        });
        onlinetests.write(UserBuffer::new(v));
    }
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
