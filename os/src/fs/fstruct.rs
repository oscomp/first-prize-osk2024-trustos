use crate::sync::SyncUnsafeCell;
// use core::alloc::vec::Vec;
use alloc::{string::String, sync::Arc, vec, vec::Vec};

use super::{FileClass, OpenFlags, Stdin, Stdout};
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
            vec![
                Some(OpenFlags::O_RDONLY),
                Some(OpenFlags::O_WRONLY),
                Some(OpenFlags::O_WRONLY),
            ],
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
        let fd_table = &mut self.get_mut().table;
        let flags = &mut self.get_mut().flags;
        if let Some(fd) = (0..fd_table.len()).find(|fd| fd_table[*fd].is_none()) {
            fd
        } else {
            fd_table.push(None);
            flags.push(None);
            fd_table.len() - 1
        }
    }
    pub fn alloc_fd_larger_than(&self, arg: usize) -> usize {
        let fd_table = &mut self.get_mut().table;
        let flags = &mut self.get_mut().flags;
        if fd_table.len() < arg {
            fd_table.resize(arg, None);
            flags.resize(arg, None);
        }
        if let Some(fd) = (arg..fd_table.len()).find(|fd| fd_table[*fd].is_none()) {
            fd
        } else {
            fd_table.push(None);
            flags.push(None);
            fd_table.len() - 1
        }
    }
    pub fn close_on_exec(&self) {
        let inner = self.get_mut();
        for idx in 0..inner.flags.len() {
            if let Some(flag) = inner.flags[idx] {
                if flag.contains(OpenFlags::O_CLOEXEC) {
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

    pub fn try_get_file(&self, fd: usize) -> Option<FileClass> {
        self.get_mut().table[fd].clone()
    }

    pub fn try_get_flag(&self, fd: usize) -> Option<OpenFlags> {
        self.get_mut().flags[fd].clone()
    }

    pub fn try_get(&self, fd: usize) -> (Option<FileClass>, Option<OpenFlags>) {
        (self.try_get_file(fd), self.try_get_flag(fd))
    }

    pub fn get_file(&self, fd: usize) -> FileClass {
        self.get_mut().table[fd].clone().unwrap()
    }

    pub fn get_flag(&self, fd: usize) -> OpenFlags {
        self.get_mut().flags[fd].clone().unwrap()
    }

    pub fn set_cloexec(&self, fd: usize) {
        let flags = self.try_get_flag(fd).unwrap() | OpenFlags::O_CLOEXEC;
        self.get_mut().flags[fd] = Some(flags);
    }

    pub fn unset_cloexec(&self, fd: usize) {
        let flags = self.try_get_flag(fd).unwrap() & !OpenFlags::O_CLOEXEC;
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
            inner: SyncUnsafeCell::new(another.get_mut().clone()),
        }
    }
    pub fn get_cwd(&self) -> String {
        self.get_mut().cwd.clone()
    }
    pub fn cwd(&self) -> &str {
        self.get_ref().cwd.as_str()
    }
    pub fn as_bytes(&self) -> &[u8] {
        self.get_ref().cwd.as_bytes()
    }
    pub fn set_cwd(&self, cwd: String) {
        self.get_mut().cwd = cwd;
    }
    fn get_mut(&self) -> &mut FsInfoInner {
        self.inner.get_unchecked_mut()
    }
    fn get_ref(&self) -> &FsInfoInner {
        self.inner.get_unchecked_ref()
    }
}
