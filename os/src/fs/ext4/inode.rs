use alloc::{string::String, sync::Arc, vec::Vec};
use ext4_rs::{
    DirEntryType, Errnum, Ext4, Ext4File, Ext4InodeRef, EXT4_INODE_MODE_DIRECTORY,
    EXT4_INODE_MODE_FILE, EXT4_INODE_MODE_SOFTLINK, EXT4_INODE_MODE_TYPE_MASK,
};
use spin::Mutex;

use crate::{
    fs::{Dirent, Inode, InodeType, Kstat, OpenFlags},
    utils::{GeneralRet, SysErrNo, SyscallRet},
};

struct Ext4Inode {
    file: Mutex<Ext4File>,
    ext4: Arc<Ext4>,
}

impl Ext4Inode {
    fn new(ext4: Arc<Ext4>) -> Self {
        Self {
            file: Mutex::new(Ext4File::new()),
            ext4,
        }
    }
}
impl Inode for Ext4Inode {
    fn size(&self) -> usize {
        let file = self.file.lock();
        file.fsize as usize
    }
    fn node_type(&self) -> InodeType {
        let file = self.file.lock();
        let root_inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        let inode_mod = root_inode_ref.inner.inode.mode & EXT4_INODE_MODE_TYPE_MASK;
        as_inode_type(inode_mod)
    }

    fn create(&self, path: &str, ty: InodeType) -> Option<Arc<dyn Inode>> {
        let file = self.file.lock();
        let types = as_ext4_type(ty);

        let inode = Ext4Inode::new(self.ext4.clone());
        let mut nfile = inode.file.lock();

        if types == DirEntryType::EXT4_DE_DIR {
            inode.ext4.ext4_dir_mk(&mut nfile, path);
        } else {
            inode.ext4.ext4_open(&mut nfile, path, "w+", true);
        }
        drop(nfile);

        return Some(Arc::new(inode));
    }

    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        let mut file = self.file.lock();
        file.fpos = off as usize;

        let read_len = buf.len();
        let mut read_cnt = 0;

        self.ext4
            .ext4_file_read(&mut file, buf, read_len, &mut read_cnt);

        Ok(read_len)
    }

    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet {
        let mut file = self.file.lock();
        file.fpos = off as usize;

        let write_size = buf.len();

        self.ext4.ext4_file_write(&mut file, &buf, write_size);

        Ok(write_size)
    }
    fn delete(&self) {}
    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>> {
        let mut file = self.file.lock();
        let r = self.ext4.ext4_open(&mut file, path, "r+", false);

        if let Err(e) = r {
            None
        } else {
            todo!()
        }
    }
    fn fstat(&self) -> Kstat {
        let file = self.file.lock();
        let inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        let inode = &inode_ref.inner.inode;
        Kstat {
            st_ino: file.inode as u64,
            st_mode: inode.mode as u32,
            st_nlink: inode.links_count as u32,
            st_uid: inode.uid as u32,
            st_gid: inode.gid as u32,
            st_size: inode.size as u64,
            st_blksize: 4096,
            st_blocks: inode.blocks as u64 * 8,
            st_atime_sec: inode.atime as i64,
            st_mtime_sec: inode.mtime as i64,
            st_ctime_sec: inode.ctime as i64,
            ..Kstat::empty()
        }
    }
    fn link(&self) {
        todo!()
    }
    fn ls(&self) -> Vec<String> {
        let file = self.file.lock();
        self.ext4
            .read_dir_entry(file.inode as _)
            .into_iter()
            .map(|de| de.get_name())
            .collect()
    }
    fn read_dentry(&self, off: usize) -> Option<Dirent> {
        todo!()
    }
    fn rename(&self, file: Arc<dyn Inode>) -> GeneralRet {
        todo!()
    }
    fn set_timestamps(&self, atime_sec: Option<u64>, mtime_sec: Option<u64>) -> GeneralRet {
        todo!()
    }
    fn sync(&self) {
        todo!()
    }
    fn truncate(&self) -> GeneralRet {
        todo!()
    }
    fn unlink(&self) -> GeneralRet {
        todo!()
    }
}

fn as_inode_type(ty: u16) -> InodeType {
    if ty == EXT4_INODE_MODE_FILE as u16 {
        InodeType::File
    } else if ty == EXT4_INODE_MODE_DIRECTORY as u16 {
        InodeType::Dir
    } else if ty == EXT4_INODE_MODE_SOFTLINK as u16 {
        InodeType::SymLink
    } else {
        todo!()
    }
}

fn as_ext4_type(ty: InodeType) -> DirEntryType {
    match ty {
        InodeType::Fifo => DirEntryType::EXT4_DE_FIFO,
        InodeType::CharDevice => DirEntryType::EXT4_DE_CHRDEV,
        InodeType::Dir => DirEntryType::EXT4_DE_DIR,
        InodeType::BlockDevice => DirEntryType::EXT4_DE_BLKDEV,
        InodeType::File => DirEntryType::EXT4_DE_REG_FILE,
        InodeType::SymLink => DirEntryType::EXT4_DE_SYMLINK,
        InodeType::Socket => DirEntryType::EXT4_DE_SOCK,
    }
}
