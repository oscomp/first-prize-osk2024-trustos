//! File and filesystem-related syscalls
use crate::{
    fs::{
        fs_stat, make_pipe, open, open_device_file, remove_inode_idx, root_inode, sync, File,
        FileClass, InodeType, Kstat, OpenFlags, Statfs, MNT_TABLE, SEEK_CUR, SEEK_SET,
    },
    mm::{
        safe_translated_byte_buffer, translated_byte_buffer, translated_ref, translated_refmut,
        translated_str, UserBuffer,
    },
    syscall::{FaccessatMode, PollEvents, PollFd, SigSet},
    task::{current_task, current_token, suspend_current_and_run_next},
    timer::{get_time_ms, Timespec},
    utils::{get_abs_path, trim_start_slash, SysErrNo, SyscallRet},
};
use alloc::{
    string::{String, ToString},
    sync::Arc,
    vec,
    vec::Vec,
};
use core::cmp::min;
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
    debug!("[sys_write] fd is {}, len={}", fd, len);
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
    //let token = inner.user_token();
    let memory_set = inner.memory_set.clone();

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
            safe_translated_byte_buffer(memory_set, buf, len).unwrap(),
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

    // debug!(
    //     "[sys_writev] fd is {}, iov is {:x}, iovcnt is {}",
    //     fd, iov as usize, iovcnt
    // );

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
            let read_ret = file.read(buf)?;
            ret += read_ret as usize;
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
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);
    let flags = OpenFlags::from_bits(flags).unwrap();

    let abs_path = inner.get_abs_path(dirfd, &path)?;

    debug!(
        "[sys_openat] dirfd is {}, path is {}, flags is {:?}, mode is {}",
        dirfd, path, flags, mode
    );

    let inode = open(&abs_path, flags)?;
    let new_fd = inner.fd_table.alloc_fd()?;
    inner.fd_table.set(new_fd, Some(inode), Some(flags));
    inner.fs_info.insert(abs_path, new_fd);
    return Ok(new_fd);
}

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    debug!("[sys_close] fd is {}", fd);

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }
    inner.fd_table.take(fd);
    inner.fs_info.remove(fd);
    Ok(0)
}

pub fn sys_getcwd(buf: *const u8, size: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size).unwrap());
    buffer.write(inner.fs_info.as_bytes());
    Ok(buf as usize)
}
pub fn sys_dup(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let (inode, flags) = inner.fd_table.try_get(fd);
    let fd_new = inner.fd_table.alloc_fd()?;
    inner.fd_table.set(fd_new, inode, flags);
    inner.fd_table.unset_cloexec(fd_new);
    inner.fs_info.insert_with_glue(fd, fd_new);
    Ok(fd_new)
}

pub fn sys_dup3(old: usize, new: usize, flags: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    debug!(
        "[sys_dup3] oldfd is {}, newfd is {}, flags is {}",
        old, new, flags
    );

    if old >= inner.fd_table.len() || inner.fd_table.try_get_file(old).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if new >= FD_LIMIT {
        return Err(SysErrNo::EBADF);
    }

    if inner.fd_table.len() <= new {
        inner.fd_table.resize(new + 1);
    }

    let (inode, oldflags) = inner.fd_table.try_get(old);
    inner.fd_table.set(new, inode, oldflags);
    inner.fs_info.insert_with_glue(old, new);
    if flags == 0x800000 {
        //flags包含O_CLOEXEC,为新的fd设置该标志，否则不设置
        inner.fd_table.set_cloexec(new);
    } else {
        inner.fd_table.unset_cloexec(new);
    }
    Ok(new)
}

pub fn sys_chdir(path: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut path = translated_str(token, path);

    debug!("[sys_chdir] path is {}", path);

    let abs_path = get_abs_path(inner.fs_info.cwd(), &path);
    let osfile = open(&abs_path, OpenFlags::O_RDONLY)?.file()?;
    if !osfile.inode.types().is_dir() {
        return Err(SysErrNo::ENOTDIR);
    }
    // let path = trim_first_point_slash(&path);
    if path.starts_with("./") {
        path = path[1..].to_string();
    }
    if inner.fs_info.in_root() {
        inner.fs_info.set_cwd(path);
    } else {
        inner.fs_info.set_cwd(abs_path);
    }
    Ok(0)
}

pub fn sys_mkdirat(dirfd: isize, path: *const u8, _mode: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);

    let abs_path = inner.get_abs_path(dirfd, &path)?;
    if let Ok(_) = open(&abs_path, OpenFlags::O_RDWR) {
        return Err(SysErrNo::EEXIST);
    }
    if let Ok(_) = open(&abs_path, OpenFlags::O_RDWR | OpenFlags::O_CREATE) {
        return Ok(0);
    }
    return Err(SysErrNo::ENOENT);
}

pub fn sys_getdents64(fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    debug!(
        "[sys_getdents64] fd is {}, buf addr  is {:x}, len is {}",
        fd, buf as usize, len
    );

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let mut buffer =
        UserBuffer::new(safe_translated_byte_buffer(inner.memory_set.clone(), buf, len).unwrap());

    let file = inner.fd_table.get_file(fd).file()?;
    let off = file.lseek(0, SEEK_CUR)?;
    if let Some((de, off)) = file.inode.read_dentry(off, len) {
        buffer.write(de.as_slice());
        let _ = file.lseek(off as isize, SEEK_SET)?;
        return Ok(de.len());
    }
    return Err(SysErrNo::EINVAL);
}

pub fn sys_linkat(
    _oldfd: isize,
    _oldpath: *const u8,
    _newfd: isize,
    _newpath: *const u8,
    _flags: u32,
) -> SyscallRet {
    todo!();
}
pub fn sys_unlinkat(dirfd: isize, path: *const u8, _flags: u32) -> SyscallRet {
    // assert!(flags != AT_REMOVEDIR, "not support yet");
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    let path = translated_str(token, path);
    let abs_path = inner.get_abs_path(dirfd, &path)?;
    // TODO(ZMY) 支持符号链接,socket,FIFO,device
    // 如果是File但尚有对应的fd未关闭,等到close时unlink
    // 如果是符号链接,直接移除
    // 如果是socket, FIFO, or device,移除但现有的fd可继续使用
    let osfile = open(&abs_path, OpenFlags::empty())?.file()?;
    debug!(
        "[sys_unlinkat] path={},link_cnt={},has_activate_fd={}",
        &abs_path,
        osfile.inode.link_cnt()?,
        inner.fs_info.has_fd(&abs_path)
    );

    if osfile.inode.link_cnt()? == 1 && inner.fs_info.has_fd(&path) {
        osfile.inode.delay();
        remove_inode_idx(&abs_path);
    } else {
        osfile.inode.unlink(&abs_path);
        remove_inode_idx(&abs_path);
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
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!("[sys_fstat] fd is {:?}, kst is {}", fd, kst as usize);

    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()).unwrap());

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    if let Some(file) = &inner.fd_table.try_get_file(fd) {
        let file: Arc<dyn File> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        let kstat = file.fstat();
        kst.write(kstat.as_bytes());
        Ok(0)
    } else {
        Err(SysErrNo::ENOENT)
    }
}
pub fn sys_pipe2(fd: *mut u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    let (read_pipe, write_pipe) = make_pipe();
    let read_fd = inner.fd_table.alloc_fd()?;
    inner.fd_table.set(
        read_fd,
        Some(FileClass::Abs(read_pipe)),
        Some(OpenFlags::O_RDONLY),
    );
    let write_fd = inner.fd_table.alloc_fd()?;
    inner.fd_table.set(
        write_fd,
        Some(FileClass::Abs(write_pipe)),
        Some(OpenFlags::O_WRONLY),
    );
    inner.fs_info.insert("pipe".to_string(), read_fd);
    inner.fs_info.insert("pipe".to_string(), write_fd);
    debug!("pipe read fd is {}, write fd is {}", read_fd, write_fd);
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    Ok(0)
}

pub fn sys_fstatat(dirfd: isize, path: *const u8, kst: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = trim_start_slash(translated_str(token, path));
    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst, size_of::<Kstat>()).unwrap());

    debug!("[sys_fstatat] dirfd is {}, path is {}", dirfd, path);

    // let base_path = inner.get_cwd(dirfd, &path)?;
    let abs_path = inner.get_abs_path(dirfd, &path)?;
    let file = open(&abs_path, OpenFlags::O_RDONLY)?.any();
    let kstat = file.fstat();
    kst.write(kstat.as_bytes());
    return Ok(0);
}

pub fn sys_statfs(_path: *const u8, statfs: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let mut statfs =
        UserBuffer::new(translated_byte_buffer(token, statfs, size_of::<Statfs>()).unwrap());

    let ourstatfs = fs_stat();
    statfs.write(ourstatfs.as_bytes());
    Ok(0)
}

pub fn sys_faccessat(dirfd: isize, path: *const u8, mode: u32, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);

    debug!(
        "[sys_faccessat] dirfd is {} and path is {} and mode is {}",
        dirfd, path, mode
    );

    let mode = FaccessatMode::from_bits(mode).unwrap();
    // let base_path = inner.get_cwd(dirfd, &path)?;
    let abs_path = inner.get_abs_path(dirfd, &path)?;
    open(&abs_path, OpenFlags::O_RDWR).map_or_else(
        |_| {
            if mode.contains(FaccessatMode::F_OK) {
                return Ok(usize::MAX);
            }
            Err(SysErrNo::ENOENT)
        },
        |_| Ok(0),
    )
}

const UTIME_NOW: usize = (1 << 30) - 1;
const UTIME_OMIT: usize = (1 << 30) - 2;

pub fn sys_utimensat(dirfd: isize, path: *const u8, times: *const u8, _flags: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let path = translated_str(token, path);

    let nowtime = (get_time_ms() / 1000) as u32;

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
            _ => atime_sec = Some(atime.tv_sec as u32),
        };
        match mtime.tv_nsec {
            UTIME_NOW => mtime_sec = Some(nowtime),
            UTIME_OMIT => (),
            _ => mtime_sec = Some(mtime.tv_sec as u32),
        };
    }

    let abs_path = inner.get_abs_path(dirfd, &path)?;
    let osfile = open(&abs_path, OpenFlags::O_RDONLY)?.file()?;
    osfile.inode.set_timestamps(atime_sec, mtime_sec);
    return Ok(0);
}

pub fn sys_lseek(fd: usize, offset: isize, whence: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    debug!(
        "[sys_lseek] fd is {}, offset is {}, whence is {}",
        fd, offset, whence
    );

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
    let inner = task.inner_lock();
    // debug!("[sys_fcntl] fd is {}, cmd is {}, arg is {}", fd, cmd, arg);

    if fd >= inner.fd_table.len() || inner.fd_table.try_get_file(fd).is_none() {
        return Err(SysErrNo::EINVAL);
    }

    let file = inner.fd_table.get_file(fd);

    match cmd {
        F_DUPFD => {
            let inode = file.clone();
            let fd_new = inner.fd_table.alloc_fd_larger_than(arg)?;
            let flags = inner.fd_table.try_get_flag(fd);
            inner.fd_table.set(fd_new, Some(inode), flags);
            inner.fs_info.insert_with_glue(fd, fd_new);
            return Ok(fd_new);
        }
        F_DUPFD_CLOEXEC => {
            let inode = file.clone();
            let flags = inner.fd_table.get_flag(fd) | OpenFlags::O_CLOEXEC;
            let fd_new = inner.fd_table.alloc_fd_larger_than(arg)?;
            inner.fd_table.set(fd_new, Some(inode), Some(flags));
            inner.fs_info.insert_with_glue(fd, fd_new);
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
            let flags = OpenFlags::from_bits_truncate(arg as u32);
            inner.fd_table.set_flags(fd, Some(flags));
        }
        _ => {
            return Err(SysErrNo::EINVAL);
        }
    }
    Ok(0)
}

pub fn sys_ioctl(_fd: usize, _cmd: usize, _arg: usize) -> SyscallRet {
    Ok(0)
}

pub fn sys_sendfile(outfd: usize, infd: usize, offset_ptr: usize, count: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!(
        "[sys_sendfile] outfd is {}, infd is {}, offset_ptr is {}, count is {}",
        outfd, infd, offset_ptr, count
    );

    if outfd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(outfd).is_none()
        || infd >= inner.fd_table.len()
        || inner.fd_table.try_get_file(infd).is_none()
    {
        return Err(SysErrNo::EINVAL);
    }

    let outfile = inner.fd_table.get_file(outfd).any();
    if !outfile.writable() {
        return Err(SysErrNo::EACCES);
    }

    let infile = inner.fd_table.get_file(infd).file()?;
    if !infile.readable() {
        return Err(SysErrNo::EACCES);
    }

    drop(inner);
    drop(task);

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
    let inbuffer = UserBuffer::new(inbufv);

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

    if readcount == 0 {
        return Ok(0);
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
    let outbuffer = UserBuffer::new(outbufv);
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
        let cur_offset = file.lseek(0, SEEK_CUR)? as isize;
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
    //let token = inner.user_token();
    let memory_set = inner.memory_set.clone();

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
        let cur_offset = file.lseek(0, SEEK_CUR)? as isize;
        file.lseek(offset, SEEK_SET);
        let ret = file.read(UserBuffer::new(
            safe_translated_byte_buffer(memory_set, buf, count).unwrap(),
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
    if let Some(file) = inner.fd_table.try_get_file(fd) {
        let file = file.file()?;
        if length == 0 {
            file.inode.truncate(0)?;
        } else {
            panic!("[sys_ftruncate] unimplement truncate length > 0")
        }
        return Ok(0);
    }
    Err(SysErrNo::EBADF)
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
    sync();
    Ok(0)
}

#[allow(unused)]
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct RLimit {
    pub rlim_cur: usize, /* Soft limit */
    pub rlim_max: usize, /* Hard limit (ceiling for rlim_cur) */
}

pub fn sys_prlimit(
    pid: usize,
    resource: u32,
    new_limit: *const RLimit,
    old_limit: *mut RLimit,
) -> SyscallRet {
    const RLIMIT_NOFILE: u32 = 7;
    if resource != RLIMIT_NOFILE {
        return Ok(0);
    }

    if pid == 0 {
        let task = current_task().unwrap();
        let mut inner = task.inner_lock();
        let token = inner.user_token();
        let fd_table = &mut inner.fd_table;
        if !old_limit.is_null() {
            // 说明是get
            let limit = translated_refmut(token, old_limit);
            limit.rlim_cur = fd_table.get_soft_limit();
            limit.rlim_max = fd_table.get_hard_limit();
        }
        if !new_limit.is_null() {
            // 说明是set
            let limit: &RLimit = translated_ref(token, new_limit);
            fd_table.set_limit(limit.rlim_cur, limit.rlim_max);
        }
    } else {
        unimplemented!("未实现的非0 pid");
    }

    Ok(0)
}

pub fn sys_readlinkat(
    _dirfd: isize,
    _path: *const u8,
    _buf: *const u8,
    _bufsiz: usize,
) -> SyscallRet {
    Ok(0)
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
    _flags: u32,
) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    let oldpath = translated_str(token, oldpath);
    let newpath = translated_str(token, newpath);

    let old_abs_path = inner.get_abs_path(olddirfd, &oldpath)?;
    let osfile = open(&old_abs_path, OpenFlags::O_RDWR)?.file()?;
    let new_abs_path = inner.get_abs_path(newdirfd, &newpath)?;
    osfile.inode.rename(&old_abs_path, &new_abs_path)
}

pub fn sys_copy_file_range(
    infd: usize,
    off_in: usize,
    outfd: usize,
    off_out: usize,
    count: usize,
    flags: u32,
) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!("[sys_copy_file_range] infd is {}, off_in is {}, outfd is {}, off_out is {},count is {}, flags is {}", infd, off_in, outfd, off_out, count, flags);

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

    drop(inner);
    drop(task);

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
    let inbuffer = UserBuffer::new(inbufv);

    //读数据
    let readcount;
    if off_in == 0 {
        readcount = infile.read(inbuffer)?;
    } else {
        let offset = *translated_ref(token, off_in as *const isize);
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        let in_offset = infile.lseek(0, SEEK_CUR)?;
        infile.lseek(offset, SEEK_SET);
        readcount = infile.read(inbuffer)?;
        infile.lseek(in_offset as isize, SEEK_SET);
    }

    if readcount == 0 {
        return Ok(0);
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
    let outbuffer = UserBuffer::new(outbufv);

    //写数据
    let writecount;
    if off_out == 0 {
        writecount = outfile.write(outbuffer)?;
    } else {
        let offset = *translated_ref(token, off_out as *const isize);
        if offset < 0 {
            return Err(SysErrNo::EINVAL);
        }
        let out_offset = outfile.lseek(0, SEEK_CUR)?;
        outfile.lseek(offset, SEEK_SET);
        writecount = outfile.write(outbuffer)?;
        outfile.lseek(out_offset as isize, SEEK_SET);
    }
    //如果系统调用执行成功，*off_in和*off_out将会增加复制的长度
    if off_in != 0 {
        *translated_refmut(token, off_in as *mut isize) += writecount as isize;
    }
    if off_out != 0 {
        *translated_refmut(token, off_out as *mut isize) += writecount as isize;
    }

    Ok(writecount)
}

pub fn sys_getrandom(buf_ptr: *const u8, buflen: usize, _flags: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    if buf_ptr.is_null() {
        return Err(SysErrNo::EINVAL);
    }

    // if let Some(random_device) = open_device_file("/dev/random") {
    //     let ret = random_device.read(UserBuffer::new(
    //         translated_byte_buffer(token, buf_ptr, buflen).unwrap(),
    //     ))?;
    //     Ok(ret)
    // } else {
    //     Err(SysErrNo::ENOENT)
    // }

    open_device_file("/dev/random")?.read(UserBuffer::new(
        translated_byte_buffer(token, buf_ptr, buflen).unwrap(),
    ))
}

pub fn sys_ppoll(fds_ptr: usize, nfds: usize, tmo_p: usize, mask: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!(
        "[sys_ppoll] fds_ptr is {}, nfds is {}, tmo_p is {}, mask is {}",
        fds_ptr, nfds, tmo_p, mask
    );

    if fds_ptr == 0 {
        return Err(SysErrNo::EINVAL);
    }

    let mut fds = Vec::new();
    let ptr = fds_ptr as *mut PollFd;
    for i in 0..nfds {
        fds.push(*translated_refmut(token, unsafe { ptr.add(i) } as *mut PollFd));
    }

    let waittime = if tmo_p == 0 {
        //为0则永远等待直到完成
        -1
    } else {
        let timespec = translated_ref(token, tmo_p as *const Timespec);
        (timespec.tv_sec * 1000000000 + timespec.tv_nsec) as isize
    };
    if waittime == 0 {
        return Ok(0);
    }

    let begin = get_time_ms() * 1000000;

    //由于每次循环结束需要让出cpu，因此需要在每次循环时重新获得锁
    drop(inner);
    drop(task);

    loop {
        let task = current_task().unwrap();
        let inner = task.inner_lock();
        let mut resnum = 0;
        for i in 0..nfds {
            if fds[i].fd < 0 {
                fds[i].revents = PollEvents::empty();
                continue;
            }
            if let Some(file) = &inner.fd_table.try_get_file(fds[i].fd as usize) {
                let file: Arc<dyn File> = match file {
                    FileClass::File(f) => f.clone(),
                    FileClass::Abs(f) => f.clone(),
                };
                let res = file.poll(fds[i].events);
                if !res.is_empty() {
                    resnum += 1;
                }
                fds[i].revents = res;
            } else {
                fds[i].revents = PollEvents::INVAL;
            }
        }
        //有响应了就可以返回
        if resnum > 0 {
            let resptr = fds_ptr as *mut PollFd;
            for i in 0..nfds {
                *translated_refmut(token, unsafe { resptr.add(i) } as *mut PollFd) = fds[i];
            }
            return Ok(resnum);
        }
        //或者时间到了也可以返回
        if waittime > 0 && get_time_ms() * 1000000 - begin >= waittime as usize {
            return Ok(0);
        }
        drop(inner);
        drop(task);
        suspend_current_and_run_next();
    }
}

pub fn sys_pselect6(
    nfds: usize,
    readfds: usize,
    writefds: usize,
    exceptfds: usize,
    timeout: usize,
    sigmask: usize,
) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    debug!("[sys_pselect6] nfds is {}, readfds is {}, writefds is {}, exceptfds is {}, timeout is {}, sigmask is {}",nfds,readfds,writefds,exceptfds,timeout,sigmask);

    let old_mask = inner.sig_pending.get_ref().blocked;
    if sigmask != 0 {
        inner.sig_pending.get_mut().blocked = *translated_ref(token, sigmask as *const SigSet);
    }

    let nfds = min(nfds, FD_LIMIT);

    let mut using_readfds = if readfds != 0 {
        *translated_refmut(token, readfds as *mut usize)
    } else {
        0
    };
    let mut using_writefds = if writefds != 0 {
        *translated_refmut(token, writefds as *mut usize)
    } else {
        0
    };
    let mut using_exceptfds = if exceptfds != 0 {
        *translated_refmut(token, exceptfds as *mut usize)
    } else {
        0
    };

    // pselect 不会更新 timeout 的值，而 select 会
    let waittime = if timeout == 0 {
        //为0则永远等待直到完成
        -1
    } else {
        let timespec = translated_ref(token, timeout as *const Timespec);
        (timespec.tv_sec * 1000000000 + timespec.tv_nsec) as isize
    };
    if waittime == 0 {
        if sigmask != 0 {
            inner.sig_pending.get_mut().blocked = old_mask;
        }
        return Ok(0);
    }

    let begin = get_time_ms() * 1000000;

    //由于每次循环结束需要让出cpu，因此需要在每次循环时重新获得锁
    drop(inner);
    drop(task);

    loop {
        let task = current_task().unwrap();
        let inner = task.inner_lock();
        let mut num = 0;

        // 如果设置了监视是否可读的 fd
        if using_readfds != 0 {
            for i in 0..nfds {
                if using_readfds & (1 << i) != 0 {
                    if let Some(file) = &inner.fd_table.try_get_file(i) {
                        let file: Arc<dyn File> = match file {
                            FileClass::File(f) => f.clone(),
                            FileClass::Abs(f) => f.clone(),
                        };
                        let event = file.poll(PollEvents::IN);
                        if event.contains(PollEvents::IN) {
                            using_readfds |= 1 << i;
                            num += 1;
                        } else {
                            using_readfds &= !(1 << i);
                        }
                    } else {
                        using_readfds &= !(1 << i);
                    }
                } else {
                    using_readfds &= !(1 << i);
                }
            }
        }

        // 如果设置了监视是否可写的 fd
        if using_writefds != 0 {
            for i in 0..nfds {
                if using_writefds & (1 << i) != 0 {
                    if let Some(file) = &inner.fd_table.try_get_file(i) {
                        let file: Arc<dyn File> = match file {
                            FileClass::File(f) => f.clone(),
                            FileClass::Abs(f) => f.clone(),
                        };
                        let event = file.poll(PollEvents::OUT);
                        if event.contains(PollEvents::OUT) {
                            using_writefds |= 1 << i;
                            num += 1;
                        } else {
                            using_writefds &= !(1 << i);
                        }
                    } else {
                        using_writefds &= !(1 << i);
                    }
                } else {
                    using_writefds &= !(1 << i);
                }
            }
        }

        // 如果设置了监视异常的 fd
        if using_exceptfds != 0 {
            for i in 0..nfds {
                if using_exceptfds & (1 << i) != 0 {
                    if let Some(file) = &inner.fd_table.try_get_file(i) {
                        let file: Arc<dyn File> = match file {
                            FileClass::File(f) => f.clone(),
                            FileClass::Abs(f) => f.clone(),
                        };
                        let event = file.poll(PollEvents::ERR);
                        if event.contains(PollEvents::ERR) {
                            using_exceptfds |= 1 << i;
                            num += 1;
                        } else {
                            using_exceptfds &= !(1 << i);
                        }
                    } else {
                        using_exceptfds &= !(1 << i);
                    }
                } else {
                    using_exceptfds &= !(1 << i);
                }
            }
        }

        //如果有响应了则返回
        if num > 0 {
            if using_readfds != 0 {
                *translated_refmut(token, readfds as *mut usize) = using_readfds;
            }
            if using_writefds != 0 {
                *translated_refmut(token, writefds as *mut usize) = using_writefds;
            }
            if using_exceptfds != 0 {
                *translated_refmut(token, exceptfds as *mut usize) = using_exceptfds;
            }
            if sigmask != 0 {
                inner.sig_pending.get_mut().blocked = old_mask;
            }
            return Ok(num);
        }

        //或者时间到了也可以返回
        if waittime > 0 && get_time_ms() * 1000000 - begin >= waittime as usize {
            if sigmask != 0 {
                inner.sig_pending.get_mut().blocked = old_mask;
            }
            return Ok(0);
        }
        drop(inner);
        drop(task);
        suspend_current_and_run_next();
    }
}
