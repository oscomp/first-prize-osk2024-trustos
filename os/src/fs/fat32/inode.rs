use crate::{
    fs::{vfs::Inode, Dirent, InodeType, Kstat, OpenFlags},
    utils::{path2vec, trim_first_point_slash, GeneralRet, SysErrNo},
};
use alloc::{string::String, sync::Arc, vec::Vec};
use fat32_fs::{VFile, ATTR_ARCHIVE, ATTR_DIRECTORY, ATTR_SYMLINK};

type FatInode = VFile;

impl Inode for FatInode {
    fn name(&self) -> String {
        self.get_name()
    }
    fn size(&self) -> usize {
        self.get_size() as usize
    }
    fn node_type(&self) -> InodeType {
        let attr = self.get_attribute();
        if attr == ATTR_DIRECTORY {
            InodeType::Dir
        } else if attr == ATTR_SYMLINK {
            InodeType::SymLink
        } else {
            InodeType::File
        }
    }
    fn read_at(&self, off: usize, buf: &mut [u8]) -> Result<usize, SysErrNo> {
        Ok(self.read_at(off, buf))
    }
    fn write_at(&self, off: usize, buf: &[u8]) -> Result<usize, SysErrNo> {
        Ok(self.write_at(off, buf))
    }
    fn read_dentry(&self, off: usize) -> Option<Dirent> {
        assert!(self.is_dir());
        if let Some((name, off, ino, dtype)) = self.dirent_info(off) {
            let mut dirent = Dirent::new();
            dirent.init(name, off as i64, ino as u64, dtype);
            Some(dirent)
        } else {
            None
        }
    }
    fn fstat(&self) -> Kstat {
        let (st_ino, st_size, st_atime, st_mtime, st_ctime, st_blocks, st_mode) = self.stat();
        let mut kstat = Kstat::new();
        kstat.init(
            st_ino as u64,
            st_size as u64,
            st_atime,
            st_mtime,
            st_ctime,
            st_blocks,
            st_mode,
        );
        kstat
    }
    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>> {
        let pathv = path2vec(path);
        if let Some(node) = self.find_vfile_path(&pathv) {
            Some(node)
        } else {
            None
        }
    }
    fn find_by_name(&self, name: &str) -> Option<Arc<dyn Inode>> {
        if let Some(node) = self.find_vfile_name(name) {
            Some(Arc::new(node))
        } else {
            None
        }
    }
    fn create(&self, name: &str, mode: OpenFlags) -> Option<Arc<dyn Inode>> {
        let path = trim_first_point_slash(name);
        let attribute = if mode.contains(OpenFlags::O_DIRECTORY) {
            ATTR_DIRECTORY
        } else {
            ATTR_ARCHIVE
        };
        if let Some(node) = self.create(name, attribute) {
            Some(node)
        } else {
            None
        }
    }
    fn mkdir(&self, name: &str, mode: OpenFlags) -> Result<(), SysErrNo> {
        todo!()
    }
    fn truncate(&self) -> Result<(), SysErrNo> {
        self.set_size(0);
        Ok(())
    }
    fn sync(&self) {
        self.sync();
    }
    fn set_timestamps(
        &self,
        atime_sec: Option<u64>,
        atime_nsec: Option<u64>,
        mtime_sec: Option<u64>,
        mtime_nsec: Option<u64>,
    ) -> Result<(), SysErrNo> {
        if let Some(atime) = atime_sec {
            self.set_accessed_time(atime);
        }
        if let Some(mtime) = mtime_sec {
            self.set_modification_time(mtime);
        }
        Ok(())
    }
    fn link(&self) {
        self.setsym();
    }
    fn unlink(&self) -> Result<(), SysErrNo> {
        self.remove();
        Ok(())
    }

    fn rename(&self, file: Arc<dyn Inode>) -> Result<(), SysErrNo> {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(file) as *const VFile);
            self.set_size(inode.size() as u32);
            self.set_first_cluster(inode.first_cluster());
        }
        Ok(())
    }

    fn delete(&self) {
        self.delete();
    }
    fn ls(&self) -> Option<Vec<(String, u8)>> {
        self.ls()
    }
}
