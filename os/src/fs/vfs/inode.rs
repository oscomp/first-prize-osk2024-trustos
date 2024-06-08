use crate::{
    fs::{FileClass, OpenFlags, SEEK_CUR, SEEK_END, SEEK_SET},
    utils::SysErrNo,
};

use super::{Inode, OSFile};
use alloc::sync::Arc;
use spin::{Mutex, MutexGuard};

pub struct OSInode {
    pub readable: bool, // 该文件是否允许通过 sys_read 进行读
    pub writable: bool, // 该文件是否允许通过 sys_write 进行写
    pub inode: Arc<dyn Inode>,
    pub(crate) inner: Mutex<OSInodeInner>,
}
pub struct OSInodeInner {
    pub(crate) offset: usize, // 偏移量
}

impl OSInode {
    pub fn new(readable: bool, writable: bool, inode: Arc<dyn Inode>) -> Self {
        Self {
            readable,
            writable,
            inode,
            inner: Mutex::new(OSInodeInner { offset: 0 }),
        }
    }
}

impl OSFile for OSInode {
    fn lseek(&self, offset: isize, whence: usize) -> Result<usize, SysErrNo> {
        if offset < 0 || whence > 2 {
            return Err(SysErrNo::EINVAL);
        }
        let offset: usize = offset as usize;
        let mut inner = self.inner.lock();
        if whence == SEEK_SET {
            inner.offset = offset;
        } else if whence == SEEK_CUR {
            inner.offset += offset;
        } else if whence == SEEK_END {
            inner.offset = self.inode.size() + offset;
        }
        Ok(inner.offset)
    }
    fn offset(&self) -> isize {
        self.inner.lock().offset as isize
    }
    fn create(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
        let (readable, writable) = flags.read_write();
        self.inode
            .create(path, flags)
            .map(|node| FileClass::File(Arc::new(OSInode::new(readable, writable, node))))
    }
    fn find(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
        let (readable, writable) = flags.read_write();
        self.inode
            .find(path)
            .map(|node| FileClass::File(Arc::new(OSInode::new(readable, writable, node))))
    }
}
