use alloc::{string::String, sync::Arc, vec, vec::Vec};
use ext4::{
    Ext4, Ext4Inode, Ext4InodeRef, InodeFileType, LinuxStat, EXT4_INODE_MODE_FILE,
    EXT4_INODE_MODE_TYPE_MASK, ROOT_INODE,
};

use crate::{
    fs::{Dirent, Inode, InodeType, Kstat},
    sync::SyncUnsafeCell,
    utils::{GeneralRet, SysErrNo, SyscallRet},
};

pub struct Ext4OsInode {
    file: SyncUnsafeCell<Ext4InodeRef>,
    ext4: Arc<Ext4>,
}

impl Ext4OsInode {
    pub fn empty(ext4: Arc<Ext4>) -> Self {
        Self {
            file: SyncUnsafeCell::new(Ext4InodeRef {
                inode_num: 0,
                inode: Ext4Inode::default(),
            }),
            ext4,
        }
    }

    pub fn new(file: Ext4InodeRef, ext4: Arc<Ext4>) -> Self {
        Self {
            file: SyncUnsafeCell::new(file),
            ext4,
        }
    }
}

impl Inode for Ext4OsInode {
    fn size(&self) -> usize {
        self.file.get_unchecked_ref().inode.size() as usize
    }

    fn node_type(&self) -> InodeType {
        let mode = self.file.get_unchecked_ref().inode.mode() & EXT4_INODE_MODE_TYPE_MASK;
        as_inode_type(mode)
    }

    fn fstat(&self) -> Kstat {
        let stat = LinuxStat::from_inode_ref(self.file.get_unchecked_ref());
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
        let file = self.file.get_unchecked_ref();
        if let Ok(bytes_write) = self.ext4.write_at(file.inode_num, off, buf) {
            Ok(bytes_write)
        } else {
            Err(SysErrNo::EIO)
        }
    }
    fn read_at(&self, off: usize, buf: &mut [u8]) -> SyscallRet {
        let file = self.file.get_unchecked_ref();
        if let Ok(bytes_read) = self.ext4.read_at(file.inode_num, off, buf) {
            Ok(bytes_read)
        } else {
            Err(SysErrNo::EIO)
        }
    }
    fn ls(&self) -> Vec<String> {
        self.ext4
            .dir_get_entries(ROOT_INODE)
            .into_iter()
            .map(|entry| entry.get_name())
            .collect()
    }

    fn set_timestamps(&self, atime_sec: Option<u64>, mtime_sec: Option<u64>) -> GeneralRet {
        let file = self.file.get_unchecked_mut();
        if let Some(atime) = atime_sec {
            file.inode.set_atime(atime as u32);
        }
        if let Some(mtime) = mtime_sec {
            file.inode.set_mtime(mtime as u32);
        }
        Ok(())
    }

    fn truncate(&self, size: usize) -> GeneralRet {
        let file = self.file.get_unchecked_mut();
        if let Err(_) = self.ext4.truncate_inode(file, 0) {
            Err(SysErrNo::EINVAL)
        } else {
            Ok(())
        }
    }

    fn create(&self, path: &str, ty: InodeType) -> Option<Arc<dyn Inode>> {
        let mode = as_ext4_type(ty).bits();
        let parent = self.file.get_unchecked_ref();
        if let Ok(inode) = self.ext4.create(parent.inode_num, path, mode) {
            Some(Arc::new(Ext4OsInode::new(inode, self.ext4.clone())))
        } else {
            None
        }
    }

    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>> {
        let parent = self.file.get_unchecked_ref();
        let mut name_off = 0u32;
        let mut parent_inode_num = parent.inode_num;
        if let Ok(child_inode) =
            self.ext4
                .generic_open(path, &mut parent_inode_num, false, 0, &mut name_off)
        {
            let child = self.ext4.get_inode_ref(child_inode);
            Some(Arc::new(Ext4OsInode::new(child, self.ext4.clone())))
        } else {
            None
        }
    }

    fn rename(&self, file: Arc<dyn Inode>) -> GeneralRet {
        todo!()
    }

    fn sync(&self) {
        let file = self.file.get_unchecked_mut();
        self.ext4.write_back_inode(file);
    }

    fn read_all(&self) -> Result<Vec<u8>, SysErrNo> {
        let file = self.file.get_unchecked_ref();
        let size = file.inode.size() as usize;
        let mut buf = vec![0u8; size];
        if let Ok(_) = self.ext4.read_at(file.inode_num, 0, buf.as_mut_slice()) {
            Ok(buf)
        } else {
            Err(SysErrNo::EIO)
        }
    }
    fn unlink(&self, child_name: &str) -> GeneralRet {
        let parent = self.file.get_unchecked_mut();
        if let Some(child) = self.find_by_path(child_name) {
            unsafe {
                let child_inode = Arc::from_raw(Arc::into_raw(child) as *const Ext4OsInode);
                let child_ref = child_inode.file.get_unchecked_mut();
                self.ext4.unlink(parent, child_ref, child_name);
            };
            Ok(())
        } else {
            Err(SysErrNo::ECHILD)
        }
    }

    fn read_dentry(&self, off: usize, len: usize) -> Option<(Vec<u8>, isize)> {
        let file = self.file.get_unchecked_ref();
        let entries = self.ext4.dir_get_entries(file.inode_num);
        let mut de: Vec<u8> = Vec::new();
        let (mut cur, mut res, mut f_off) = (0usize, 0usize, 0usize);
        for entry in entries {
            let name = entry.get_name();
            let dtype = entry.get_de_type();
            let offset = entry.entry_len() as i64;
            let ino = entry.inode as u64;
            let dirent = Dirent::new(name, offset, ino, dtype);
            if cur < off {
                cur += dirent.len();
                continue;
            }
            if res + dirent.len() > len {
                break;
            }
            res += dirent.len();
            f_off = dirent.off();
            de.extend_from_slice(dirent.as_bytes());
        }
        if res != 0 {
            Some((de, f_off as isize))
        } else {
            None
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

fn as_ext4_type(ty: InodeType) -> InodeFileType {
    match ty {
        InodeType::BlockDevice => InodeFileType::S_IFBLK,
        InodeType::CharDevice => InodeFileType::S_IFCHR,
        InodeType::Dir => InodeFileType::S_IFDIR,
        InodeType::Fifo => InodeFileType::S_IFIFO,
        InodeType::File => InodeFileType::S_IFREG,
        InodeType::Socket => InodeFileType::S_IFSOCK,
        InodeType::SymLink => InodeFileType::S_IFLNK,
        InodeType::Unknown => InodeFileType::S_IFREG,
    }
}
