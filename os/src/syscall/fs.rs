//! File and filesystem-related syscalls
use crate::{
    console::print,
    fs::{
        is_abs_path, make_pipe, open, open_file, remove_vfile_idx, Dirent, File, FileClass, Kstat,
        OpenFlags, Statfs, MNT_TABLE,
    },
    mm::{translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer},
    task::{current_task, current_token},
    timer::{get_time_ms, Timespec},
    utils::{SysErrNo, SyscallRet},
};
use alloc::{
    string::{String, ToString},
    sync::Arc,
    vec,
    vec::Vec,
};
use core::mem::size_of;
use log::info;

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
    if let Some(file) = &inner.fd_table.get(fd) {
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
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_read(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.get(fd) {
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
pub fn sys_writev(fd: usize, iov: *const u8, iovcnt: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.get(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
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
            let buf = UserBuffer::new(translated_byte_buffer(
                token,
                iovinfo.iov_base as *mut u8,
                iovinfo.iov_len,
            ));
            file.set_offset(ret);
            let write_ret = file.write(buf);
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
    if let Some(file) = &inner.fd_table.get(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
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
            let buf = UserBuffer::new(translated_byte_buffer(
                token,
                iovinfo.iov_base as *mut u8,
                iovinfo.iov_len,
            ));
            file.set_offset(ret);
            let write_ret = file.read(buf);
            ret += write_ret as usize;
        }
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
        ret = if let Some(inode) = open(inner.fs_info.cwd(), path.as_str(), flags) {
            let new_fd = inner.fd_table.alloc_fd();
            inner.fd_table.set(new_fd, Some(FileClass::File(inode)));
            Ok(new_fd)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        ret = if let Some(inode) = open_file(path.as_str(), flags) {
            let new_fd = inner.fd_table.alloc_fd();
            inner.fd_table.set(new_fd, Some(FileClass::File(inode)));
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
    if inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }
    inner.fd_table.take(fd);
    Ok(0)
}

pub fn sys_getcwd(buf: *const u8, size: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size));
    buffer.write(inner.fs_info.as_bytes());
    Ok(buf as usize)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let inode = inner.fd_table.get(fd);
    let fd_new = inner.fd_table.alloc_fd();
    inner.fd_table.set(fd_new, inode);
    Ok(fd_new)
}

pub fn sys_dup3(old: usize, new: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if old >= inner.fd_table.len() || inner.fd_table.get(old).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if new >= FD_LIMIT {
        return Err(SysErrNo::EBADF);
    }

    if (new >= inner.fd_table.len()) {
        for i in inner.fd_table.len()..(new + 1) {
            inner.fd_table.push(None);
        }
    }

    let inode = inner.fd_table.get(old);
    inner.fd_table.set(new, inode);
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
            inner.fs_info.set_cwd(path.clone());
            Ok(0)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        let now_path: String = inner.fs_info.get_cwd();
        drop(inner);
        if let Some(inode) = open(now_path.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
            let mut inner = task.inner_lock();
            if now_path == "/" {
                inner.fs_info.set_cwd(alloc::format! {"/{}",path.as_str()});
            } else {
                inner
                    .fs_info
                    .set_cwd(alloc::format! {   "{}/{}",inner.fs_info.cwd(),path.as_str()});
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

    let cwd_str = task_inner.fs_info.get_cwd();

    let cwd = if dirfd == AT_FDCWD && !is_abs_path(&path) {
        cwd_str.as_str()
    } else {
        "/"
    };
    drop(task_inner);

    let ret: SyscallRet = {
        if let Some(_) = open(
            cwd,
            path.as_str(),
            OpenFlags::O_DIRECTROY | OpenFlags::O_RDWR,
        ) {
            Err(SysErrNo::EEXIST)
        } else {
            if let Some(_) = open(
                cwd,
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

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(f) = &inner.fd_table.get(fd) {
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
        Err(SysErrNo::EINVAL)
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
    let mut base_path = inner.fs_info.cwd();

    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table.get(dirfd as usize) {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::empty()) {
                osfile.remove();
                return Ok(0);
            }
        }
        return Err(SysErrNo::EINVAL);
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

    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()));

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table.get(fd) {
        let mut kstat = Kstat::new();
        let file = file.clone();
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

    let read_fd = inner.fd_table.alloc_fd();
    let (read_pipe, write_pipe) = make_pipe();
    inner.fd_table.set(read_fd, Some(FileClass::Abs(read_pipe)));
    let write_fd = inner.fd_table.alloc_fd();
    inner
        .fd_table
        .set(write_fd, Some(FileClass::Abs(write_pipe)));
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

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table.get(dirfd as usize) {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDONLY) {
                let mut kstat = Kstat::new();
                let file = osfile.clone();
                file.fstat(&mut kstat);
                kst.write(kstat.as_bytes());
                return Ok(0);
            }
        } else {
            return Err(SysErrNo::EINVAL);
        }
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        let mut kstat = Kstat::new();
        let file = osfile.clone();
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

bitflags! {
    pub struct FaccessatMode: u32 {
        const F_OK = 0;
        const X_OK = 1<<0;
        const W_OK = 1<<1;
        const R_OK = 1<<2;
    }
}

pub fn sys_faccessat(dirfd: isize, path: *const u8, mode: u32, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);
    let mode = FaccessatMode::from_bits(mode).unwrap();

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table.get(dirfd as usize) {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDWR) {
                if mode.contains(FaccessatMode::X_OK) {
                    println!("This file can be searched!");
                }
                if mode.contains(FaccessatMode::W_OK) {
                    if osfile.writable() {
                        println!("This file can be written!");
                    } else {
                        println!("This file can not be written!");
                        return Ok(usize::MAX);
                    }
                }
                if mode.contains(FaccessatMode::R_OK) {
                    if osfile.readable() {
                        println!("This file can be read!");
                    } else {
                        println!("This file can not be read!");
                        return Ok(usize::MAX);
                    }
                }
                return Ok(0);
            }
        } else {
            if mode.contains(FaccessatMode::F_OK) {
                println!("This file doesn't exist!");
                return Ok(0);
            }
            return Err(SysErrNo::EINVAL);
        }
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDWR) {
        if mode.contains(FaccessatMode::X_OK) {
            println!("This file can be searched!");
        }
        if mode.contains(FaccessatMode::W_OK) {
            if osfile.writable() {
                println!("This file can be written!");
            } else {
                println!("This file can not be written!");
                return Ok(usize::MAX);
            }
        }
        if mode.contains(FaccessatMode::R_OK) {
            if osfile.readable() {
                println!("This file can be read!");
            } else {
                println!("This file can not be read!");
                return Ok(usize::MAX);
            }
        }
        return Ok(0);
    } else {
        if mode.contains(FaccessatMode::F_OK) {
            println!("This file doesn't exist!");
            return Ok(usize::MAX);
        }
        Err(SysErrNo::ENOENT)
    }
}

const UTIME_NOW: usize = (1 << 30) - 1;
const UTIME_OMIT: usize = (1 << 30) - 2;

pub fn sys_utimensat(dirfd: isize, path: *const u8, times: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    let nowtime = (get_time_ms() / 1000) as u64;

    let mut base_path = inner.fs_info.cwd();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table.get(dirfd as usize) {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::O_RDONLY) {
                if times as usize == 0 {
                    osfile.set_accessed_time(nowtime);
                    osfile.set_modification_time(nowtime);
                } else {
                    let atime = translated_ref(token, times as *const Timespec);
                    let mtime = translated_ref(token, unsafe { times.add(1) as *const Timespec });
                    match atime.tv_nsec {
                        UTIME_NOW => osfile.set_accessed_time(nowtime),
                        UTIME_OMIT => (),
                        _ => osfile.set_accessed_time(atime.tv_sec as u64),
                    };
                    match mtime.tv_nsec {
                        UTIME_NOW => osfile.set_modification_time(nowtime),
                        UTIME_OMIT => (),
                        _ => osfile.set_modification_time(mtime.tv_sec as u64),
                    };
                }
                return Ok(0);
            }
        } else {
            return Err(SysErrNo::EINVAL);
        }
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::O_RDONLY) {
        if times as usize == 0 {
            osfile.set_accessed_time(nowtime);
            osfile.set_modification_time(nowtime);
        } else {
            let atime = translated_ref(token, times as *const Timespec);
            let mtime = translated_ref(token, unsafe { times.add(1) as *const Timespec });
            match atime.tv_nsec {
                UTIME_NOW => osfile.set_accessed_time(nowtime),
                UTIME_OMIT => (),
                _ => osfile.set_accessed_time(atime.tv_sec as u64),
            };
            match mtime.tv_nsec {
                UTIME_NOW => osfile.set_modification_time(nowtime),
                UTIME_OMIT => (),
                _ => osfile.set_modification_time(mtime.tv_sec as u64),
            };
        }
        return Ok(0);
    } else {
        Err(SysErrNo::ENOENT)
    }
}

const SEEK_SET: usize = 0;
const SEEK_CUR: usize = 1;
const SEEK_END: usize = 2;

pub fn sys_lseek(fd: usize, offset: isize, whence: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table.get(fd) {
        let offset = match whence {
            SEEK_SET => offset,
            SEEK_CUR => file.offset() as isize + offset,
            SEEK_END => file.file_size() as isize + offset,
            _ => {
                return Err(SysErrNo::EINVAL);
            }
        };
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        file.set_offset(offset as usize);
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
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

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table.get(fd) {
        match cmd {
            F_DUPFD => {
                let inode = file.clone();
                let fd_new = inner.fd_table.alloc_fd();
                inner.fd_table.set(fd_new, Some(FileClass::File(inode)));
                return Ok(fd_new);
            }
            F_DUPFD_CLOEXEC => {
                let inode = file.clone();
                inode.set_cloexec();
                let fd_new = inner.fd_table.alloc_fd();
                inner.fd_table.set(fd_new, Some(FileClass::File(inode)));
                return Ok(fd_new);
            }
            F_GETFD => {
                return if file.get_openflags().contains(OpenFlags::O_CLOEXEC) {
                    Ok(1)
                } else {
                    Ok(0)
                };
            }
            F_SETFD => {
                if arg & FD_CLOEXEC == 0 {
                    file.unset_cloexec();
                } else {
                    file.set_cloexec();
                }
            }
            F_GETFL => return Ok(file.get_openflags().bits() as usize),
            F_SETFL => {
                let flags = OpenFlags::from_bits_truncate(arg as u32);
                file.set_openflags(flags);
            }
            _ => {
                return Err(SysErrNo::EINVAL);
            }
        }
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_sendfile(outfd: usize, infd: usize, offset_ptr: usize, count: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if outfd >= inner.fd_table.len()
        || inner.fd_table.get(outfd).is_none()
        || infd >= inner.fd_table.len()
        || inner.fd_table.get(infd).is_none()
    {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(outfile)) = &inner.fd_table.get(outfd) {
        if !outfile.writable() {
            return Err(SysErrNo::EACCES);
        }

        if let Some(FileClass::File(infile)) = &inner.fd_table.get(infd) {
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
            let mut inbuffer = UserBuffer::new(inbufv); //输入缓冲池
                                                        //读数据
            let readcount;
            if offset_ptr == 0 {
                readcount = infile.read(inbuffer);
            } else {
                let offset = translated_ref(token, offset_ptr as *const isize);
                if *offset < 0 {
                    return Err(SysErrNo::EINVAL);
                }
                infile.set_offset(*offset as usize);
                readcount = infile.read(inbuffer);
            }
            //构造输出缓冲池
            let mut outbufv = Vec::new();
            unsafe {
                outbufv.push(core::slice::from_raw_parts_mut(
                    buf.as_mut_slice().as_mut_ptr(),
                    readcount,
                ));
            }
            let mut outbuffer = UserBuffer::new(outbufv); //输出缓冲池
                                                          //写数据
            let retcount = outfile.write(outbuffer);

            Ok(retcount)
        } else {
            Err(SysErrNo::ENOENT)
        }
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_pwrite64(fd: usize, buf: *const u8, count: usize, offset: isize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if offset < 0 || fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.get(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
        };
        if !file.writable() {
            return Err(SysErrNo::EACCES);
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let cur_offset = file.offset();
        file.set_offset(offset as usize);
        let ret = file.write(UserBuffer::new(translated_byte_buffer(token, buf, count)));
        file.set_offset(cur_offset);
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_pread64(fd: usize, buf: *const u8, count: usize, offset: isize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if offset < 0 || fd >= inner.fd_table.len() {
        return Err(SysErrNo::EINVAL);
    }
    if let Some(file) = &inner.fd_table.get(fd) {
        let file = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => return Err(SysErrNo::EINVAL),
        };
        if !file.readable() {
            return Err(SysErrNo::EACCES);
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        let cur_offset = file.offset();
        file.set_offset(offset as usize);
        let ret = file.read(UserBuffer::new(translated_byte_buffer(token, buf, count)));
        file.set_offset(cur_offset);
        Ok(ret)
    } else {
        Err(SysErrNo::EBADF)
    }
}

pub fn sys_ftruncate(fd: usize, length: i32) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if length < 0 || fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table.get(fd) {
        if file.is_dir() {
            return Err(SysErrNo::EISDIR);
        }
        if !file.writable() {
            return Err(SysErrNo::EACCES);
        }

        file.set_file_size(length as u32);
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}

pub fn sys_fsync(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    if fd >= inner.fd_table.len() || inner.fd_table.get(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(FileClass::File(file)) = &inner.fd_table.get(fd) {
        file.sync();
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}
