//! File and filesystem-related syscalls
use crate::{
    console::print,
    fs::{
        is_abs_path, make_pipe, open, open_device_file, open_file, path2abs, path2vec,
        remove_vfile_idx, sync_all, Dirent, File, FileClass, Kstat, Mode, OSFile, OpenFlags,
        Statfs, MNT_TABLE, SEEK_CUR, SEEK_SET,
    },
    mm::{
        safe_translated_byte_buffer, translated_byte_buffer, translated_ref, translated_refmut,
        translated_str, UserBuffer,
    },
    syscall::{FaccessatMode, Renameat2Flags},
    task::{current_task, current_token},
    timer::{get_time_ms, Timespec},
    utils::{trim_first_point_slash, SysErrNo, SyscallRet},
};
use alloc::{
    string::{String, ToString},
    sync::Arc,
    vec,
    vec::Vec,
};
use core::mem::size_of;
use log::{debug, info};

pub const AT_FDCWD: isize = -100;
pub const FD_LIMIT: usize = 128;
pub const AT_REMOVEDIR: u32 = 0x200;

#[repr(C)]
#[derive(Copy, Clone, Debug)]
pub struct Iovec {
    /// user space buf starting address
    pub iov_base: usize,
    /// number of bytes to transfer
    pub iov_len: usize,
}
unsafe impl Send for Iovec {}
unsafe impl Sync for Iovec {}

pub fn sys_write(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file: Arc<dyn File> = match file {
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
        let ret = file.write(UserBuffer::new(
            translated_byte_buffer(token, buf, len).unwrap(),
        ))?;
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_read(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!("[sys_read] fd is {}, len is {}", fd, len);

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file: Arc<dyn File> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let ret = file.read(UserBuffer::new(
            translated_byte_buffer(token, buf, len).unwrap(),
        ))?;
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}
pub fn sys_writev(fd: usize, iov: *const u8, iovcnt: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.writable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let mut ret: usize = 0;
        let iovec_size = core::mem::size_of::<Iovec>();

        for i in 0..iovcnt {
            // current iovec pointer
            let current = unsafe { iov.add(iovec_size * i) };
            let iovinfo = *translated_refmut(token, current as *mut Iovec);
            let buf = UserBuffer::new(
                translated_byte_buffer(token, iovinfo.iov_base as *mut u8, iovinfo.iov_len)
                    .unwrap(),
            );
            //file.set_offset(ret);
            let write_ret = file.write(buf)?;
            ret += write_ret as usize;
        }
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_readv(fd: usize, iov: *const u8, iovcnt: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let mut ret: usize = 0;
        let iovec_size = core::mem::size_of::<Iovec>();

        for i in 0..iovcnt {
            // current iovec pointer
            let current = unsafe { iov.add(iovec_size * i) };
            let iovinfo = *translated_refmut(token, current as *mut Iovec);
            let buf = UserBuffer::new(
                translated_byte_buffer(token, iovinfo.iov_base as *mut u8, iovinfo.iov_len)
                    .unwrap(),
            );
            //file.set_offset(ret);
            let write_ret = file.read(buf)?;
            ret += write_ret as usize;
        }
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_openat(dirfd: isize, path: *const u8, flags: u32, mode: u32) -> SyscallRet {
    if path as usize == 0 {
        return Err(SysErrNo::ENOENT);
    }

    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);
    let flags = OpenFlags::from_bits(flags).unwrap();

    debug!("[sys_openat], path is {}", path);

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if let Some(inode) = osfile.find(path.as_str(), flags) {
            let new_fd = inner.fd_table.alloc_fd();
            inner.fd_table.set(new_fd, Some(inode), Some(flags));
            return Ok(new_fd);
        }

        if flags.contains(OpenFlags::O_CREATE) {
            if let Some(inode) = osfile.create(path.as_str(), flags) {
                let new_fd = inner.fd_table.alloc_fd();
                inner.fd_table.set(new_fd, Some(inode), Some(flags));
                return Ok(new_fd);
            }
        }
        return Err(SysErrNo::EINVAL);
    }

    if let Some(inode) = open(base_path, path.as_str(), flags) {
        let new_fd = inner.fd_table.alloc_fd();
        inner.fd_table.set(new_fd, Some(inode), Some(flags));
        return Ok(new_fd);
    }
    return Err(SysErrNo::ENOENT);
}

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }
    inner.fd_table.take(fd);
    Ok(0)
}

pub fn sys_getcwd(buf: *const u8, size: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size).unwrap());
    buffer.write(inner.fs_info.as_bytes());
    Ok(buf as usize)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let (inode, flags) = inner.fd_table.try_get(fd);
    let fd_new = inner.fd_table.alloc_fd();
    inner.fd_table.set(fd_new, inode, flags);
    Ok(fd_new)
}

pub fn sys_dup3(old: usize, new: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if old >= inner.fd_table.len() || inner.fd_table.try_get_file(old).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if new >= FD_LIMIT {
        return Err(SysErrNo::EBADF);
    }

    inner.fd_table.resize(new + 1);

    let (inode, flags) = inner.fd_table.try_get(old);
    inner.fd_table.set(new, inode, flags);
    Ok(new)
}

pub fn sys_chdir(path: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);

    debug!("[sys_chdir] path is {}", path);

    if path.starts_with('/') {
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            let file = inode.file()?;
            if !file.inode.node_type().is_dir() {
                return Err(SysErrNo::ENOTDIR);
            }
            inner.fs_info.set_cwd(path.clone());
            return Ok(0);
        }
        return Err(SysErrNo::ENOENT);
    }

    let now_path: String = inner.fs_info.get_cwd();
    if let Some(inode) = open(now_path.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
        let file = inode.file()?;
        if !file.inode.node_type().is_dir() {
            return Err(SysErrNo::ENOTDIR);
        }
        let path = trim_first_point_slash(&path);

        if now_path == "/" {
            inner.fs_info.set_cwd(alloc::format! {"/{}",path});
        } else {
            inner
                .fs_info
                .set_cwd(alloc::format! {"{}/{}",inner.fs_info.cwd(),path});
        }
        return Ok(0);
    }
    return Err(SysErrNo::ENOENT);
}

pub fn sys_mkdirat(dirfd: isize, path: *const u8, mode: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if osfile
            .find(path.as_str(), OpenFlags::O_DIRECTORY | OpenFlags::O_RDWR)
            .is_some()
        {
            return Err(SysErrNo::EEXIST);
        }

        if osfile
            .create(
                path.as_str(),
                OpenFlags::O_DIRECTORY | OpenFlags::O_RDWR | OpenFlags::O_CREATE,
            )
            .is_some()
        {
            return Ok(0);
        }

        return Err(SysErrNo::EINVAL);
    }
    if let Some(_) = open(base_path, path.as_str(), OpenFlags::O_RDWR) {
        return Err(SysErrNo::EEXIST);
    }
    if let Some(newfile) = open(
        base_path,
        path.as_str(),
        OpenFlags::O_RDWR | OpenFlags::O_CREATE,
    ) {
        return Ok(0);
    }
    return Err(SysErrNo::ENOENT);
}

pub fn sys_getdents64(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!(
        "[sys_getdents64] fd is {},buf is {:x}, len is {}",
        fd, buf as usize, len
    );

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let mut buffer =
        UserBuffer::new(safe_translated_byte_buffer(inner.memory_set.clone(), buf, len).unwrap());

    let file = inner.fd_table.get_file(fd).file()?;
    if !file.readable() {
        return Err(SysErrNo::EACCES);
    }

    let mut off = file.lseek(0, SEEK_CUR)?;
    let mut res = 0;
    let mut vec = Vec::new();
    while let Some(dirent) = file.inode.read_dentry(off) {
        if res + dirent.len() > len {
            break;
        }
        res += dirent.len();
        vec.extend_from_slice(dirent.as_bytes());
        off = dirent.off();
    }
    buffer.write(vec.as_slice());
    file.lseek(off as isize, SEEK_SET)?;
    Ok(res)
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
    let mut base_path = inner.fs_info.cwd();

    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }
        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::empty()) {
            let osfile = osfile.file()?;
            osfile.inode.unlink();
        }
        return Ok(0);
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::empty()) {
        let osfile = osfile.file()?;
        let abs_path = if is_abs_path(&path) {
            path.to_string()
        } else {
            let mut wpath = {
                if base_path == "/" {
                    Vec::with_capacity(32)
                } else {
                    path2vec(base_path)
                }
            };
            path2abs(&mut wpath, &path2vec(&path))
        };
        remove_vfile_idx(&abs_path);
        osfile.inode.unlink();
    }
    Ok(0)
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

    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()).unwrap());

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file = file.file()?;
        let kstat = file.inode.fstat();
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

    let read_fd = inner.fd_table.alloc_fd();
    let (read_pipe, write_pipe) = make_pipe();
    inner
        .fd_table
        .set(read_fd, Some(FileClass::Abs(read_pipe)), None);
    let write_fd = inner.fd_table.alloc_fd();
    inner
        .fd_table
        .set(write_fd, Some(FileClass::Abs(write_pipe)), None);
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    Ok(0)
}

pub fn sys_fstatat(dirfd: isize, path: *const u8, kst: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);
    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()).unwrap());

    debug!("[sys_fstatat] dirfd is {}, path is {}", dirfd, path);

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }
        let file = inner.fd_table.get_file(dirfd).file()?;
        if let Some(osfile) = file.find(path.as_str(), OpenFlags::O_RDONLY) {
            let osfile = osfile.file()?;
            let kstat = file.inode.fstat();
            kst.write(kstat.as_bytes());
            return Ok(0);
        }
        return Err(SysErrNo::ENOENT);
    }

    if let Some(file) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        let file = file.file()?;
        let kstat = file.inode.fstat();
        kst.write(kstat.as_bytes());
        return Ok(0);
    }
    Err(SysErrNo::ENOENT)
}

pub fn sys_statfs(_path: *const u8, statfs: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut statfs =
        UserBuffer::new(translated_byte_buffer(token, statfs, size_of::<Statfs>()).unwrap());

    let ourstatfs = Statfs::new();
    statfs.write(ourstatfs.as_bytes());
    Ok(0)
}

pub fn sys_faccessat(dirfd: isize, path: *const u8, mode: u32, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    debug!(
        "[sys_faccessat] dirfd is {} and path is {} and mode is {}",
        dirfd, path, mode
    );

    let mode = FaccessatMode::from_bits(mode).unwrap();

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }
        if let Some(FileClass::File(osfile)) = &inner.fd_table.try_get_file(dirfd) {
            if osfile.find(path.as_str(), OpenFlags::O_RDWR).is_some() {
                return Ok(0);
            }
            return Err(SysErrNo::ENOENT);
        } else {
            if mode.contains(FaccessatMode::F_OK) {
                //println!("This file doesn't exist!");
                return Ok(usize::MAX);
            }
            return Err(SysErrNo::EINVAL);
        }
    }
    if open(base_path, path.as_str(), OpenFlags::O_RDWR).is_some() {
        return Ok(0);
    } else {
        if mode.contains(FaccessatMode::F_OK) {
            return Ok(usize::MAX);
        }
        Err(SysErrNo::ENOENT)
    }
}

const UTIME_NOW: usize = (1 << 30) - 1;
const UTIME_OMIT: usize = (1 << 30) - 2;

pub fn sys_utimensat(dirfd: isize, path: *const u8, times: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    let nowtime = (get_time_ms() / 1000) as u64;

    let mut base_path = inner.fs_info.cwd();
    let (mut atime_sec, mut mtime_sec) = (None, None);

    if times as usize == 0 {
        atime_sec = Some(nowtime);
        mtime_sec = Some(nowtime);
    } else {
        let atime = translated_ref(token, times as *const Timespec);
        let mtime = translated_ref(token, unsafe { times.add(1) as *const Timespec });
        match atime.tv_nsec {
            UTIME_NOW => atime_sec = Some(nowtime),
            UTIME_OMIT => (),
            _ => atime_sec = Some(atime.tv_sec as u64),
        };
        match mtime.tv_nsec {
            UTIME_NOW => mtime_sec = Some(nowtime),
            UTIME_OMIT => (),
            _ => mtime_sec = Some(mtime.tv_sec as u64),
        };
    }

    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDONLY) {
            let osfile = osfile.file()?;
            osfile
                .inode
                .set_timestamps(atime_sec, None, mtime_sec, None);
            return Ok(0);
        }
        return Err(SysErrNo::ENOENT);
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        let osfile = osfile.file()?;
        osfile
            .inode
            .set_timestamps(atime_sec, None, mtime_sec, None);
        return Ok(0);
    }
    Err(SysErrNo::ENOENT)
}

pub fn sys_lseek(fd: usize, offset: isize, whence: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }
    let file = inner.fd_table.get_file(fd).file()?;
    file.lseek(offset, whence)
}

const F_DUPFD: usize = 0;
const F_DUPFD_CLOEXEC: usize = 1030;
const F_GETFD: usize = 1;
const F_SETFD: usize = 2;
const F_GETFL: usize = 3;
const F_SETFL: usize = 4;

const FD_CLOEXEC: usize = 1;

pub fn sys_fcntl(fd: usize, cmd: usize, arg: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    debug!("[sys_fcntl] fd is {}, cmd is {}, arg is {}", fd, cmd, arg);

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let file = inner.fd_table.get_file(fd);

    match cmd {
        F_DUPFD => {
            let inode = file.clone();
            let fd_new = inner.fd_table.alloc_fd();
            let flags = inner.fd_table.try_get_flag(fd);
            inner.fd_table.set(fd_new, Some(inode), flags);
            return Ok(fd_new);
        }
        F_DUPFD_CLOEXEC => {
            let file = file.file()?;
            let inode = file.clone();
            let flags = inner.fd_table.get_flag(fd) | OpenFlags::O_CLOEXEC;
            let fd_new = inner.fd_table.alloc_fd();
            inner
                .fd_table
                .set(fd_new, Some(FileClass::File(inode)), Some(flags));
            return Ok(fd_new);
        }
        F_GETFD => {
            return if inner.fd_table.contain_cloexec(fd) {
                Ok(1)
            } else {
                Ok(0)
            };
        }
        F_SETFD => {
            if arg & FD_CLOEXEC == 0 {
                inner.fd_table.unset_cloexec(fd);
            } else {
                inner.fd_table.set_cloexec(fd);
            }
        }
        F_GETFL => {
            return Ok(inner.fd_table.get_flag(fd).bits() as usize);
        }
        F_SETFL => {
            let file = file.file()?;
            let flags = OpenFlags::from_bits_truncate(arg as u32);
            inner.fd_table.set_flags(fd, Some(flags));
        }
        _ => {
            return Err(SysErrNo::EINVAL);
        }
    }
    Ok(0)
}

//TODO(ZMY) 如果需要的话,使用注释内的代码;部分结构需做一下类型体操
//busybox只需要跑脚本,大概率不需要
pub fn sys_ioctl(fd: usize, cmd: usize, arg: usize) -> SyscallRet {
    // let task = current_task().unwrap();
    // let mut inner = task.inner_lock();
    // let token = inner.user_token();

    debug!("[sys_ioctl] fd is {},cmd is {:x},arg is {:x}", fd, cmd, arg);
    Ok(0)

    // if fd >= inner.fd_table.len() || inner.fd_table.get_file(fd).is_none() {
    //     return Err(SysErrNo::EINVAL);
    // }

    // if let Some(file) = &inner.fd_table.get_file(fd) {
    //     let file = match file {
    //         FileClass::File(f) => return Err(SysErrNo::EINVAL),
    //         FileClass::Abs(f) => f.clone(),
    //     };
    //     drop(inner);
    //     drop(task);
    //     let res = file.ioctl(cmd, arg);
    //     if res == -1 {
    //         return Err(SysErrNo::EINVAL);
    //     }
    //     Ok(0)
    // } else {
    //     Err(SysErrNo::ENOENT)
    // }
}

pub fn sys_sendfile(outfd: usize, infd: usize, offset_ptr: usize, count: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if outfd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(outfd).is_none()
        || infd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(infd).is_none()
    {
        return Err(SysErrNo::EINVAL);
    }

    let outfile = match inner.fd_table.get_file(outfd) {
        FileClass::File(f) => f.clone(),
        FileClass::Abs(f) => f.clone(),
    };
    if !outfile.writable() {
        return Err(SysErrNo::EACCES);
    }

    let infile = inner.fd_table.get_file(infd).file()?;
    if !infile.readable() {
        return Err(SysErrNo::EACCES);
    }

    //构造输入缓冲池
    let mut buf = vec![0u8; count];
    let mut inbufv = Vec::new();
    unsafe {
        inbufv.push(core::slice::from_raw_parts_mut(
            buf.as_mut_slice().as_mut_ptr(),
            buf.as_slice().len(),
        ));
    }
    //输入缓冲池
    let mut inbuffer = UserBuffer::new(inbufv);

    let readcount;
    if offset_ptr == 0 {
        readcount = infile.read(inbuffer)?;
    } else {
        let offset = *translated_ref(token, offset_ptr as *const isize);
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        // infile.set_offset(offset as usize);
        infile.lseek(offset, SEEK_SET);
        readcount = infile.read(inbuffer)?;
    }
    //构造输出缓冲池
    let mut outbufv = Vec::new();
    unsafe {
        outbufv.push(core::slice::from_raw_parts_mut(
            buf.as_mut_slice().as_mut_ptr(),
            readcount,
        ));
    }
    //输出缓冲池
    let mut outbuffer = UserBuffer::new(outbufv);
    //写数据
    let retcount = outfile.write(outbuffer)?;

    Ok(retcount)
}

pub fn sys_pwrite64(fd: usize, buf: *const u8, count: usize, offset: isize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if offset < 0 || fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file = file.file()?;
        if !file.writable() {
            return Err(SysErrNo::EACCES);
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let cur_offset = file.offset();
        file.lseek(offset, SEEK_SET);
        let ret = file.write(UserBuffer::new(
            translated_byte_buffer(token, buf, count).unwrap(),
        ))?;
        file.lseek(cur_offset, SEEK_SET);
        return Ok(ret);
    }
    Err(SysErrNo::EBADF)
}

pub fn sys_pread64(fd: usize, buf: *const u8, count: usize, offset: isize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if offset < 0 || fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file = file.file()?;
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let cur_offset = file.offset();
        file.lseek(offset, SEEK_SET);
        let ret = file.read(UserBuffer::new(
            translated_byte_buffer(token, buf, count).unwrap(),
        ))?;
        file.lseek(cur_offset, SEEK_SET);
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}
// Linux的实现与手册有差异或未实现该调用
pub fn sys_ftruncate(fd: usize, length: i32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    // let token = inner.user_token();
    if let Some(file) = inner.fd_table.try_get_file(fd) {
        let file = file.file()?;
        if length == 0 {
            file.inode.truncate()?;
        } else {
            panic!("[sys_ftruncate] unimplement truncate length > 0")
        }
        return Ok(0);
    }
    Err(SysErrNo::EBADF)
    // let task = current_task().unwrap();
    // let mut inner = task.inner_lock();
    // let token = inner.user_token();

    // if length < 0 || fd >= inner.fd_table.len() || inner.fd_table.get_file(fd).is_none() {
    //     return Err(SysErrNo::EINVAL);
    // }

    // if let Some(file) = &inner.fd_table.get_file(fd) {
    //     let file = match file {
    //         FileClass::File(f) => f.clone(),
    //         FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
    //     };
    //     if file.is_dir() {
    //         return Err(SysErrNo::EISDIR);
    //     }
    //     if !file.writable() {
    //         return Err(SysErrNo::EACCES);
    //     }

    //     file.set_file_size(length as u32);
    //     Ok(0)
    // } else {
    //     Err(SysErrNo::ENOENT)
    // }
}

pub fn sys_fsync(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let file = inner.fd_table.get_file(fd).file()?;
    file.inode.sync();
    Ok(0)
}

pub fn sys_sync() -> SyscallRet {
    sync_all();
    Ok(0)
}

pub fn sys_symlinkat(target: *const u8, dirfd: isize, linkpath: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let linkpath = translated_str(token, linkpath);

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&linkpath) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if osfile.find(linkpath.as_str(), OpenFlags::O_RDWR).is_some() {
            return Err(SysErrNo::EEXIST);
        }

        if let Some(newfile) =
            osfile.create(linkpath.as_str(), OpenFlags::O_RDWR | OpenFlags::O_CREATE)
        {
            let newfile = newfile.file()?;
            let mut target = translated_str(token, target);
            let mut buf = Vec::new();
            unsafe {
                let target_bytes = target.as_bytes_mut();
                let target_buf =
                    core::slice::from_raw_parts_mut(target_bytes.as_mut_ptr(), target_bytes.len());
                buf.push(target_buf);
            }
            let mut buffer = UserBuffer::new(buf); //输入缓冲池
            newfile.write(buffer);
            newfile.inode.link();
            return Ok(0);
        }
        return Err(SysErrNo::EINVAL);
    }
    if let Some(_) = open(base_path, linkpath.as_str(), OpenFlags::O_RDWR) {
        return Err(SysErrNo::EEXIST);
    }

    if let Some(newfile) = open(
        base_path,
        linkpath.as_str(),
        OpenFlags::O_RDWR | OpenFlags::O_CREATE,
    ) {
        let newfile = newfile.file()?;
        let mut target = translated_str(token, target);
        let mut buf = Vec::new();
        unsafe {
            let target_bytes = target.as_bytes_mut();
            let target_buf =
                core::slice::from_raw_parts_mut(target_bytes.as_mut_ptr(), target_bytes.len());
            buf.push(target_buf);
        }
        let mut buffer = UserBuffer::new(buf); //输入缓冲池
        newfile.write(buffer);
        newfile.inode.link();
        return Ok(0);
    }
    return Err(SysErrNo::ENOENT);
}

pub fn sys_readlinkat(dirfd: isize, path: *const u8, buf: *const u8, bufsiz: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        let dirfd = dirfd as usize;
        if dirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(dirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(dirfd).file()?;
        if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDONLY) {
            let osfile = osfile.file()?;
            if !osfile.inode.node_type().is_symlink() {
                return Err(SysErrNo::EINVAL);
            }
            // release current task TCB manually to avoid multi-borrow
            drop(inner);
            drop(task);
            let ret = osfile.read(UserBuffer::new(
                translated_byte_buffer(token, buf, bufsiz).unwrap(),
            ))?;
            return Ok(ret);
        }
        return Err(SysErrNo::ENOENT);
    }

    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        let osfile = osfile.file()?;
        if !osfile.readable() {
            return Err(SysErrNo::EACCES);
        }
        if !osfile.inode.node_type().is_symlink() {
            return Err(SysErrNo::EINVAL);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let ret = osfile.read(UserBuffer::new(
            translated_byte_buffer(token, buf, bufsiz).unwrap(),
        ))?;
        return Ok(ret);
    }
    Err(SysErrNo::ENOENT)
}

/// If newpath already exists, replace it.
/// If oldpath and newpath are existing hard links referring to the same inode, then return a success.
/// If newpath exists but operation failed (for some reason, rename() failed), leave an instance of newpath in place (which means you should keep the backup of newpath if it exist).
/// If oldpath can specify a directory, then newpath should be a blank directory or not exist.
pub fn sys_renameat2(
    olddirfd: isize,
    oldpath: *const u8,
    newdirfd: isize,
    newpath: *const u8,
    flags: u32,
) -> SyscallRet {
    // TODO(ZMY) 暂时不知道在不改变实现的情况下如何支持交换;部分23年内核也不支持该功能;需要再添加

    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut oldpath = translated_str(token, oldpath);
    let mut newpath = translated_str(token, newpath);
    let flags = Renameat2Flags::from_bits(flags).unwrap();

    let mut oldfile;
    // let mut newfile;

    //找到旧文件
    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&oldpath) {
        base_path = "/";
    } else if olddirfd != AT_FDCWD {
        let olddirfd = olddirfd as usize;
        if olddirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(olddirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(olddirfd).file()?;
        if let Some(osfile) = osfile.find(oldpath.as_str(), OpenFlags::O_RDWR) {
            let osfile = osfile.file()?;
            oldfile = osfile.clone();
        } else {
            return Err(SysErrNo::EBADF);
        }
    }
    if let Some(osfile) = open(base_path, oldpath.as_str(), OpenFlags::O_RDWR) {
        let osfile = osfile.file()?;
        oldfile = osfile.clone();
    } else {
        return Err(SysErrNo::ENOENT);
    }
    //创建新文件
    let (checkflags, openflags);
    if oldfile.inode.node_type().is_dir() {
        checkflags = OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY;
        openflags = OpenFlags::O_CREATE | OpenFlags::O_RDWR | OpenFlags::O_DIRECTORY;
    } else {
        checkflags = OpenFlags::O_RDWR;
        openflags = OpenFlags::O_CREATE | OpenFlags::O_RDWR;
    }

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&newpath) {
        base_path = "/";
    } else if newdirfd != AT_FDCWD {
        let newdirfd = newdirfd as usize;
        if newdirfd >= inner.fd_table.len() || inner.fd_table.try_get_file(newdirfd).is_none() {
            return Err(SysErrNo::EINVAL);
        }

        let osfile = inner.fd_table.get_file(newdirfd).file()?;
        if let Some(osfile) = osfile.create(newpath.as_str(), openflags) {
            let newfile = osfile.file()?;
            newfile.inode.rename(oldfile.inode.clone());
            oldfile.inode.delete();
            return Ok(0);
        }
        return Err(SysErrNo::ENOENT);
        // if let Some(osfile) = osfile.find(newpath.as_str(), checkflags) {
        //     let osfile = osfile.file()?;
        //     match flags {
        //         Renameat2Flags::RENAME_NOREPLACE => {
        //             return Err(SysErrNo::EEXIST);
        //         }
        //         Renameat2Flags::RENAME_EXCHANGE => {
        //             //交换两个文件
        //             newfile = osfile.clone();
        //             let tmp_file_size = oldfile.file_size();
        //             let tmp_first_cluster = oldfile.first_cluster();
        //             oldfile.set_file_size(newfile.file_size() as u32);
        //             oldfile.set_first_cluster(newfile.first_cluster());
        //             newfile.set_file_size(tmp_file_size as u32);
        //             newfile.set_first_cluster(tmp_first_cluster);
        //             return Ok(0);
        //         }
        //         _ => return Err(SysErrNo::EINVAL),
        //     }
        // }
        // if let Some(osfile) = osfile.create(newpath.as_str(), openflags) {
        //     let osfile = match osfile {
        //         FileClass::File(f) => f.clone(),
        //         FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
        //     };
        //     //辞旧迎新
        //     newfile = osfile.clone();
        //     newfile.set_file_size(oldfile.file_size() as u32);
        //     newfile.set_first_cluster(oldfile.first_cluster());
        //     oldfile.delete();
        //     return Ok(0);
        // }
        // return Err(SysErrNo::ENOENT);
    }
    if let Some(osfile) = open(base_path, newpath.as_str(), openflags) {
        let newfile = osfile.file()?;
        newfile.inode.rename(oldfile.inode.clone());
        let abs_path = if is_abs_path(&oldpath) {
            oldpath.to_string()
        } else {
            let mut wpath = {
                if base_path == "/" {
                    Vec::with_capacity(32)
                } else {
                    path2vec(base_path)
                }
            };
            path2abs(&mut wpath, &path2vec(&oldpath))
        };
        remove_vfile_idx(&abs_path);
        oldfile.inode.delete();
        return Ok(0);
    }
    return Err(SysErrNo::ENOENT);
    // if let Some(osfile) = open(base_path, newpath.as_str(), checkflags) {
    //     let osfile = osfile.file()?;
    //     match flags {
    //         Renameat2Flags::RENAME_NOREPLACE => {
    //             return Err(SysErrNo::EEXIST);
    //         }
    //         Renameat2Flags::RENAME_EXCHANGE => {
    //             //交换两个文件
    //             newfile = osfile.clone();
    //             let tmp_file_size = oldfile.file_size();
    //             let tmp_first_cluster = oldfile.first_cluster();
    //             oldfile.set_file_size(newfile.file_size() as u32);
    //             oldfile.set_first_cluster(newfile.first_cluster());
    //             newfile.set_file_size(tmp_file_size as u32);
    //             newfile.set_first_cluster(tmp_first_cluster);
    //             return Ok(0);
    //         }
    //         _ => return Err(SysErrNo::EINVAL),
    //     }
    // }

    // if let Some(osfile) = open(base_path, newpath.as_str(), openflags) {
    //     let osfile = osfile.file()?;
    //     //辞旧迎新
    //     newfile = osfile.clone();
    //     newfile.set_file_size(oldfile.file_size() as u32);
    //     newfile.set_first_cluster(oldfile.first_cluster());
    //     let abs_path = if is_abs_path(&oldpath) {
    //         oldpath.to_string()
    //     } else {
    //         let mut wpath = {
    //             if base_path == "/" {
    //                 Vec::with_capacity(32)
    //             } else {
    //                 path2vec(base_path)
    //             }
    //         };
    //         path2abs(&mut wpath, &path2vec(&oldpath))
    //     };
    //     remove_vfile_idx(&abs_path);
    //     oldfile.delete();
    //     return Ok(0);
    // }
    // return Err(SysErrNo::ENOENT);
}

pub fn sys_copy_file_range(
    infd: usize,
    off_in: usize,
    outfd: usize,
    off_out: usize,
    count: usize,
    _flags: u32,
) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if outfd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(outfd).is_none()
        || infd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(infd).is_none()
    {
        return Err(SysErrNo::EINVAL);
    }

    let outfile = inner.fd_table.get_file(outfd).file()?;
    if !outfile.writable() {
        return Err(SysErrNo::EACCES);
    }

    let infile = inner.fd_table.get_file(infd).file()?;
    if !infile.readable() {
        return Err(SysErrNo::EACCES);
    }

    //构造输入缓冲池
    let mut buf = vec![0u8; count];
    let mut inbufv = Vec::new();
    unsafe {
        inbufv.push(core::slice::from_raw_parts_mut(
            buf.as_mut_slice().as_mut_ptr(),
            buf.as_slice().len(),
        ));
    }
    //输入缓冲池
    let mut inbuffer = UserBuffer::new(inbufv);

    //读数据
    let readcount;
    if off_in == 0 {
        readcount = infile.read(inbuffer)?;
    } else {
        let offset = *translated_ref(token, off_in as *const isize);
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        infile.lseek(offset, SEEK_SET);
        readcount = infile.read(inbuffer)?;
    }

    //构造输出缓冲池
    let mut outbufv = Vec::new();
    unsafe {
        outbufv.push(core::slice::from_raw_parts_mut(
            buf.as_mut_slice().as_mut_ptr(),
            readcount,
        ));
    }
    //输出缓冲池
    let mut outbuffer = UserBuffer::new(outbufv);

    //写数据
    let writecount;
    if off_out == 0 {
        writecount = outfile.write(outbuffer)?;
    } else {
        let offset = *translated_ref(token, off_out as *const isize);
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        outfile.lseek(offset, SEEK_SET);
        writecount = outfile.write(outbuffer)?;
    }
    Ok(writecount)
}

pub fn sys_getrandom(buf_ptr: *const u8, buflen: usize, _flags: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if buf_ptr.is_null() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(random_device) = open_device_file("/dev/random") {
        let ret = random_device.read(UserBuffer::new(
            translated_byte_buffer(token, buf_ptr, buflen).unwrap(),
        ))?;
        Ok(ret)
    } else {
        Err(SysErrNo::ENOENT)
    }
}
