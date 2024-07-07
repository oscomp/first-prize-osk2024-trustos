use log::debug;
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

pub struct Ext4Inode {
    inner: SyncUnsafeCell<Ext4InodeInner>,
}

pub struct Ext4InodeInner {
    f: Ext4File,
    delay: bool,
}

unsafe impl Send for Ext4Inode {}
unsafe impl Sync for Ext4Inode {}

impl Ext4Inode {
    pub fn new(path: &str, types: InodeTypes) -> Self {
        Ext4Inode {
            inner: SyncUnsafeCell::new(Ext4InodeInner {
                f: Ext4File::new(path, types),
                delay: false,
            }),
        }
    }
}

impl Inode for Ext4Inode {
    fn size(&self) -> usize {
        let file = &mut self.inner.get_unchecked_mut().f;
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
        let file = &mut self.inner.get_unchecked_mut().f;
        let nf = Ext4Inode::new(path, types.clone());

        if !file.check_inode_exist(path, types.clone()) {
            let nfile = &mut nf.inner.get_unchecked_mut().f;
            if types == InodeTypes::EXT4_DE_DIR {
                if let Err(e) = nfile.dir_mk(path) {
                    return Err(SysErrNo::from(e));
                }
            } else if let Err(e) = nfile.file_open(path, O_RDWR | O_CREAT | O_TRUNC) {
                return Err(SysErrNo::from(e));
            } else {
                nfile.file_close();
            }
        }
        Ok(Arc::new(nf))
    }

    fn types(&self) -> InodeType {
        as_inode_type(self.inner.get_unchecked_mut().f.file_type())
    }

    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDONLY)
            .map_err(|e| SysErrNo::from(e))?;
        file.file_seek(off as i64, SEEK_SET)
            .map_err(|e| SysErrNo::from(e))?;
        let r = file.file_read(buf);
        let _ = file.file_close();
        r.map_err(|e| SysErrNo::from(e))
    }

    fn write_at(&self, off: usize, buf: &[u8]) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDWR)
            .map_err(|e| SysErrNo::from(e))?;
        file.file_seek(off as i64, SEEK_SET)
            .map_err(|e| SysErrNo::from(e))?;
        let r = file.file_write(buf);
        let _ = file.file_close();
        r.map_err(|e| SysErrNo::from(e))
    }

    fn truncate(&self, size: usize) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDWR | O_CREAT | O_TRUNC)
            .map_err(|e| SysErrNo::from(e))?;

        let t = file.file_truncate(size as u64);
        let _ = file.file_close();
        t.map_err(|e| SysErrNo::from(e))
    }

    fn rename(&self, path: &str, new_path: &str) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.file_rename(path, new_path)
            .map_or(Err(SysErrNo::ENOENT), |_| Ok(0))
    }

    fn set_timestamps(&self, atime: Option<u32>, mtime: Option<u32>) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.set_time(atime, mtime, None)
            .map_err(|e| SysErrNo::from(e))
    }
    fn sync(&self) {
        self.inner.get_unchecked_mut().f.file_cache_flush();
    }

    fn read_all(&self) -> Result<Vec<u8>, SysErrNo> {
        let file = &mut self.inner.get_unchecked_mut().f;
        let path = file.path();
        let path = path.to_str().unwrap();
        file.file_open(path, O_RDONLY)
            .map_err(|e| SysErrNo::from(e))?;
        let mut buf: Vec<u8> = vec![0; file.file_size() as usize];
        file.file_seek(0, SEEK_SET).map_err(|e| SysErrNo::from(e))?;
        let r = file.file_read(buf.as_mut_slice());
        file.file_close();
        if let Err(e) = r {
            Err(SysErrNo::from(e))
        } else {
            Ok(buf)
        }
    }

    fn find(&self, path: &str) -> Result<Arc<dyn Inode>, SysErrNo> {
        let file = &mut self.inner.get_unchecked_mut().f;
        if file.check_inode_exist(path, InodeTypes::EXT4_DE_DIR) {
            Ok(Arc::new(Ext4Inode::new(path, InodeTypes::EXT4_DE_DIR)))
        } else if file.check_inode_exist(path, InodeTypes::EXT4_DE_REG_FILE) {
            Ok(Arc::new(Ext4Inode::new(path, InodeTypes::EXT4_DE_REG_FILE)))
        } else {
            Err(SysErrNo::ENOENT)
        }
    }

    fn fstat(&self) -> Kstat {
        let file = &mut self.inner.get_unchecked_mut().f;
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
    fn read_dentry(&self, off: usize, len: usize) -> Result<(Vec<u8>, isize), SysErrNo> {
        let file = &mut self.inner.get_unchecked_mut().f;
        let entries = file
            .read_dir_from(off as u64)
            .map_err(|e| SysErrNo::from(e))?;
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
        // (res != 0).then(|| (de, f_off as isize))
        assert!(res != 0);
        Ok((de, f_off as isize))
    }

    fn read_link(&self, buf: &mut [u8], bufsize: usize) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.file_readlink(buf, bufsize)
            .map_err(|e| SysErrNo::from(e))
    }

    fn link_cnt(&self) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.links_cnt()
            .map_or(Err(SysErrNo::EIO), |cnt| Ok(cnt as usize))
    }

    fn unlink(&self, path: &str) -> SyscallRet {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.file_remove(path).map_err(|e| SysErrNo::from(e))
    }

    fn path(&self) -> String {
        self.inner
            .get_unchecked_ref()
            .f
            .path()
            .into_string()
            .unwrap()
    }
    fn delay(&self) {
        self.inner.get_unchecked_mut().delay = true;
    }

    fn fmode(&self) -> u32 {
        let file = &mut self.inner.get_unchecked_mut().f;
        file.file_mode().unwrap()
    }
}

impl Drop for Ext4Inode {
    fn drop(&mut self) {
        let path = self.path();
        let inner = self.inner.get_unchecked_mut();
        if inner.delay {
            debug!("Ext4Inode delays unlink {:?}", path);
            inner.f.file_remove(&path);
        }
        inner.f.file_close().expect("failed to close fd");
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
