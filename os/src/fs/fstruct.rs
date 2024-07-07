use crate::{
    sync::SyncUnsafeCell,
    utils::{GeneralRet, SysErrNo, SyscallRet},
};
use alloc::{
    string::{String, ToString},
    sync::Arc,
    vec,
    vec::Vec,
};
use hashbrown::HashMap;

use super::{FileClass, OpenFlags, Stdin, Stdout};
pub struct FdTable {
    inner: SyncUnsafeCell<FdTableInner>,
}

pub struct FdTableInner {
    soft_limit: usize,
    hard_limit: usize,
    flags: Vec<Option<OpenFlags>>,
    table: Vec<Option<FileClass>>,
}

impl FdTableInner {
    pub fn empty() -> Self {
        Self {
            soft_limit: 64,
            hard_limit: 256,
            flags: Vec::new(),
            table: Vec::new(),
        }
    }
    pub fn new(
        flags: Vec<Option<OpenFlags>>,
        table: Vec<Option<FileClass>>,
        soft_limit: usize,
        hard_limit: usize,
    ) -> Self {
        FdTableInner {
            flags,
            table,
            soft_limit,
            hard_limit,
        }
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
            64,
            256,
        ))
    }
    pub fn from_another(another: &Arc<FdTable>) -> Self {
        let other = another.get_ref();
        Self {
            inner: SyncUnsafeCell::new(FdTableInner::new(
                other.flags.clone(),
                other.table.clone(),
                other.soft_limit,
                other.hard_limit,
            )),
        }
    }
    pub fn alloc_fd(&self) -> SyscallRet {
        let fd_table = &mut self.get_mut().table;
        let flags = &mut self.get_mut().flags;
        if let Some(fd) = (0..fd_table.len()).find(|fd| fd_table[*fd].is_none()) {
            return Ok(fd);
        }
        if fd_table.len() >= self.get_soft_limit() {
            return Err(SysErrNo::EMFILE);
        }
        fd_table.push(None);
        flags.push(None);
        Ok(fd_table.len() - 1)
    }
    pub fn alloc_fd_larger_than(&self, arg: usize) -> SyscallRet {
        let fd_table = &mut self.get_mut().table;
        let flags = &mut self.get_mut().flags;
        if arg >= self.get_soft_limit() {
            return Err(SysErrNo::EMFILE);
        }
        if fd_table.len() < arg {
            fd_table.resize(arg, None);
            flags.resize(arg, None);
        }
        if let Some(fd) = (arg..fd_table.len()).find(|fd| fd_table[*fd].is_none()) {
            Ok(fd)
        } else {
            fd_table.push(None);
            flags.push(None);
            Ok(fd_table.len() - 1)
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

    pub fn resize(&self, size: usize) -> GeneralRet {
        if size >= self.get_soft_limit() {
            return Err(SysErrNo::EMFILE);
        }
        self.get_mut().table.resize(size, None);
        self.get_mut().flags.resize(size, None);
        Ok(())
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

    pub fn get_hard_limit(&self) -> usize {
        self.get_ref().hard_limit
    }

    pub fn get_soft_limit(&self) -> usize {
        self.get_ref().soft_limit
    }

    pub fn set_limit(&self, soft_limit: usize, hard_limit: usize) {
        let inner = self.get_mut();
        inner.soft_limit = soft_limit;
        inner.hard_limit = hard_limit;
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
    /// 当前工作路径
    pub cwd: String,
    /// 可执行文件绝对路径
    pub exe: String,
    /// 一个文件对应多个fd
    pub fd2path: HashMap<usize, String>,
}

pub struct FsInfo {
    inner: SyncUnsafeCell<FsInfoInner>,
}

impl FsInfo {
    /// 只有initproc会调用
    pub fn new(cwd: String) -> Self {
        let mut fd2path = HashMap::new();
        fd2path.insert(0, "stdin".to_string());
        fd2path.insert(1, "stdout".to_string());
        fd2path.insert(2, "stderr".to_string());
        Self {
            inner: SyncUnsafeCell::new(FsInfoInner {
                cwd,
                fd2path,
                exe: String::from("/initproc"),
            }),
        }
    }
    pub fn from_another(another: &Arc<FsInfo>) -> Self {
        Self {
            inner: SyncUnsafeCell::new(FsInfoInner {
                cwd: another.get_cwd(),
                exe: another.get_exe(),
                fd2path: another.inner.get_unchecked_ref().fd2path.clone(),
            }),
        }
    }
    pub fn get_cwd(&self) -> String {
        self.get_mut().cwd.clone()
    }
    pub fn cwd(&self) -> &str {
        self.get_ref().cwd.as_str()
    }
    pub fn cwd_as_bytes(&self) -> &[u8] {
        self.get_ref().cwd.as_bytes()
    }
    pub fn set_cwd(&self, cwd: String) {
        self.get_mut().cwd = cwd;
    }
    pub fn get_exe(&self) -> String {
        self.get_mut().exe.clone()
    }
    pub fn exe(&self) -> &str {
        &self.get_ref().exe
    }
    pub fn exe_as_bytes(&self) -> &[u8] {
        self.get_ref().exe.as_bytes()
    }
    pub fn set_exe(&self, exe: String) {
        self.get_mut().exe = exe;
    }
    pub fn in_root(&self) -> bool {
        self.cwd() == "/"
    }
    pub fn insert(&self, path: String, fd: usize) {
        self.get_mut().fd2path.insert(fd, path);
    }
    pub fn insert_with_glue(&self, glue: usize, target: usize) {
        let path = self.get_ref().fd2path.get(&glue).unwrap().clone();
        self.get_mut().fd2path.insert(target, path);
    }
    pub fn has_fd(&self, path: &str) -> bool {
        self.get_ref().fd2path.values().any(|v| v == path)
    }
    pub fn remove(&self, fd: usize) {
        self.get_mut().fd2path.remove(&fd);
    }

    fn get_mut(&self) -> &mut FsInfoInner {
        self.inner.get_unchecked_mut()
    }
    fn get_ref(&self) -> &FsInfoInner {
        self.inner.get_unchecked_ref()
    }
}
