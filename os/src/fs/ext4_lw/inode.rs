use lwext4_rust::{
    bindings::{O_CREAT, O_RDONLY, O_RDWR, O_TRUNC, SEEK_SET},
    Ext4File, InodeTypes,
};

use crate::{
    fs::{Dirent, Inode, InodeType, Kstat, String},
    sync::SyncUnsafeCell,
    utils::{GeneralRet, SysErrNo, SyscallRet},
};

use alloc::{sync::Arc, vec, vec::Vec};

pub struct Ext4Inode(SyncUnsafeCell<Ext4File>);

unsafe impl Send for Ext4Inode {}
unsafe impl Sync for Ext4Inode {}

impl Ext4Inode {
    pub fn new(path: &str, types: InodeTypes) -> Self {
        Ext4Inode(SyncUnsafeCell::new(Ext4File::new(path, types)))
    }
}

impl Inode for Ext4Inode {
    fn size(&self) -> usize {
        let file = self.0.get_unchecked_mut();
        let types = as_inode_type(file.file_type());
        if types == InodeType::File {
            let path = file.path();
            let path = path.to_str().unwrap();
            file.file_open(path, O_RDONLY);
            let fsize = file.file_size();
            let _ = file.file_close();
            fsize as usize
        } else {
            0
        }
    }
    /// Ext4Inode创建必须使用绝对路径
    fn create(&self, path: &str, ty: InodeType) -> Result<Arc<dyn Inode>, SysErrNo> {
        let types = as_ext4_de_type(ty);
        let file = self.0.get_unchecked_mut();
        let nf = Ext4Inode::new(path, types.clone());

        if !file.check_inode_exist(path, types.clone()) {
            let nfile = nf.0.get_unchecked_mut();
            if types == InodeTypes::EXT4_DE_DIR {
                if nfile.dir_mk(path).is_err() {
                    return Err(SysErrNo::ENOENT);
                }
            } else if nfile.file_open(path, O_RDWR | O_CREAT | O_TRUNC).is_err() {
                return Err(SysErrNo::ENOENT);
            } else {
                nfile.file_close();
            }
        }
        Ok(Arc::new(nf))
    }

    fn types(&self) -> InodeType {
        as_inode_type(self.0.get_unchecked_mut().file_type())
    }

    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        let file = self.0.get_unchecked_mut();
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDONLY).map_err(|_| SysErrNo::EIO)?;
        file.file_seek(off as i64, SEEK_SET)
            .map_err(|_| SysErrNo::EIO)?;
        let r = file.file_read(buf);
        let _ = file.file_close();
        r.map_err(|_| SysErrNo::EIO)
    }

    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet {
        let file = self.0.get_unchecked_mut();
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDWR).map_err(|_| SysErrNo::EIO)?;
        file.file_seek(off as i64, SEEK_SET)
            .map_err(|_| SysErrNo::EIO)?;
        let r = file.file_write(buf);
        let _ = file.file_close();
        r.map_err(|_| SysErrNo::EIO)
    }

    fn truncate(&self, size: usize) -> GeneralRet {
        let file = self.0.get_unchecked_mut();
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDWR | O_CREAT | O_TRUNC)
            .map_err(|_| SysErrNo::EIO)?;

        let t = file.file_truncate(size as u64);
        let _ = file.file_close();
        t.map_or(Err(SysErrNo::EIO), |_| Ok(()))
    }

    fn rename(&self, path: &str, new_path: &str) -> SyscallRet {
        let file = self.0.get_unchecked_mut();
        file.file_rename(path, new_path)
            .map_or(Err(SysErrNo::ENOENT), |_| Ok(0))
    }

    fn set_timestamps(&self, atime: Option<u32>, mtime: Option<u32>) -> GeneralRet {
        let file = self.0.get_unchecked_mut();
        file.set_time(atime, mtime, None).unwrap();
        Ok(())
    }
    fn sync(&self) {
        self.0.get_unchecked_mut().file_cache_flush();
    }

    fn read_all(&self) -> Result<Vec<u8>, SysErrNo> {
        let file = self.0.get_unchecked_mut();
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDONLY).map_err(|_| SysErrNo::EIO)?;
        let mut buf: Vec<u8> = vec![0; file.file_size() as usize];
        file.file_seek(0, SEEK_SET).map_err(|_| SysErrNo::EIO)?;
        let r = file.file_read(buf.as_mut_slice());
        let _ = file.file_close();
        r.map_or(Err(SysErrNo::EIO), |_| Ok(buf))
    }

    fn find(&self, path: &str) -> Result<Arc<dyn Inode>, SysErrNo> {
        let file = self.0.get_unchecked_mut();
        if file.check_inode_exist(path, InodeTypes::EXT4_DE_DIR) {
            Ok(Arc::new(Ext4Inode::new(path, InodeTypes::EXT4_DE_DIR)))
        } else if file.check_inode_exist(path, InodeTypes::EXT4_DE_REG_FILE) {
            Ok(Arc::new(Ext4Inode::new(path, InodeTypes::EXT4_DE_REG_FILE)))
        } else {
            Err(SysErrNo::ENOENT)
        }
    }

    fn fstat(&self) -> Kstat {
        let file = self.0.get_unchecked_mut();
        let stat = file.fstat().unwrap();
        Kstat {
            st_dev: stat.st_dev,
            st_ino: stat.st_ino,
            st_mode: stat.st_mode,
            st_nlink: stat.st_nlink,
            st_uid: stat.st_uid,
            st_gid: stat.st_gid,
            st_size: stat.st_size,
            st_blksize: stat.st_blksize,
            st_blocks: stat.st_blocks,
            st_atime: stat.st_atime,
            st_ctime: stat.st_ctime,
            st_mtime: stat.st_mtime,
            ..Kstat::default()
        }
    }
    fn read_dentry(&self, off: usize, len: usize) -> Option<(Vec<u8>, isize)> {
        let file = self.0.get_unchecked_mut();
        let entries = file.read_dir_from(off as u64).unwrap();
        let mut de: Vec<u8> = Vec::new();
        let (mut res, mut f_off) = (0usize, usize::MAX);
        for entry in entries {
            let dirent = Dirent {
                d_ino: entry.d_ino,
                d_off: entry.d_off,
                d_reclen: entry.d_reclen,
                d_type: entry.d_type,
                d_name: entry.d_name,
            };
            if res + dirent.len() > len {
                break;
            }
            res += dirent.len();
            f_off = dirent.off();
            de.extend_from_slice(dirent.as_bytes());
        }
        (res != 0).then(|| (de, f_off as isize))
    }

    fn link_cnt(&self) -> SyscallRet {
        let file = self.0.get_unchecked_mut();
        file.links_cnt()
            .map_or(Err(SysErrNo::EIO), |cnt| Ok(cnt as usize))
    }

    fn unlink(&self, path: &str) -> GeneralRet {
        let file = self.0.get_unchecked_mut();
        file.file_remove(path)
            .map_or(Err(SysErrNo::EIO), |_| Ok(()))
    }

    fn path(&self) -> String {
        self.0.get_unchecked_ref().path().into_string().unwrap()
    }
}

impl Drop for Ext4Inode {
    fn drop(&mut self) {
        let file = self.0.get_unchecked_mut();
        // debug!("Drop struct FileWrapper {:?}", file.get_path());
        file.file_close().expect("failed to close fd");
    }
}

fn as_ext4_de_type(types: InodeType) -> InodeTypes {
    match types {
        InodeType::BlockDevice => InodeTypes::EXT4_DE_BLKDEV,
        InodeType::CharDevice => InodeTypes::EXT4_DE_CHRDEV,
        InodeType::Dir => InodeTypes::EXT4_DE_DIR,
        InodeType::Fifo => InodeTypes::EXT4_DE_FIFO,
        InodeType::File => InodeTypes::EXT4_DE_REG_FILE,
        InodeType::Socket => InodeTypes::EXT4_DE_SOCK,
        InodeType::SymLink => InodeTypes::EXT4_DE_SYMLINK,
        InodeType::Unknown => InodeTypes::EXT4_DE_UNKNOWN,
    }
}

fn as_inode_type(types: InodeTypes) -> InodeType {
    match types {
        InodeTypes::EXT4_INODE_MODE_FIFO => InodeType::Fifo,
        InodeTypes::EXT4_INODE_MODE_CHARDEV => InodeType::CharDevice,
        InodeTypes::EXT4_INODE_MODE_DIRECTORY => InodeType::Dir,
        InodeTypes::EXT4_INODE_MODE_BLOCKDEV => InodeType::BlockDevice,
        InodeTypes::EXT4_INODE_MODE_FILE => InodeType::File,
        InodeTypes::EXT4_INODE_MODE_SOFTLINK => InodeType::SymLink,
        InodeTypes::EXT4_INODE_MODE_SOCKET => InodeType::Socket,
        _ => {
            // warn!("unknown file type: {:?}", vtype);
            unreachable!()
        }
    }
}
