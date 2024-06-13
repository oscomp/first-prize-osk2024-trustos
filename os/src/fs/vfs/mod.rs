mod inode;

use super::{Dirent, FileClass, InodeType, Kstat, OpenFlags, Statfs};
use crate::{
    mm::UserBuffer,
    utils::{GeneralRet, SysErrNo, SyscallRet},
};
use alloc::{string::String, sync::Arc, vec::Vec};

pub use inode::*;
///
pub trait SuperBlock: Send + Sync {
    fn root_inode(&self) -> Arc<dyn Inode>;
    fn sync(&self);
    fn fs_stat(&self) -> Statfs;
}
/// VfsInode接口
pub trait Inode: Send + Sync {
    ///
    fn size(&self) -> usize;
    ///
    fn node_type(&self) -> InodeType;
    ///
    fn fstat(&self) -> Kstat;
    /// 在当前目录下创建文件或目录
    fn create(&self, path: &str, ty: InodeType) -> Option<Arc<dyn Inode>>;
    /// 在当前目录下查找文件
    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>>;
    ///
    // fn find_by_name(&self, name: &str) -> Option<Arc<dyn Inode>>;
    ///
    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet;
    ///
    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet;
    /// 读取目录项
    // fn read_dentry(&self, off: usize) -> Option<Dirent>;
    fn read_dentry(&self, off: usize, len: usize) -> Option<(Vec<u8>, isize)>;
    ///
    fn truncate(&self) -> GeneralRet;
    ///
    fn sync(&self);
    ///
    fn set_timestamps(&self, atime_sec: Option<u64>, mtime_sec: Option<u64>) -> GeneralRet;
    fn link(&self);
    fn unlink(&self) -> GeneralRet;
    fn rename(&self, file: Arc<dyn Inode>) -> GeneralRet;
    fn ls(&self) -> Vec<String>;
}
/// OSInode接口
pub trait OSFile: Send + Sync {
    /// 设置偏移量
    fn lseek(&self, offset: isize, whence: usize) -> SyscallRet;
    fn find(&self, path: &str, flags: OpenFlags) -> Option<FileClass>;
    fn create(&self, path: &str, flags: OpenFlags) -> Option<FileClass>;
}

/// 文件接口
pub trait File: Send + Sync {
    fn readable(&self) -> bool;
    fn writable(&self) -> bool;
    /// read 指的是从文件中读取数据放到缓冲区中，最多将缓冲区填满，并返回实际读取的字节数
    fn read(&self, buf: UserBuffer) -> SyscallRet;
    /// 将缓冲区中的数据写入文件，最多将缓冲区中的数据全部写入，并返回直接写入的字节数
    fn write(&self, buf: UserBuffer) -> SyscallRet;
}

pub trait Ioctl: File {
    /// ioctl处理
    fn ioctl(&self, cmd: usize, arg: usize) -> isize;
}
