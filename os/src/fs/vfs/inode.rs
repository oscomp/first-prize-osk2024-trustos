use crate::{
    fs::{FileClass, OpenFlags, SEEK_CUR, SEEK_END, SEEK_SET},
    mm::UserBuffer,
    utils::{SysErrNo, SyscallRet},
};

use super::{File, Inode, OSFile};
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
    fn lseek(&self, offset: isize, whence: usize) -> SyscallRet {
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
    fn create(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
        let (readable, writable) = flags.read_write();
        self.inode
            .create(path, flags.node_type())
            .map(|node| FileClass::File(Arc::new(OSInode::new(readable, writable, node))))
    }
    fn find(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
        let (readable, writable) = flags.read_write();
        self.inode
            .find_by_path(path)
            .map(|node| FileClass::File(Arc::new(OSInode::new(readable, writable, node))))
    }
}

// 为 OSInode 实现 File Trait
impl File for OSInode {
    fn readable(&self) -> bool {
        self.readable
    }

    fn writable(&self) -> bool {
        self.writable
    }

    fn read(&self, mut buf: UserBuffer) -> SyscallRet {
        let mut inner = self.inner.lock();
        let mut total_read_size = 0usize;
        // 这边要使用 iter_mut()，因为要将数据写入
        for slice in buf.buffers.iter_mut() {
            let read_size = self.inode.read_at(inner.offset, *slice)?;
            if read_size == 0 {
                break;
            }
            inner.offset += read_size;
            total_read_size += read_size;
        }
        Ok(total_read_size)
    }

    fn write(&self, buf: UserBuffer) -> SyscallRet {
        let mut inner = self.inner.lock();
        let mut total_write_size = 0usize;
        for slice in buf.buffers.iter() {
            let write_size = self.inode.write_at(inner.offset, *slice)?;
            assert_eq!(write_size, slice.len());
            inner.offset += write_size;
            total_write_size += write_size;
        }
        Ok(total_write_size)
    }
}
