use super::{find_vfile_idx, insert_vfile_idx, remove_vfile_idx, Dirent, File, Kstat};
use crate::{drivers::BLOCK_DEVICE, mm::UserBuffer};
use _core::str::FromStr;
use alloc::{string::String, sync::Arc, vec::Vec};
use bitflags::*;
use fat32_fs::{create_root_vfile, FAT32Manager, VFile, ATTR_ARCHIVE, ATTR_DIRECTORY};
use lazy_static::*;
use log::info;
use spin::{Mutex, MutexGuard};

pub struct OSInode {
    readable: bool, // 该文件是否允许通过 sys_read 进行读
    writable: bool, // 该文件是否允许通过 sys_write 进行写
    inode: Arc<VFile>,
    inner: Mutex<OSInodeInner>,
}
pub struct OSInodeInner {
    offset: usize, // 偏移量
    openflags: OpenFlags,
}
impl OSInode {
    pub fn new(readable: bool, writable: bool, inode: Arc<VFile>) -> Self {
        Self {
            readable,
            writable,
            inode,
            inner: Mutex::new(OSInodeInner {
                offset: 0,
                openflags: OpenFlags::empty(),
            }),
        }
    }
    #[deprecated]
    /// 只有读取elf_data时用到了read_all,但是随后又转为了&[u8],拷贝开销过大
    /// 使用read_as_elf
    pub fn read_all(&self) -> Vec<u8> {
        let mut inner = self.inner.lock();
        let mut buffer = [0u8; 512];
        let mut v: Vec<u8> = Vec::new();
        loop {
            let len = self.inode.read_at(inner.offset, &mut buffer);
            if len == 0 {
                break;
            }
            inner.offset += len;
            v.extend_from_slice(&buffer[..len]);
        }
        v
    }
    /// 将文件指针转换为切片,避免拷贝
    /// 读取完整的文件也可以用
    pub unsafe fn read_as_elf(&self) -> &[u8] {
        self.inode.read_as_elf()
    }

    pub fn is_dir(&self) -> bool {
        self.inode.is_dir()
    }

    pub fn name(&self) -> String {
        self.inode.get_name()
    }

    pub fn delete(&self) {
        self.inode.delete()
    }

    pub fn remove(&self) -> usize {
        self.inode.remove()
    }

    pub fn file_size(&self) -> usize {
        self.inode.get_size() as usize
    }

    pub fn set_file_size(&self, size: u32) {
        self.inode.set_size(size);
    }
    pub fn find(&self, path: &str, flags: OpenFlags) -> Option<Arc<OSInode>> {
        let pathv = path2vec(path);
        let (readable, writable) = flags.read_write();
        self.inode
            .find_vfile_path(&pathv)
            .map(|vfile| Arc::new(OSInode::new(readable, writable, vfile)))
    }

    pub fn fstat(&self, kstat: &mut Kstat) {
        let inner = self.inner.lock();
        let (st_ino, st_size, st_atime, st_mtime, st_ctime, _, st_blocks, st_mode) =
            self.inode.stat();
        kstat.init(
            st_ino as u64,
            st_size,
            st_atime,
            st_mtime,
            st_ctime,
            st_blocks,
            st_mode,
        );
    }

    pub fn dirent(&self, dirent: &mut Dirent) -> isize {
        if !self.is_dir() {
            return -1;
        }
        let mut inner = self.inner.lock();
        let offset = inner.offset as u32;
        if let Some((name, off, _, _)) = self.inode.dirent_info(offset as usize) {
            dirent.init(name.as_str());
            dirent.init_off(off as isize);
            inner.offset = off as usize;
            let len = (name.len() + 8 * 4) as isize;
            len
        } else {
            -1
        }
    }

    pub fn set_offset(&self, offset: usize) {
        let mut inner = self.inner.lock();
        inner.offset = offset;
    }

    pub fn offset(&self) -> usize {
        self.inner.lock().offset
    }
    pub fn set_accessed_time(&self, atime: u64) {
        self.inode.set_accessed_time(atime);
    }
    pub fn set_modification_time(&self, mtime: u64) {
        self.inode.set_modification_time(mtime);
    }
    pub fn accessed_time(&self) -> u64 {
        self.inode.accessed_time()
    }
    pub fn modification_time(&self) -> u64 {
        self.inode.modification_time()
    }

    pub fn get_openflags(&self) -> OpenFlags {
        self.inner.lock().openflags
    }
    pub fn set_openflags(&self, flags: OpenFlags) {
        self.inner.lock().openflags = flags;
    }
    pub fn set_cloexec(&self) {
        self.inner.lock().openflags |= OpenFlags::O_CLOEXEC;
    }
    pub fn unset_cloexec(&self) {
        self.inner.lock().openflags &= !OpenFlags::O_CLOEXEC;
    }

    pub fn sync(&self) {
        self.inode.sync();
    }

    pub fn setsym(&self) {
        self.inode.setsym();
    }
    pub fn sym(&self) -> bool {
        self.inode.sym()
    }

    pub fn first_cluster(&self) -> u32 {
        self.inode.first_cluster()
    }
    pub fn set_first_cluster(&self, first_cluster: u32) {
        self.inode.set_first_cluster(first_cluster);
    }

    pub fn create(&self, path: &str, flags: OpenFlags) -> Option<Arc<OSInode>> {
        let path = if path.starts_with("./") {
            &path[2..]
        } else {
            path
        };
        let (readable, writable) = flags.read_write();
        let attribute = {
            if flags.contains(OpenFlags::O_DIRECTROY) {
                ATTR_DIRECTORY
            } else {
                ATTR_ARCHIVE
            }
        };
        self.inode
            .create(path, attribute)
            .map(|vfile| Arc::new(OSInode::new(readable, writable, vfile)))
    }
}

lazy_static! {
    pub static ref ROOT_INODE: Arc<VFile> = {
        let fat32_manager = FAT32Manager::open(BLOCK_DEVICE.clone());
        Arc::new(create_root_vfile(&fat32_manager)) // 返回根目录
    };
}

pub fn list_apps() {
    println!("/**** APPS ****");
    for (app, _) in ROOT_INODE.ls().unwrap() {
        println!("{}", app);
    }
    println!("**************/");
}

pub fn create_df() {
    open(
        "/",
        "./proc",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTROY,
    );
    open(
        "./proc",
        "./mounts",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
    );
}

// 定义一份打开文件的标志
bitflags! {
    pub struct OpenFlags: u32 {
        // reserve 3 bits for the access mode
        const O_RDONLY      = 0;
        const O_WRONLY      = 1;
        const O_RDWR        = 2;
        const O_ACCMODE     = 3;
        const O_CREATE      = 0o100;
        const O_EXCL        = 0o200;
        const O_NOCTTY      = 0o400;
        const O_TRUNC       = 0o1000;
        const O_APPEND      = 0o2000;
        const O_NONBLOCK    = 0o4000;
        const O_DSYNC       = 0o10000;
        const O_SYNC        = 0o4010000;
        const O_RSYNC       = 0o4010000;
        const O_DIRECTROY   = 0o200000;
        const O_NOFOLLOW    = 0o400000;
        const O_CLOEXEC     = 0o2000000;    //描述符标志

        const O_ASYNC       = 0o20000;
        const O_DIRECT      = 0o40000;
        const O_LARGEFILE   = 0o100000;
        const O_NOATIME     = 0o1000000;
        const O_PATH        = 0o10000000;
        const O_TMPFILE     = 0o20200000;
    }
}

impl OpenFlags {
    pub fn read_write(&self) -> (bool, bool) {
        if self.is_empty() {
            (true, false)
        } else if self.contains(Self::O_WRONLY) {
            (false, true)
        } else {
            (true, true)
        }
    }
}
pub fn open_file(path: &str, flags: OpenFlags) -> Option<Arc<OSInode>> {
    open(&"/", path, flags)
}

#[inline(always)]
pub fn path2vec(path: &str) -> Vec<&str> {
    path.split('/').filter(|s| !s.is_empty()).collect()
}

#[inline(always)]
pub fn is_abs_path(path: &str) -> bool {
    unsafe { *path.as_ptr() == '/' as u8 }
}

fn create_file(
    cwd: &str,
    path: &str,
    flags: OpenFlags,
    abs_path: &str,
    parent_path: &str,
    child_name: &str,
) -> Option<Arc<OSInode>> {
    if let Some(parent_dir) = find_vfile_idx(parent_path) {
        let attribute = {
            if flags.contains(OpenFlags::O_DIRECTROY) {
                ATTR_DIRECTORY
            } else {
                ATTR_ARCHIVE
            }
        };
        let (readable, writable) = flags.read_write();
        return parent_dir.create(child_name, attribute).map(|vfile| {
            insert_vfile_idx(abs_path, vfile.clone());
            let mut osinode = OSInode::new(readable, writable, vfile);
            osinode.set_openflags(flags);
            Arc::new(osinode)
        });
    }
    let mut pathv = path2vec(path);
    pathv.pop();
    let cur_vfile = {
        if cwd == "/" {
            ROOT_INODE.clone()
        } else {
            ROOT_INODE.find_vfile_path(&path2vec(cwd)).unwrap()
        }
    };
    if let Some(parent_dir) = cur_vfile.find_vfile_path(&pathv) {
        let attribute = {
            if flags.contains(OpenFlags::O_DIRECTROY) {
                ATTR_DIRECTORY
            } else {
                ATTR_ARCHIVE
            }
        };
        let (readable, writable) = flags.read_write();
        parent_dir.create(child_name, attribute).map(|vfile| {
            insert_vfile_idx(abs_path, vfile.clone());
            let mut osinode = OSInode::new(readable, writable, vfile);
            osinode.set_openflags(flags);
            Arc::new(osinode)
        })
    } else {
        None
    }
}

pub fn open(cwd: &str, path: &str, flags: OpenFlags) -> Option<Arc<OSInode>> {
    use crate::fs::path2abs;
    use alloc::string::ToString;
    let abs_path = if is_abs_path(path) {
        path.to_string()
    } else {
        let mut wpath = {
            if cwd == "/" {
                Vec::with_capacity(32)
            } else {
                path2vec(cwd)
            }
        };
        path2abs(&mut wpath, &path2vec(path))
    };
    // 首先在FSIDX中查找文件是否存在
    if let Some(inode) = find_vfile_idx(&abs_path) {
        if flags.contains(OpenFlags::O_TRUNC) {
            let (mut parent_path, child_name) = abs_path.rsplit_once("/").unwrap();
            if parent_path.is_empty() {
                parent_path = "/";
            }
            remove_vfile_idx(&abs_path);
            inode.remove();
            return create_file(cwd, path, flags, &abs_path, parent_path, child_name);
        }
        let (readable, writable) = flags.read_write();
        let mut vfile = OSInode::new(readable, writable, inode);
        if flags.contains(OpenFlags::O_APPEND) {
            vfile.set_offset(vfile.file_size());
        }
        vfile.set_openflags(flags);
        return Some(Arc::new(vfile));
    }

    // 若在FSIDX中无法找到，尝试在FSIDX寻找父级目录
    let (mut parent_path, child_name) = abs_path.rsplit_once("/").unwrap();
    if parent_path.is_empty() {
        parent_path = "/";
    }
    if let Some(parent_inode) = find_vfile_idx(parent_path) {
        if let Some(inode) = parent_inode
            .find_vfile_name(child_name)
            .map(|f| Arc::new(f))
        {
            if flags.contains(OpenFlags::O_TRUNC) {
                remove_vfile_idx(&abs_path);
                inode.remove();
                return create_file(cwd, path, flags, &abs_path, parent_path, child_name);
            }
            insert_vfile_idx(&abs_path, inode.clone());
            let (readable, writable) = flags.read_write();
            let mut vfile = OSInode::new(readable, writable, inode);
            if flags.contains(OpenFlags::O_APPEND) {
                vfile.set_offset(vfile.file_size());
            }
            vfile.set_openflags(flags);
            return Some(Arc::new(vfile));
        }
    } else {
        let cur_vfile = {
            if cwd == "/" {
                ROOT_INODE.clone()
            } else {
                ROOT_INODE.find_vfile_path(&path2vec(cwd)).unwrap()
            }
        };
        if let Some(inode) = cur_vfile.find_vfile_path(&path2vec(path)) {
            if flags.contains(OpenFlags::O_TRUNC) {
                remove_vfile_idx(&abs_path);
                inode.remove();
                return create_file(cwd, path, flags, &abs_path, parent_path, child_name);
            }
            insert_vfile_idx(&abs_path, inode.clone());
            let (readable, writable) = flags.read_write();
            let mut vfile = OSInode::new(readable, writable, inode);
            if flags.contains(OpenFlags::O_APPEND) {
                vfile.set_offset(vfile.file_size());
            }
            vfile.set_openflags(flags);
            return Some(Arc::new(vfile));
        }
    }

    // 节点不存在
    if flags.contains(OpenFlags::O_CREATE) {
        return create_file(cwd, path, flags, &abs_path, parent_path, child_name);
    }
    None
}

// 为 OSInode 实现 File Trait
impl File for OSInode {
    fn readable(&self) -> bool {
        self.readable
    }

    fn writable(&self) -> bool {
        self.writable
    }

    fn read(&self, mut buf: UserBuffer) -> usize {
        let mut inner = self.inner.lock();
        let mut total_read_size = 0usize;
        // 这边要使用 iter_mut()，因为要将数据写入
        for slice in buf.buffers.iter_mut() {
            let read_size = self.inode.read_at(inner.offset, *slice);
            if read_size == 0 {
                break;
            }
            inner.offset += read_size;
            total_read_size += read_size;
        }
        total_read_size
    }

    fn write(&self, buf: UserBuffer) -> usize {
        let mut inner = self.inner.lock();
        let mut total_write_size = 0usize;
        for slice in buf.buffers.iter() {
            let write_size = self.inode.write_at(inner.offset, *slice);
            assert_eq!(write_size, slice.len());
            inner.offset += write_size;
            total_write_size += write_size;
        }
        total_write_size
    }
}

bitflags! {
    pub struct Mode: u32 {
        /// Set-user-ID on execution.
        const SET_UID = 0o4000;
        /// Set-group-ID on execution.
        const SET_GID = 0o2000;
        /// sticky bit
        const STICKY = 0o1000;

        /// Read, write, execute/search by owner.
        const OWNER_MASK = 0o700;
        /// Read permission, owner.
        const OWNER_READ = 0o400;
        /// Write permission, owner.
        const OWNER_WRITE = 0o200;
        /// Execute/search permission, owner.
        const OWNER_EXEC = 0o100;

        /// Read, write, execute/search by group.
        const GROUP_MASK = 0o70;
        /// Read permission, group.
        const GROUP_READ = 0o40;
        /// Write permission, group.
        const GROUP_WRITE = 0o20;
        /// Execute/search permission, group.
        const GROUP_EXEC = 0o10;

        /// Read, write, execute/search by others.
        const OTHER_MASK = 0o7;
        /// Read permission, others.
        const OTHER_READ = 0o4;
        /// Write permission, others.
        const OTHER_WRITE = 0o2;
        /// Execute/search permission, others.
        const OTHER_EXEC = 0o1;
    }
}
