mod devfs;
mod dirent;
mod ext4;
mod fat32;
mod mount;
mod pipe;
mod stat;
mod stdio;
mod vfs;

cfg_if::cfg_if! {
    if #[cfg(feature="fat32")]{
        pub use fat32::{
            create_init_files, is_abs_path, list_apps, open, open_file, path2vec, Mode, OSInode, OpenFlags,
            ROOT_INODE,remove_vfile_idx
        };
        pub use fat32_fs::{sync_all,BlockDevice};
    }
}

use crate::{mm::UserBuffer, sync::SyncUnsafeCell, utils::SyscallRet};
use alloc::string::String;
use alloc::{sync::Arc, vec, vec::Vec};
use core::cell::RefMut;
pub use devfs::*;
pub use dirent::Dirent;

pub use mount::MNT_TABLE;
pub use pipe::{make_pipe, Pipe};
use spin::{Mutex, MutexGuard};
pub use stat::{Kstat, Statfs};
pub use stdio::{Stdin, Stdout};
pub use vfs::{File, Ioctl};

pub struct FdTable {
    inner: SyncUnsafeCell<FdTableInner>,
}

pub struct FdTableInner {
    flags: Vec<Option<OpenFlags>>,
    table: Vec<Option<FileClass>>,
}

impl FdTableInner {
    pub fn empty() -> Self {
        Self {
            flags: Vec::new(),
            table: Vec::new(),
        }
    }
    pub fn new(flags: Vec<Option<OpenFlags>>, table: Vec<Option<FileClass>>) -> Self {
        FdTableInner { flags, table }
    }
}

impl FdTable {
    pub fn new(fd_table: FdTableInner) -> Self {
        Self {
            inner: SyncUnsafeCell::new(fd_table),
        }
    }
    pub fn new_with_stdio() -> Self {
        FdTable::new(FdTableInner::new(
            vec![None, None, None],
            vec![
                // 0 -> stdin
                Some(FileClass::Abs(Arc::new(Stdin))),
                // 1 -> stdout
                Some(FileClass::Abs(Arc::new(Stdout))),
                // 2 -> stderr
                Some(FileClass::Abs(Arc::new(Stdout))),
            ],
        ))
    }
    pub fn from_another(another: &Arc<FdTable>) -> Self {
        let mut fd_table: Vec<_> = Vec::new();
        let other = another.get_ref();
        for fd in other.table.iter() {
            if let Some(file) = fd {
                fd_table.push(Some(file.clone()));
            } else {
                fd_table.push(None);
            }
        }
        let mut flags: Vec<Option<OpenFlags>> = Vec::new();
        flags.extend(&other.flags);
        Self {
            inner: SyncUnsafeCell::new(FdTableInner::new(flags, fd_table)),
        }
    }
    pub fn alloc_fd(&self) -> usize {
        let mut fd_table = &mut self.get_mut().table;
        let mut flags = &mut self.get_mut().flags;
        if let Some(fd) = (0..fd_table.len()).find(|fd| fd_table[*fd].is_none()) {
            fd
        } else {
            fd_table.push(None);
            flags.push(None);
            fd_table.len() - 1
        }
    }
    pub fn close_on_exec(&self) {
        let mut inner = self.get_mut();
        for idx in 0..inner.flags.len() {
            if let Some(flag) = inner.flags[idx] {
                if (flag.contains(OpenFlags::O_CLOEXEC)) {
                    inner.flags[idx].take();
                    inner.table[idx].take();
                }
            }
        }
    }
    pub fn len(&self) -> usize {
        self.get_ref().table.len()
    }

    pub fn resize(&self, size: usize) {
        self.get_mut().table.resize(size, None);
        self.get_mut().flags.resize(size, None);
    }

    pub fn get_file(&self, fd: usize) -> Option<FileClass> {
        self.get_mut().table[fd].clone()
    }

    pub fn get_flag(&self, fd: usize) -> Option<OpenFlags> {
        self.get_mut().flags[fd].clone()
    }

    pub fn get(&self, fd: usize) -> (Option<FileClass>, Option<OpenFlags>) {
        (self.get_file(fd), self.get_flag(fd))
    }

    pub fn set_cloexec(&self, fd: usize) {
        let flags = self.get_flag(fd).unwrap() | OpenFlags::O_CLOEXEC;
        self.get_mut().flags[fd] = Some(flags);
    }

    pub fn unset_cloexec(&self, fd: usize) {
        let flags = self.get_flag(fd).unwrap() & !OpenFlags::O_CLOEXEC;
        self.get_mut().flags[fd] = Some(flags);
    }

    pub fn contain_cloexec(&self, fd: usize) -> bool {
        self.get_mut().flags[fd]
            .as_ref()
            .unwrap()
            .contains(OpenFlags::O_CLOEXEC)
    }

    pub fn set(&self, fd: usize, value: Option<FileClass>, flags: Option<OpenFlags>) {
        self.get_mut().table[fd] = value;
        self.get_mut().flags[fd] = flags;
    }

    pub fn set_flags(&self, fd: usize, flags: Option<OpenFlags>) {
        self.get_mut().flags[fd] = flags;
    }

    pub fn take(&self, fd: usize) -> Option<FileClass> {
        self.get_mut().flags[fd].take();
        self.get_mut().table[fd].take()
    }

    fn get_mut(&self) -> &mut FdTableInner {
        self.inner.get_unchecked_mut()
    }

    fn get_ref(&self) -> &FdTableInner {
        self.inner.get_unchecked_ref()
    }
}

#[derive(Clone)]
pub struct FsInfoInner {
    pub cwd: String,
}

pub struct FsInfo {
    inner: SyncUnsafeCell<FsInfoInner>,
}

impl FsInfo {
    pub fn new(cwd: String) -> Self {
        Self {
            inner: SyncUnsafeCell::new(FsInfoInner { cwd }),
        }
    }
    pub fn from_another(another: &Arc<FsInfo>) -> Self {
        Self {
            inner: SyncUnsafeCell::new(another.inner.get_unchecked_mut().clone()),
        }
    }
    pub fn get_cwd(&self) -> String {
        self.inner.get_unchecked_mut().cwd.clone()
    }
    pub fn cwd(&self) -> &str {
        self.inner.get_unchecked_ref().cwd.as_str()
    }
    pub fn as_bytes(&self) -> &[u8] {
        self.inner.get_unchecked_ref().cwd.as_bytes()
    }
    pub fn set_cwd(&self, cwd: String) {
        self.inner.get_unchecked_mut().cwd = cwd;
    }
    pub fn get_mut(&self) -> &mut FsInfoInner {
        self.inner.get_unchecked_mut()
    }
    pub fn get_ref(&self) -> &FsInfoInner {
        self.inner.get_unchecked_ref()
    }
}

/// 枚举类型，分为普通文件和抽象文件
/// 普通文件File，特点是支持更多类型的操作，包含seek, offset等
/// 抽象文件Abs，抽象文件，只支持File trait的一些操作
#[derive(Clone)]
pub enum FileClass {
    File(Arc<OSInode>),
    Abs(Arc<dyn File>),
}

core::arch::global_asm!(include_str!("preload.S"));

// os\src\fs\mod.rs
//将预加载到内存中的程序写入文件根目录
pub fn flush_preload() {
    extern "C" {
        fn initproc_start();
        fn initproc_end();
        fn shell_start();
        fn shell_end();
    }

    if let Some(FileClass::File(initproc)) = open_file("initproc", OpenFlags::O_CREATE) {
        let mut v = Vec::new();
        v.push(unsafe {
            core::slice::from_raw_parts_mut(
                initproc_start as *mut u8,
                initproc_end as usize - initproc_start as usize,
            ) as &'static mut [u8]
        });
        initproc.write(UserBuffer::new(v));
    }

    if let Some(FileClass::File(onlinetests)) = open_file("onlinetests", OpenFlags::O_CREATE) {
        let mut v = Vec::new();
        v.push(unsafe {
            core::slice::from_raw_parts_mut(
                shell_start as *mut u8,
                shell_end as usize - shell_start as usize,
            ) as &'static mut [u8]
        });
        onlinetests.write(UserBuffer::new(v));
    }
}

pub fn path2abs<'a>(cwdv: &mut Vec<&'a str>, pathv: &Vec<&'a str>) -> String {
    for &path_element in pathv.iter() {
        if path_element == "." {
            continue;
        } else if path_element == ".." {
            cwdv.pop();
        } else {
            cwdv.push(path_element);
        }
    }
    let mut abs_path = String::from("/");
    abs_path.push_str(&cwdv.join("/"));
    abs_path
}
