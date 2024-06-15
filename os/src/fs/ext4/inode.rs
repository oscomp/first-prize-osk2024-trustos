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

pub struct Ext4Inode {
    file: Mutex<Ext4File>,
    ext4: Arc<Ext4>,
}

impl Ext4Inode {
    pub fn empty(ext4: Arc<Ext4>) -> Self {
        Self {
            file: Mutex::new(Ext4File::new()),
            ext4,
        }
    }
    pub fn new(ext4: Arc<Ext4>, file: Ext4File) -> Self {
        Self {
            file: Mutex::new(file),
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

        let inode = Ext4Inode::empty(self.ext4.clone());
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
    fn find_by_path(&self, path: &str) -> Option<Arc<dyn Inode>> {
        let mut file = self.file.lock();

        let inode = Ext4Inode::empty(self.ext4.clone());
        let mut nfile = inode.file.lock();

        if let Err(_) = self.ext4.ext4_open(&mut nfile, path, "r+", false) {
            None
        } else {
            drop(nfile);
            Some(Arc::new(inode))
        }
    }
    fn fstat(&self) -> Kstat {
        let file = self.file.lock();
        let inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        let inode = &inode_ref.inner.inode;
        Kstat {
            st_ino: file.inode as usize,
            st_mode: inode.mode as u32,
            st_nlink: inode.links_count as u32,
            st_uid: inode.uid as u32,
            st_gid: inode.gid as u32,
            st_size: inode.size as isize,
            st_blksize: 4096,
            st_blocks: inode.blocks as isize * 8,
            st_atime: inode.atime as isize,
            st_mtime: inode.mtime as isize,
            st_ctime: inode.ctime as isize,
            ..Kstat::empty()
        }
    }
    fn ls(&self) -> Vec<String> {
        let file = self.file.lock();
        self.ext4
            .read_dir_entry(file.inode as _)
            .into_iter()
            .map(|de| de.get_name())
            .collect()
    }
    fn read_dentry(&self, off: usize, len: usize) -> Option<(Vec<u8>, isize)> {
        let file = self.file.lock();
        let entries = self.ext4.read_dir_entry(file.inode as _);
        let mut de: Vec<u8> = Vec::new();
        let (mut cur, mut res, mut f_off) = (0usize, 0usize, 0usize);
        for entry in entries {
            let name = entry.get_name();
            let dtype = map_dir_imode(entry.get_de_type()) as u8;
            let dirent = Dirent::new(name, entry.entry_len as i64, entry.inode as u64, dtype);
            // 忽略offset之前的Dirent
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
    fn rename(&self, file: Arc<dyn Inode>) -> GeneralRet {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(file) as *const Ext4Inode);
            let mut other = inode.file.lock();
            let mut this = self.file.lock();
            this.flags = other.flags;
            this.fpos = other.fpos;
            this.fsize = other.fsize;
            this.inode = other.inode;
            this.mp = other.mp.clone();
            inode.ext4.ext4_file_close(&mut other);
        }
        Ok(())
    }
    fn set_timestamps(&self, atime_sec: Option<u64>, mtime_sec: Option<u64>) -> GeneralRet {
        let file = self.file.lock();
        let mut inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        if let Some(atime) = atime_sec {
            inode_ref.inner.inode.atime = atime as u32;
        }
        if let Some(mtime) = mtime_sec {
            inode_ref.inner.inode.mtime = mtime as u32;
        }
        Ok(())
    }
    fn sync(&self) {
        todo!()
    }
    fn truncate(&self) -> GeneralRet {
        let file = self.file.lock();
        let mut inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        self.ext4.ext4_trunc_inode(&mut inode_ref, 0);
        Ok(())
    }
    fn unlink(&self, child: &str) -> GeneralRet {
        let file = self.file.lock();
        let inode = Ext4Inode::empty(self.ext4.clone());
        let mut nfile = inode.file.lock();

        if let Err(_) = self.ext4.ext4_open(&mut nfile, child, "w+", false) {
            return Err(SysErrNo::EINVAL);
        }

        let mut parent_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), file.inode);
        let mut child_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(&self.ext4), nfile.inode);
        self.ext4
            .ext4_unlink(&mut parent_ref, &mut child_ref, child, child.len() as u32);
        Ok(())
    }

    fn read_all(&self) -> Result<Vec<u8>, SysErrNo> {
        let mut file = self.file.lock();
        let mut buf: Vec<u8> = Vec::with_capacity(file.fsize as usize);
        let mut read_cnt: usize = 0;
        let size = file.fsize as usize;
        if let Ok(_) = self
            .ext4
            .ext4_file_read(&mut file, buf.as_mut_slice(), size, &mut read_cnt)
        {
            if read_cnt != size as usize {
                return Err(SysErrNo::EIO);
            }
            return Ok(buf);
        } else {
            Err(SysErrNo::EIO)
        }
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
        InodeType::Unknown => DirEntryType::EXT4_DE_REG_FILE,
    }
}
fn map_dir_imode(imode: u8) -> InodeType {
    let type_code = ext4_rs::DirEntryType::from_bits(imode as u8).unwrap();
    match type_code {
        DirEntryType::EXT4_DE_REG_FILE => InodeType::File,
        DirEntryType::EXT4_DE_DIR => InodeType::Dir,
        DirEntryType::EXT4_DE_CHRDEV => InodeType::CharDevice,
        DirEntryType::EXT4_DE_BLKDEV => InodeType::BlockDevice,
        DirEntryType::EXT4_DE_FIFO => InodeType::Fifo,
        DirEntryType::EXT4_DE_SOCK => InodeType::Socket,
        DirEntryType::EXT4_DE_SYMLINK => InodeType::SymLink,
        _ => {
            // log::info!("{:x?}", imode);
            InodeType::File
        }
    }
}
