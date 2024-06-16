use alloc::sync::Arc;
use ext4::{
    Ext4, Ext4Inode, Ext4InodeRef, InodeFileType, LinuxStat, EXT4_INODE_MODE_FILE,
    EXT4_INODE_MODE_TYPE_MASK,
};

use crate::{
    fs::{Inode, InodeType, Kstat},
    utils::{SysErrNo, SyscallRet},
};

pub struct Ext4OsInode {
    file: Ext4InodeRef,
    ext4: Arc<Ext4>,
}

impl Ext4OsInode {
    fn empty(ext4: Arc<Ext4>) -> Self {
        Self {
            file: Ext4InodeRef {
                inode_num: 0,
                inode: Ext4Inode::default(),
            },
            ext4,
        }
    }

    fn new(file: Ext4InodeRef, ext4: Arc<Ext4>) -> Self {
        Self { file, ext4 }
    }
}

impl Inode for Ext4OsInode {
    fn size(&self) -> usize {
        self.file.inode.size() as usize
    }

    fn node_type(&self) -> InodeType {
        let mode = self.file.inode.mode() & EXT4_INODE_MODE_TYPE_MASK;
        as_inode_type(mode)
    }

    fn fstat(&self) -> Kstat {
        let stat = LinuxStat::from_inode_ref(&self.file);
        Kstat {
            st_dev: stat.st_dev as usize,
            st_ino: stat.st_ino as usize,
            st_mode: stat.st_mode as u32,
            st_nlink: stat.st_nlink as u32,
            st_uid: stat.st_uid as u32,
            st_gid: stat.st_gid as u32,
            st_rdev: stat.st_rdev as usize,
            st_size: stat.st_size as isize,
            st_blksize: stat.st_blksize as i32,
            st_blocks: stat.st_blocks as isize,
            st_atime: stat.st_atime as isize,
            st_atime_nsec: stat.st_atime_nsec as usize,
            st_mtime: stat.st_mtime as isize,
            st_mtime_nsec: stat.st_mtime_nsec as usize,
            st_ctime: stat.st_ctime as isize,
            st_ctime_nsec: stat.st_ctime_nsec as usize,
            __pad: 0,
            __pad2: 0,
            __unused: [0; 2],
        }
    }
    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet {
        if let Ok(bytes_write) = self.ext4.write_at(self.file.inode_num, off, buf) {
            Ok(bytes_write)
        } else {
            Err(SysErrNo::EIO)
        }
    }
    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        if let Ok(bytes_read) = self.ext4.read_at(self.file.inode_num, off, buf) {
            Ok(bytes_read)
        } else {
            Err(SysErrNo::EIO)
        }
    }
}

fn as_inode_type(ty: u16) -> InodeType {
    let ext4_inode_type = InodeFileType::from_bits(ty).unwrap();
    match ext4_inode_type {
        InodeFileType::S_IFBLK => InodeType::BlockDevice,
        InodeFileType::S_IFCHR => InodeType::CharDevice,
        InodeFileType::S_IFDIR => InodeType::Dir,
        InodeFileType::S_IFIFO => InodeType::Fifo,
        InodeFileType::S_IFLNK => InodeType::SymLink,
        InodeFileType::S_IFREG => InodeType::File,
        InodeFileType::S_IFSOCK => InodeType::Socket,
        _ => InodeType::Unknown,
    }
}
