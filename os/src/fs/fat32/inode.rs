use super::{find_vfile_idx, insert_vfile_idx, remove_vfile_idx};

use crate::{
    drivers::BLOCK_DEVICE,
    fs::{
        find_device, open_device_file, register_device, vfs::Inode, Dirent, File, FileClass,
        InodeType, Kstat, OSFile, OSInode, OpenFlags, SEEK_SET,
    },
    mm::UserBuffer,
    utils::{trim_first_point_slash, GeneralRet, SysErrNo},
};
use _core::str::FromStr;
use alloc::{string::String, sync::Arc, vec::Vec};
use bitflags::*;
use fat32_fs::{
    create_root_vfile, FAT32Manager, VFile, ATTR_ARCHIVE, ATTR_DIRECTORY, ATTR_SYMLINK,
};
use lazy_static::*;
use log::{debug, info};
use spin::{Mutex, MutexGuard};

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
            dirent.init(name.as_str(), off as isize, ino as usize, dtype);
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
    fn find(&self, name: &str) -> Option<Arc<dyn Inode>> {
        let pathv = path2vec(name);
        if let Some(node) = self.find_vfile_path(&pathv) {
            Some(node)
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
        todo!()
    }
    fn sync(&self) {
        self.sync();
    }
}

// pub struct OSInode {
//     readable: bool, // 该文件是否允许通过 sys_read 进行读
//     writable: bool, // 该文件是否允许通过 sys_write 进行写
//     inode: Arc<VFile>,
//     inner: Mutex<OSInodeInner>,
// }
// pub struct OSInodeInner {
//     offset: usize, // 偏移量
// }

// impl OSInode {
//     pub fn new(readable: bool, writable: bool, inode: Arc<VFile>) -> Self {
//         Self {
//             readable,
//             writable,
//             inode,
//             inner: Mutex::new(OSInodeInner { offset: 0 }),
//         }
//     }
//     #[deprecated]
//     /// 只有读取elf_data时用到了read_all,但是随后又转为了&[u8],拷贝开销过大
//     /// 使用read_as_elf
//     pub fn read_all(&self) -> Vec<u8> {
//         let mut inner = self.inner.lock();
//         let mut buffer = [0u8; 512];
//         let mut v: Vec<u8> = Vec::new();
//         loop {
//             let len = self.inode.read_at(inner.offset, &mut buffer);
//             if len == 0 {
//                 break;
//             }
//             inner.offset += len;
//             v.extend_from_slice(&buffer[..len]);
//         }
//         v
//     }
//     /// 将文件指针转换为切片,避免拷贝
//     /// 读取完整的文件也可以用
//     pub unsafe fn read_as_elf(&self) -> &[u8] {
//         self.inode.read_as_elf()
//     }

//     pub fn is_dir(&self) -> bool {
//         self.inode.is_dir()
//     }

//     pub fn name(&self) -> String {
//         self.inode.get_name()
//     }

//     pub fn delete(&self) {
//         self.inode.delete()
//     }

//     pub fn remove(&self) -> usize {
//         self.inode.remove()
//     }

//     pub fn file_size(&self) -> usize {
//         self.inode.get_size() as usize
//     }

//     pub fn set_file_size(&self, size: u32) {
//         self.inode.set_size(size);
//     }
//     pub fn find(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
//         let pathv = path2vec(path);
//         let (readable, writable) = flags.read_write();
//         self.inode
//             .find_vfile_path(&pathv)
//             .map(|vfile| FileClass::File(Arc::new(OSInode::new(readable, writable, vfile))))
//     }

//     pub fn fstat(&self, kstat: &mut Kstat) {
//         let inner = self.inner.lock();
//         let (st_ino, st_size, st_atime, st_mtime, st_ctime, st_blocks, st_mode) = self.inode.stat();
//         kstat.init(
//             st_ino as u64,
//             st_size as u64,
//             st_atime,
//             st_mtime,
//             st_ctime,
//             st_blocks,
//             st_mode,
//         );
//     }

//     pub fn dirent(&self, dirent: &mut Dirent) -> isize {
//         if !self.is_dir() {
//             return -1;
//         }
//         let mut inner = self.inner.lock();
//         let offset = inner.offset as u32;
//         if let Some((name, off, ino, dtype)) = self.inode.dirent_info(offset as usize) {
//             dirent.init(name.as_str(), off as isize, ino as usize, dtype);
//             inner.offset = off as usize;
//             let len = dirent.len() as isize;
//             len
//         } else {
//             -1
//         }
//     }

//     pub fn set_offset(&self, offset: usize) {
//         let mut inner = self.inner.lock();
//         inner.offset = offset;
//     }

//     pub fn offset(&self) -> usize {
//         self.inner.lock().offset
//     }
//     pub fn set_accessed_time(&self, atime: u64) {
//         self.inode.set_accessed_time(atime);
//     }
//     pub fn set_modification_time(&self, mtime: u64) {
//         self.inode.set_modification_time(mtime);
//     }
//     pub fn accessed_time(&self) -> u64 {
//         self.inode.accessed_time()
//     }
//     pub fn modification_time(&self) -> u64 {
//         self.inode.modification_time()
//     }

//     pub fn sync(&self) {
//         self.inode.sync();
//     }

//     pub fn setsym(&self) {
//         self.inode.setsym();
//     }
//     pub fn sym(&self) -> bool {
//         self.inode.sym()
//     }

//     pub fn first_cluster(&self) -> u32 {
//         self.inode.first_cluster()
//     }
//     pub fn set_first_cluster(&self, first_cluster: u32) {
//         self.inode.set_first_cluster(first_cluster);
//     }

//     pub fn create(&self, path: &str, flags: OpenFlags) -> Option<FileClass> {
//         let path = if path.starts_with("./") {
//             &path[2..]
//         } else {
//             path
//         };
//         let (readable, writable) = flags.read_write();
//         let attribute = {
//             if flags.contains(OpenFlags::O_DIRECTORY) {
//                 ATTR_DIRECTORY
//             } else {
//                 ATTR_ARCHIVE
//             }
//         };
//         self.inode
//             .create(path, attribute)
//             .map(|vfile| FileClass::File(Arc::new(OSInode::new(readable, writable, vfile))))
//     }
// }

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

const MOUNTS: &str = " fat32 / fat rw 0 0\n";
const MEMINFO: &str = r"
MemTotal:         944564 kB
MemFree:          835248 kB
MemAvailable:     873464 kB
Buffers:            6848 kB
Cached:            36684 kB
SwapCached:            0 kB
Active:            19032 kB
Inactive:          32676 kB
Active(anon):        128 kB
Inactive(anon):     8260 kB
Active(file):      18904 kB
Inactive(file):    24416 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:          8172 kB
Mapped:            16376 kB
Shmem:               216 kB
KReclaimable:       9960 kB
Slab:              17868 kB
SReclaimable:       9960 kB
SUnreclaim:         7908 kB
KernelStack:        1072 kB
PageTables:          600 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      472280 kB
Committed_AS:      64684 kB
VmallocTotal:   67108863 kB
VmallocUsed:       15740 kB
VmallocChunk:          0 kB
Percpu:              496 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
";
const ADJTIME: &str = "0.000000 0.000000 UTC\n";
const LOCALTIME: &str =
    "lrwxrwxrwx 1 root root 33 11月 18  2023 /etc/localtime -> /usr/share/zoneinfo/Asia/Shanghai\n";

pub fn create_init_files() -> GeneralRet {
    //创建./proc文件夹
    open(
        "/",
        "./proc",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY,
    );
    //创建./proc/mounts文件系统使用情况
    if let Some(FileClass::File(mountsfile)) = open(
        "./proc",
        "./mounts",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
    ) {
        let mut mountsinfo = String::from(MOUNTS);
        let mut mountsvec = Vec::new();
        unsafe {
            let mut mounts = mountsinfo.as_bytes_mut();
            mountsvec.push(core::slice::from_raw_parts_mut(
                mounts.as_mut_ptr(),
                mounts.len(),
            ));
        }
        let mountbuf = UserBuffer::new(mountsvec);
        let mountssize = mountsfile.write(mountbuf)?;
        debug!("create /proc/mounts with {} sizes", mountssize);
    }
    //创建./proc/meminfo系统内存使用情况
    if let Some(FileClass::File(memfile)) = open(
        "./proc",
        "./meminfo",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
    ) {
        let mut meminfo = String::from(MEMINFO);
        let mut memvec = Vec::new();
        unsafe {
            let mut mem = meminfo.as_bytes_mut();
            memvec.push(core::slice::from_raw_parts_mut(mem.as_mut_ptr(), mem.len()));
        }
        let membuf = UserBuffer::new(memvec);
        let memsize = memfile.write(membuf)?;
        // debug!("create /proc/meminfo with {} sizes", memsize);
    }
    //创建./dev文件夹
    open(
        "/",
        "./dev",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY,
    );
    //注册设备/dev/rtc和/dev/rtc0
    register_device("/dev/rtc");
    register_device("/dev/rtc0");
    //注册设备/dev/tty
    register_device("/dev/tty");
    //注册设备/dev/zero
    register_device("/dev/zero");
    //注册设备/dev/numm
    register_device("/dev/null");
    //创建./dev/misc文件夹
    open(
        "./dev",
        "./misc",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY,
    );
    //注册设备/dev/misc/rtc
    register_device("/dev/misc/rtc");
    //创建./etc文件夹
    open(
        "/",
        "./etc",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY,
    );
    //创建./etc/adjtime记录时间偏差
    if let Some(FileClass::File(adjtimefile)) = open(
        "./etc",
        "./adjtime",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
    ) {
        let mut adjtime = String::from(ADJTIME);
        let mut adjtimevec = Vec::new();
        unsafe {
            let mut adj = adjtime.as_bytes_mut();
            adjtimevec.push(core::slice::from_raw_parts_mut(adj.as_mut_ptr(), adj.len()));
        }
        let adjtimebuf = UserBuffer::new(adjtimevec);
        let adjtimesize = adjtimefile.write(adjtimebuf)?;
        debug!("create /etc/adjtime with {} sizes", adjtimesize);
    }
    //创建./etc/localtime记录时区
    if let Some(FileClass::File(localtimefile)) = open(
        "./etc",
        "./localtime",
        OpenFlags::O_CREATE | OpenFlags::O_RDWR,
    ) {
        let mut localtime = String::from(LOCALTIME);
        let mut localtimevec = Vec::new();
        unsafe {
            let mut local = localtime.as_bytes_mut();
            localtimevec.push(core::slice::from_raw_parts_mut(
                local.as_mut_ptr(),
                local.len(),
            ));
        }
        let localtimebuf = UserBuffer::new(localtimevec);
        let localtimesize = localtimefile.write(localtimebuf)?;
        debug!("create /etc/localtime with {} sizes", localtimesize);
    };
    Ok(())
    // println!("create_init_files success!");
}

pub fn open_file(path: &str, flags: OpenFlags) -> Option<FileClass> {
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
) -> Option<FileClass> {
    if let Some(parent_dir) = find_vfile_idx(parent_path) {
        let attribute = {
            if flags.contains(OpenFlags::O_DIRECTORY) {
                ATTR_DIRECTORY
            } else {
                ATTR_ARCHIVE
            }
        };
        let (readable, writable) = flags.read_write();
        return parent_dir.create(child_name, attribute).map(|vfile| {
            insert_vfile_idx(abs_path, vfile.clone());
            let osinode = OSInode::new(readable, writable, vfile);
            FileClass::File(Arc::new(osinode))
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
            if flags.contains(OpenFlags::O_DIRECTORY) {
                ATTR_DIRECTORY
            } else {
                ATTR_ARCHIVE
            }
        };
        let (readable, writable) = flags.read_write();
        parent_dir.create(child_name, attribute).map(|vfile| {
            insert_vfile_idx(abs_path, vfile.clone());
            let osinode = OSInode::new(readable, writable, vfile);
            FileClass::File(Arc::new(osinode))
        })
    } else {
        None
    }
}

pub fn open(cwd: &str, path: &str, flags: OpenFlags) -> Option<FileClass> {
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
    //判断是否是设备文件
    if find_device(&abs_path[..]) {
        if let Some(device) = open_device_file(&abs_path[..]) {
            return Some(FileClass::Abs(device));
        } else {
            return None;
        }
    }
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
            // vfile.set_offset(vfile.file_size());
            vfile.lseek(vfile.inode.size() as isize, SEEK_SET);
        }
        return Some(FileClass::File(Arc::new(vfile)));
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
                // vfile.set_offset(vfile.file_size());
                vfile.lseek(vfile.inode.size() as isize, SEEK_SET);
            }
            return Some(FileClass::File(Arc::new(vfile)));
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
                // vfile.set_offset(vfile.file_size());
                vfile.lseek(vfile.inode.size() as isize, SEEK_SET);
            }
            return Some(FileClass::File(Arc::new(vfile)));
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

    fn read(&self, mut buf: UserBuffer) -> Result<usize, SysErrNo> {
        let mut inner = self.inner.lock();
        let mut total_read_size = 0usize;
        // 这边要使用 iter_mut()，因为要将数据写入
        for slice in buf.buffers.iter_mut() {
            let read_size = self.inode.read_at(inner.offset, *slice)?;
            if read_size == 0 {
                break;
            }
            inner.offset += read_size;
            total_read_size += read_size;
        }
        Ok(total_read_size)
    }

    fn write(&self, buf: UserBuffer) -> Result<usize, SysErrNo> {
        let mut inner = self.inner.lock();
        let mut total_write_size = 0usize;
        for slice in buf.buffers.iter() {
            let write_size = self.inode.write_at(inner.offset, *slice)?;
            assert_eq!(write_size, slice.len());
            inner.offset += write_size;
            total_write_size += write_size;
        }
        Ok(total_write_size)
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
