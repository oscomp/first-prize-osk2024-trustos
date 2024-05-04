#[cfg(feature = "fat32_fs")]
use super::{find_vfile_idx, insert_vfile_idx, remove_vfile_idx};
///hhh
use super::{Dirent, File, Kstat};
use crate::{drivers::BLOCK_DEVICE, mm::UserBuffer};
use _core::str::FromStr;
use alloc::{string::String, sync::Arc, vec::Vec};
use bitflags::*;
#[cfg(feature = "fat32_fs")]
use fat32_fs::{create_root_vfile, FAT32Manager, VFile, ATTR_ARCHIVE, ATTR_DIRECTORY};
use lazy_static::*;
use log::info;
#[cfg(feature = "simple_fs")]
use simple_fat32::{create_root_vfile, FAT32Manager, VFile, ATTR_ARCHIVE, ATTR_DIRECTORY};
use spin::Mutex;

#[cfg(feature = "simple_fs")]
/// 表示进程中一个被打开的常规文件或目录
pub struct OSInode {
    readable: bool, // 该文件是否允许通过 sys_read 进行读
    writable: bool, // 该文件是否允许通过 sys_write 进行写
    inner: Mutex<OSInodeInner>,
}
#[cfg(feature = "simple_fs")]
pub struct OSInodeInner {
    offset: usize, // 偏移量
    inode: Arc<VFile>,
}
#[cfg(feature = "simple_fs")]
impl OSInode {
    pub fn new(readable: bool, writable: bool, inode: Arc<VFile>) -> Self {
        Self {
            readable,
            writable,
            inner: Mutex::new(OSInodeInner { offset: 0, inode }),
        }
    }
    pub fn read_all(&self) -> Vec<u8> {
        let mut inner = self.inner.lock();
        let mut buffer = [0u8; 512];
        let mut v: Vec<u8> = Vec::new();
        loop {
            let len = inner.inode.read_at(inner.offset, &mut buffer);
            if len == 0 {
                break;
            }
            inner.offset += len;
            v.extend_from_slice(&buffer[..len]);
        }
        v
    }

    pub fn is_dir(&self) -> bool {
        let inner = self.inner.lock();
        inner.inode.is_dir()
    }

    pub fn name(&self) -> String {
        let mut name = String::new();
        name.push_str(self.inner.lock().inode.name());
        name
    }

    pub fn delete(&self) -> usize {
        let inner = self.inner.lock();
        inner.inode.remove()
    }

    pub fn fstat(&self, kstat: &mut Kstat) {
        let inner = self.inner.lock();
        let vfile = inner.inode.clone();
        // todo
        let (st_size, st_blksize, st_blocks) = vfile.stat();
        kstat.init(st_size, st_blksize, st_blocks);
    }

    pub fn dirent(&self, dirent: &mut Dirent) -> isize {
        if !self.is_dir() {
            return -1;
        }
        let mut inner = self.inner.lock();
        let offset = inner.offset as u32;
        if let Some((name, off, _)) = inner.inode.dirent_info(offset as usize) {
            dirent.init(name.as_str());
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
}

#[cfg(feature = "simple_fs")]
// 这里在实例化的时候进行文件系统的打开
lazy_static! {
    pub static ref ROOT_INODE: Arc<VFile> = {
        let fat32_manager = FAT32Manager::open(BLOCK_DEVICE.clone());
        Arc::new(create_root_vfile(&fat32_manager)) // 返回根目录
    };
}

#[cfg(feature = "fat32_fs")]
pub struct OSInode {
    readable: bool, // 该文件是否允许通过 sys_read 进行读
    writable: bool, // 该文件是否允许通过 sys_write 进行写
    inode: Arc<VFile>,
    inner: Mutex<OSInodeInner>,
}
#[cfg(feature = "fat32_fs")]
pub struct OSInodeInner {
    offset: usize, // 偏移量
}
#[cfg(feature = "fat32_fs")]
impl OSInode {
    pub fn new(readable: bool, writable: bool, inode: Arc<VFile>) -> Self {
        Self {
            readable,
            writable,
            inode,
            inner: Mutex::new(OSInodeInner { offset: 0 }),
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
        let (st_size, _, _, _, _) = self.inode.stat();
        kstat.init(st_size);
    }

    pub fn dirent(&self, dirent: &mut Dirent) -> isize {
        if !self.is_dir() {
            return -1;
        }
        let mut inner = self.inner.lock();
        let offset = inner.offset as u32;
        if let Some((name, off, _, _)) = self.inode.dirent_info(offset as usize) {
            dirent.init(name.as_str());
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
}

#[cfg(feature = "fat32_fs")]
lazy_static! {
    pub static ref ROOT_INODE: Arc<VFile> = {
        let fat32_manager = FAT32Manager::open(BLOCK_DEVICE.clone());
        Arc::new(create_root_vfile(&fat32_manager)) // 返回根目录
    };
}

#[cfg(feature = "simple_fs")]
pub fn list_all(head: String, node: Arc<VFile>) {
    let head = head + &"/";
    for app in node.ls().unwrap() {
        if (app.0 == "." || app.0 == "..") {
            //跳过这俩
            continue;
        } else if app.1 & ATTR_DIRECTORY == 0 {
            // 如果不是目录
            println!("{}{}", head, app.0);
        } else {
            // 如果是目录
            let mut v = open_file(&app.0, OpenFlags::O_RDONLY)
                .unwrap()
                .inner
                .lock()
                .inode
                .clone();
            list_all(head.clone() + &app.0, v.clone());
        }
    }
}

#[cfg(feature = "simple_fs")]
pub fn list_apps() {
    println!("/**** APPS ****");
    list_all("".into(), ROOT_INODE.clone());
    println!("**************/");
}

#[cfg(feature = "fat32_fs")]
pub fn list_apps() {
    println!("/**** APPS ****");
    for (app, _) in ROOT_INODE.ls().unwrap() {
        println!("{}", app);
    }
    println!("**************/");
}

// 定义一份打开文件的标志
bitflags! {
    pub struct OpenFlags: u32 {
        const O_RDONLY = 0;
        const O_WRONLY = 1 << 0;
        const O_RDWR = 1 << 1;
        const O_CREATE = 1 << 6;
        const O_TRUNC = 1 << 9;
        const O_APPEND = 1 << 10;
        const O_DIRECTROY = 1 << 21;
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
#[cfg(feature = "simple_fs")]
pub fn open(work_path: &str, path: &str, flags: OpenFlags) -> Option<Arc<OSInode>> {
    let cur_inode = {
        if work_path == "/" {
            ROOT_INODE.clone()
        } else {
            let wpath: Vec<&str> = work_path.split('/').collect();
            ROOT_INODE.find_vfile_bypath(wpath).unwrap()
        }
    };
    let mut pathv: Vec<&str> = path.split('/').collect();
    let (readable, writable) = flags.read_write();

    if flags.contains(OpenFlags::O_CREATE) || flags.contains(OpenFlags::O_DIRECTROY) {
        if let Some(inode) = cur_inode.find_vfile_bypath(pathv.clone()) {
            // 如果文件已存在则清空
            inode.clear();
            Some(Arc::new(OSInode::new(readable, writable, inode)))
        } else {
            // 设置创建类型
            let mut create_type = 0;
            if flags.contains(OpenFlags::O_CREATE) {
                create_type = ATTR_ARCHIVE;
            } else if flags.contains(OpenFlags::O_DIRECTROY) {
                create_type = ATTR_DIRECTORY;
            }
            let name = pathv.pop().unwrap();
            if let Some(temp_inode) = cur_inode.find_vfile_bypath(pathv.clone()) {
                temp_inode
                    .create(name, create_type)
                    .map(|inode| Arc::new(OSInode::new(readable, writable, inode)))
            } else {
                None
            }
        }
    } else {
        cur_inode.find_vfile_bypath(pathv).map(|inode| {
            if flags.contains(OpenFlags::O_TRUNC) {
                inode.clear();
            }
            Arc::new(OSInode::new(readable, writable, inode))
        })
    }
}

#[cfg(feature = "fat32_fs")]
#[inline(always)]
pub fn path2vec(path: &str) -> Vec<&str> {
    path.split('/').filter(|s| !s.is_empty()).collect()
}

#[cfg(feature = "fat32_fs")]
#[inline(always)]
pub fn is_abs_path(path: &str) -> bool {
    unsafe { *path.as_ptr() == '/' as u8 }
}

#[cfg(feature = "fat32_fs")]
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
            Arc::new(OSInode::new(readable, writable, vfile))
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
            Arc::new(OSInode::new(readable, writable, vfile))
        })
    } else {
        None
    }
}

#[cfg(feature = "fat32_fs")]
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
        let vfile = OSInode::new(readable, writable, inode);
        if flags.contains(OpenFlags::O_APPEND) {
            vfile.set_offset(vfile.file_size());
        }
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
            let vfile = OSInode::new(readable, writable, inode);
            if flags.contains(OpenFlags::O_APPEND) {
                vfile.set_offset(vfile.file_size());
            }
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
            let vfile = OSInode::new(readable, writable, inode);
            if flags.contains(OpenFlags::O_APPEND) {
                vfile.set_offset(vfile.file_size());
            }
            return Some(Arc::new(vfile));
        }
    }

    // 节点不存在
    if flags.contains(OpenFlags::O_CREATE) {
        return create_file(cwd, path, flags, &abs_path, parent_path, child_name);
    }
    None
}

#[cfg(feature = "simple_fs")]
pub fn chdir(work_path: &str, path: &str) -> Option<String> {
    let current_inode = {
        if path.chars().nth(0).unwrap() == '/' {
            // 传入路径是绝对路径
            ROOT_INODE.clone()
        } else {
            // 传入路径是相对路径
            let current_work_pathv: Vec<&str> = work_path.split('/').collect();
            ROOT_INODE.find_vfile_bypath(current_work_pathv).unwrap()
        }
    };
    let pathv: Vec<&str> = path.split('/').collect();
    if let Some(_) = current_inode.find_vfile_bypath(pathv) {
        let new_current_path = String::from_str("/").unwrap() + &String::from_str(path).unwrap();
        if current_inode.name() == "/" {
            Some(new_current_path)
        } else {
            Some(String::from_str(current_inode.name()).unwrap() + &new_current_path)
        }
    } else {
        None
    }
}

#[cfg(feature = "simple_fs")]
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
            let read_size = inner.inode.read_at(inner.offset, *slice);
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
            let write_size = inner.inode.write_at(inner.offset, *slice);
            assert_eq!(write_size, slice.len());
            inner.offset += write_size;
            total_write_size += write_size;
        }
        total_write_size
    }
}

#[cfg(feature = "fat32_fs")]
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
