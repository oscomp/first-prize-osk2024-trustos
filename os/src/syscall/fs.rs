//! File and filesystem-related syscalls
use crate::{
    console::print,
    fs::{
        is_abs_path, make_pipe, open, open_file, remove_vfile_idx, Dirent, File, FileClass, Kstat,
        OpenFlags, Statfs, MNT_TABLE,
    },
    mm::{translated_byte_buffer, translated_refmut, translated_str, UserBuffer},
    task::{current_task, current_token},
    utils::{SysErrNo, SyscallRet},
};
use alloc::{
    string::{String, ToString},
    sync::Arc,
};
use core::mem::size_of;
use log::info;

pub const AT_FDCWD: isize = -100;
pub const FD_LIMIT: usize = 128;
pub const AT_REMOVEDIR: u32 = 0x200;

pub fn sys_write(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table[fd] {
        let file: Arc<dyn File + Send + Sync> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.writable() {
            return Err(SysErrNo::EACCES);
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let ret = file.write(UserBuffer::new(translated_byte_buffer(token, buf, len)));
        Ok(ret)
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_read(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table[fd] {
        let file: Arc<dyn File + Send + Sync> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let ret = file.read(UserBuffer::new(translated_byte_buffer(token, buf, len)));
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_openat(fd: isize, path: *const u8, flags: u32, _mode: usize) -> SyscallRet {
    if path as usize == 0 {
        return Err(SysErrNo::ENOENT);
    }

    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    let flags = OpenFlags::from_bits(flags).unwrap();
    let ret: SyscallRet;

    if fd == AT_FDCWD && !is_abs_path(&path) {
        ret = if let Some(inode) = open(&inner.current_path, path.as_str(), flags) {
            let new_fd = inner.alloc_fd();
            inner.fd_table[new_fd] = Some(FileClass::File(inode));
            Ok(new_fd)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        ret = if let Some(inode) = open_file(path.as_str(), flags) {
            let new_fd = inner.alloc_fd();
            inner.fd_table[new_fd] = Some(FileClass::File(inode));
            Ok(new_fd)
        } else {
            Err(SysErrNo::ENOENT)
        }
    }

    ret
}

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table[fd].is_none() {
        return Err(SysErrNo::EBADF);
    }
    inner.fd_table[fd].take();
    Ok(0)
}

pub fn sys_getcwd(buf: *const u8, size: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size));
    buffer.write(inner.current_path.as_bytes());
    Ok(buf as usize)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table[fd].is_none() {
        return Err(SysErrNo::EBADF);
    }

    let inode = inner.fd_table[fd].as_ref().unwrap().clone();
    let fd_new = inner.alloc_fd();
    inner.fd_table[fd_new] = Some(inode);
    Ok(fd_new)
}

pub fn sys_dup3(old: usize, new: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if old >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table[old].is_none() {
        return Err(SysErrNo::EBADF);
    }
    if new >= FD_LIMIT {
        return Err(SysErrNo::EINVAL);
    }

    if (new >= inner.fd_table.len()) {
        for i in inner.fd_table.len()..(new + 1) {
            inner.fd_table.push(None);
        }
    }

    let inode = inner.fd_table[old].as_ref().unwrap().clone();
    inner.fd_table[new] = Some(inode);
    Ok(new)
}

pub fn sys_chdir(path: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let path = translated_str(token, path);
    if path.starts_with('/') {
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            let mut inner = task.inner_lock();
            inner.current_path = path.clone();
            Ok(0)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        let now_path: String = inner.current_path.clone();
        drop(inner);
        if let Some(inode) = open(now_path.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
            let mut inner = task.inner_lock();
            if now_path == "/" {
                inner.current_path = alloc::format! {"/{}",&path[..]};
            } else {
                inner.current_path = alloc::format! {   "{}/{}",&inner.current_path[..],&path[..]};
            }
            Ok(0)
        } else {
            Err(SysErrNo::ENOENT)
        }
    }
}

pub fn sys_mkdirat(dirfd: isize, path: *const u8, _mode: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();
    let path = translated_str(token, path);

    let cwd = if dirfd == AT_FDCWD && !is_abs_path(&path) {
        task_inner.current_path.clone()
    } else {
        String::from("/")
    };
    drop(task_inner);

    let ret: SyscallRet = {
        if let Some(_) = open(
            cwd.as_str(),
            path.as_str(),
            OpenFlags::O_DIRECTROY | OpenFlags::O_RDWR,
        ) {
            Err(SysErrNo::EEXIST)
        } else {
            if let Some(_) = open(
                cwd.as_str(),
                path.as_str(),
                OpenFlags::O_DIRECTROY | OpenFlags::O_RDWR | OpenFlags::O_CREATE,
            ) {
                Ok(0)
            } else {
                Err(SysErrNo::ENOENT)
            }
        }
    };

    ret
}

pub fn sys_getdents64(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, len));

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table[fd].is_none() {
        return Err(SysErrNo::EBADF);
    }

    if let Some(f) = &inner.fd_table[fd] {
        let file;
        if let FileClass::File(t) = f {
            file = t.clone();
        } else {
            return Err(SysErrNo::EPERM);
        }
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);

        let mut all_len: usize = 0;
        let mut dirent = Dirent::new();
        let dirent_size = size_of::<Dirent>();
        loop {
            if len < dirent_size + all_len {
                return Ok(all_len);
            }
            let readsize: isize = file.dirent(&mut dirent);
            if readsize < 0 {
                return Ok(all_len);
            }
            buffer.write_at(all_len, dirent.as_bytes());
            all_len += dirent_size;
        }
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_linkat(
    oldfd: isize,
    oldpath: *const u8,
    newfd: isize,
    newpath: *const u8,
    _flags: u32,
) -> SyscallRet {
    todo!();
}
pub fn sys_unlinkat(dirfd: isize, path: *const u8, flags: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    let path = translated_str(token, path);
    let mut base_path = inner.current_path.as_str();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table[dirfd as usize] {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::empty()) {
                osfile.remove();
                return Ok(0);
            }
        }
        return Err(SysErrNo::EBADF);
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::empty()) {
        let abs_path = if is_abs_path(&path) {
            path
        } else {
            base_path.to_string() + &path
        };
        remove_vfile_idx(&abs_path);
        osfile.remove();
        return Ok(0);
    }
    Err(SysErrNo::ENOENT)
}

pub fn sys_umount2(special: *const u8, flags: u32) -> SyscallRet {
    let token = current_token();
    let special = translated_str(token, special);

    let ret = MNT_TABLE.lock().umount(special, flags);
    if ret != -1 {
        Ok(0)
    } else {
        Err(SysErrNo::EINVAL)
    }
}

pub fn sys_mount(
    special: *const u8,
    dir: *const u8,
    ftype: *const u8,
    flags: u32,
    data: *const u8,
) -> SyscallRet {
    let token = current_token();
    let special = translated_str(token, special);
    let dir = translated_str(token, dir);
    let ftype = translated_str(token, ftype);
    if !data.is_null() {
        let data = translated_str(token, data);
        let ret = MNT_TABLE.lock().mount(special, dir, ftype, flags, data);
        if ret != -1 {
            Ok(0)
        } else {
            Err(SysErrNo::ENOSPC)
        }
    } else {
        let ret = MNT_TABLE
            .lock()
            .mount(special, dir, ftype, flags, String::from(""));
        if ret != -1 {
            Ok(0)
        } else {
            Err(SysErrNo::ENOSPC)
        }
    }
}

pub fn sys_fstat(fd: usize, kst: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()));

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table[fd].is_none() {
        return Err(SysErrNo::EBADF);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table[fd] {
        let mut kstat = Kstat::new();
        let file = file.clone();
        drop(inner);
        file.fstat(&mut kstat);
        kst.write(kstat.as_bytes());
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_pipe2(fd: *mut u32) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let read_fd = inner.alloc_fd();
    let (read_pipe, write_pipe) = make_pipe();
    inner.fd_table[read_fd] = Some(FileClass::Abs(read_pipe));
    let write_fd = inner.alloc_fd();
    inner.fd_table[write_fd] = Some(FileClass::Abs(write_pipe));
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    Ok(0)
}

pub fn sys_fstatat(dirfd: isize, path: *const u8, kst: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);
    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()));

    let mut base_path = inner.current_path.as_str();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table[dirfd as usize] {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDONLY) {
                let mut kstat = Kstat::new();
                let file = osfile.clone();
                drop(inner);
                file.fstat(&mut kstat);
                kst.write(kstat.as_bytes());
                return Ok(0);
            }
        } else {
            return Err(SysErrNo::EBADF);
        }
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        let mut kstat = Kstat::new();
        let file = osfile.clone();
        drop(inner);
        file.fstat(&mut kstat);
        kst.write(kstat.as_bytes());
        return Ok(0);
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_statfs(_path: *const u8, statfs: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut statfs = UserBuffer::new(translated_byte_buffer(token, statfs, size_of::<Statfs>()));

    let ourstatfs = Statfs::new();
    statfs.write(ourstatfs.as_bytes());
    Ok(0)
}
