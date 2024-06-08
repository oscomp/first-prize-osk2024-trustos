mod inode;

use super::{Dirent, FileClass, InodeType, Kstat, OpenFlags};
use crate::{mm::UserBuffer, utils::SysErrNo};
use alloc::{string::String, sync::Arc};

pub use inode::*;
///
pub trait SuperBlock: Send + Sync {
    fn root_inode(&self) -> Arc<dyn Inode>;
    fn sync(&self);
}
/// VfsInode接口
pub trait Inode: Send + Sync {
    ///
    fn name(&self) -> String;
    ///
    fn size(&self) -> usize;
    ///
    fn node_type(&self) -> InodeType;
    ///
    fn fstat(&self) -> Kstat;
    /// 在当前目录下创建普通文件
    fn create(&self, name: &str, mode: OpenFlags) -> Option<Arc<dyn Inode>>;
    /// 在当前目录下创建目录文件
    fn mkdir(&self, name: &str, mode: OpenFlags) -> Result<(), SysErrNo>;
    /// 在当前目录下查找文件
    fn find(&self, name: &str) -> Option<Arc<dyn Inode>>;
    ///
    fn read_at(&self, off: usize, buf: &mut [u8]) -> Result<usize, SysErrNo>;
    ///
    fn write_at(&self, off: usize, buf: &[u8]) -> Result<usize, SysErrNo>;
    /// 读取目录项
    fn read_dentry(&self, off: usize) -> Option<Dirent>;
    ///
    fn truncate(&self) -> Result<(), SysErrNo>;
    ///
    fn sync(&self);
}
/// OSInode接口
pub trait OSFile: Send + Sync {
    /// 设置偏移量
    fn lseek(&self, offset: isize, whence: usize) -> Result<usize, SysErrNo> {
        Err(SysErrNo::EINVAL)
    }
    fn offset(&self) -> isize;
    fn find(&self, path: &str, flags: OpenFlags) -> Option<FileClass>;
    fn create(&self, path: &str, flags: OpenFlags) -> Option<FileClass>;
}

/// 文件接口
pub trait File: Send + Sync {
    fn readable(&self) -> bool;
    fn writable(&self) -> bool;
    /// read 指的是从文件中读取数据放到缓冲区中，最多将缓冲区填满，并返回实际读取的字节数
    fn read(&self, buf: UserBuffer) -> Result<usize, SysErrNo>;
    /// 将缓冲区中的数据写入文件，最多将缓冲区中的数据全部写入，并返回直接写入的字节数
    fn write(&self, buf: UserBuffer) -> Result<usize, SysErrNo>;
}

pub trait Ioctl: File {
    /// ioctl处理
    fn ioctl(&self, cmd: usize, arg: usize) -> isize;
}

// bitflags! {
//     /// 文件标志位，包含文件的权限以及文件类型
//     ///
//     /// 在判断文件类型的时候，请使用 `get_type()` 函数并通过 `match` 匹配判断
//     pub struct ModeFlags: u32 {
//         // 权限
//         const READ = 0o444;
//         const WRITE = 0o222;
//         const EXEC = 0o111;
//         const RW = 0o600;
//         const RWX = Self::READ.bits | Self::WRITE.bits | Self::EXEC.bits;

//         // 文件类型
//         // musl libc: include/sys/stat.h
//         const SOCKET = 0o140000;
//         const LINK = 0o120000;
//         const REGULAR = 0o100000;
//         const BLK = 0o60000;
//         const DIRECTORY = 0o40000;
//         const CHAR = 0o20000;
//         const FIFO = 0o10000;
//     }
// }

// impl ModeFlags {
//     /// 获取文件类型
//     ///
//     /// 由于相关的标志位是根据实际库定义的，因此并不符合各个位互斥，
//     /// 也即可能造成一种文件类型它的二进制其实是包含另一种文件类型，
//     /// 导致判断失误。所以使用该函数之后通过 `match` 进行全匹配判断，
//     /// 而不是使用 `contains()`
//     pub fn get_type(&self) -> Self {
//         const S_IFMT: u32 = 0o170000;
//         let file_type = self.bits() & S_IFMT;
//         assert!(file_type != 0);
//         Self::from_bits(self.bits() & S_IFMT).unwrap()
//     }
// }
