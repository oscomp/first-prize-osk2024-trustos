use crate::{
    fs::{vfs::Inode, Dirent, InodeType, Kstat, OpenFlags},
    utils::{path2vec, trim_first_point_slash, GeneralRet, SysErrNo, SyscallRet},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use fat32_fs::{VFile, ATTR_ARCHIVE, ATTR_DIRECTORY, ATTR_SYMLINK};

type FatInode = VFile;

impl Inode for FatInode {
    fn size(&self) -> usize {
        self.get_size() as usize
    }
    fn node_type(&self) -> InodeType {
        as_inode_type(self.get_attribute())
    }
    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        Ok(self.read_at(off, buf))
    }
    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet {
        Ok(self.write_at(off, buf))
    }
    fn read_dentry(&self, off: usize, len: usize) -> Option<(Vec<u8>, isize)> {
        let mut res = 0;
        let mut vec = Vec::new();
        let mut offset = off;
        while let Some((name, off, ino, dtype)) = self.dirent_info(offset) {
            let dirent = Dirent::new(name, off as i64, ino as u64, as_inode_type(dtype) as u8);
            if res + dirent.len() > len {
                break;
            }
            res += dirent.len();
            vec.extend_from_slice(dirent.as_bytes());
            offset = dirent.off() as usize;
        }
        if res != 0 {
            Some((vec, offset as isize))
        } else {
            None
        }
    }
    fn fstat(&self) -> Kstat {
        let (st_ino, st_size, st_atime, st_mtime, st_ctime, st_blocks, st_mode) = self.stat();
        Kstat {
            st_ino,
            st_mode,
            st_nlink: 1,
            st_size,
            st_blksize: 512,
            st_blocks,
            st_atime,
            st_mtime,
            st_ctime,
            ..Kstat::empty()
        }
    }
    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>> {
        let pathv = path2vec(path);
        if let Some(node) = self.find_vfile_path(&pathv) {
            Some(node)
        } else {
            None
        }
    }
    fn create(&self, path: &str, ty: InodeType) -> Option<Arc<dyn Inode>> {
        let path = trim_first_point_slash(path);
        if let Some(node) = self.create(path, as_fat32_type(ty)) {
            Some(node)
        } else {
            None
        }
    }

    fn truncate(&self, size: usize) -> GeneralRet {
        self.clear();
        self.set_size(0);
        Ok(())
    }
    fn sync(&self) {
        self.sync();
    }
    fn set_timestamps(&self, atime_sec: Option<u64>, mtime_sec: Option<u64>) -> GeneralRet {
        if let Some(atime) = atime_sec {
            self.set_accessed_time(atime);
        }
        if let Some(mtime) = mtime_sec {
            self.set_modification_time(mtime);
        }
        Ok(())
    }
    fn unlink(&self, child: &str) -> GeneralRet {
        self.remove();
        Ok(())
    }

    fn rename(&self, file: Arc<dyn Inode>) -> GeneralRet {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(file) as *const VFile);
            self.set_size(inode.size() as u32);
            self.set_first_cluster(inode.first_cluster());
            inode.delete();
        }
        Ok(())
    }
    fn ls(&self) -> Vec<String> {
        self.ls().unwrap().into_iter().map(|(s, _)| s).collect()
    }
}

fn as_inode_type(ty: u8) -> InodeType {
    // match ty {
    //     ATTR_DIRECTORY => InodeType::Dir,
    //     ATTR_SYMLINK => InodeType::SymLink,
    //     _ => InodeType::File,
    // }
    if ty & ATTR_DIRECTORY != 0 {
        InodeType::Dir
    } else if ty & ATTR_ARCHIVE != 0 {
        InodeType::File
    } else {
        InodeType::Unknown
    }
}

fn as_fat32_type(ty: InodeType) -> u8 {
    match ty {
        InodeType::File => ATTR_ARCHIVE,
        InodeType::Dir => ATTR_DIRECTORY,
        InodeType::SymLink => ATTR_SYMLINK,
        _ => unreachable!(),
    }
}
