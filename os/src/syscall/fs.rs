//! File and filesystem-related syscalls
use crate::console::print;
#[cfg(feature = "fat32_fs")]
use crate::fs::{is_abs_path, remove_vfile_idx};
use crate::fs::{make_pipe, open, open_file, Dirent, File, FileClass, Kstat, OpenFlags, MNT_TABLE};
use crate::mm::{translated_byte_buffer, translated_refmut, translated_str, UserBuffer};
use crate::task::{current_task, current_user_token};
use alloc::string::String;
use alloc::sync::Arc;
use log::info;

pub const AT_FDCWD: isize = -100;
pub const FD_LIMIT: usize = 128;
pub const AT_REMOVEDIR: u32 = 0x200;

pub fn sys_write(fd: usize, buf: *const u8, len: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    assert!(
        token == inner.user_token(),
        "token={:#x},user_token={:#x}",
        token,
        inner.user_token()
    );
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if let Some(file) = &inner.fd_table[fd] {
        let file: Arc<dyn File + Send + Sync> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.writable() {
            return -1;
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        // info!("fd={}", fd);
        file.write(UserBuffer::new(translated_byte_buffer(token, buf, len))) as isize
    } else {
        -1
    }
}

pub fn sys_read(fd: usize, buf: *const u8, len: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if let Some(file) = &inner.fd_table[fd] {
        let file: Arc<dyn File + Send + Sync> = match file {
            FileClass::File(f) => f.clone(),
            FileClass::Abs(f) => f.clone(),
        };
        if !file.readable() {
            return -1;
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        drop(task);
        file.read(UserBuffer::new(translated_byte_buffer(token, buf, len))) as isize
    } else {
        -1
    }
}

#[cfg(feature = "fat32_fs")]
pub fn sys_openat(fd: isize, path: *const u8, flags: u32, _mode: usize) -> isize {
    if path as usize == 0 {
        return -1;
    }
    let token = current_user_token().unwrap();
    let mut path = translated_str(token, path);

    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    let flags = OpenFlags::from_bits(flags).unwrap();
    let ret;

    if fd == AT_FDCWD && !is_abs_path(&path) {
        ret = if let Some(inode) = open(&inner.current_path, path.as_str(), flags) {
            let new_fd = inner.alloc_fd();
            inner.fd_table[new_fd] = Some(FileClass::File(inode));
            new_fd as isize
        } else {
            -1
        }
    } else {
        ret = if let Some(inode) = open_file(path.as_str(), flags) {
            let new_fd = inner.alloc_fd();
            inner.fd_table[new_fd] = Some(FileClass::File(inode));
            new_fd as isize
        } else {
            -1
        }
    }

    ret
}

#[cfg(feature = "simple_fs")]
pub fn sys_openat(fd: isize, path: *const u8, flags: u32, _mode: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let path = translated_str(token, path);
    let path = String::from(path.trim_end_matches('\n'));
    let mut inner = task.inner_lock();
    let flags = OpenFlags::from_bits(flags).unwrap();
    //若为绝对路径
    if path.starts_with('/') {
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), flags) {
            let mut inner = task.inner_lock();
            let fd_new = inner.alloc_fd();
            inner.fd_table[fd_new] = Some(FileClass::File(inode));
            fd_new as isize
        } else {
            -1
        }
    } else {
        //若fd为当前目录
        if fd == AT_FDCWD {
            let now_path: String = inner.current_path.clone();
            drop(inner);
            if let Some(inode) = open(now_path.as_str(), path.as_str(), flags) {
                let mut inner = task.inner_lock();
                let fd_new = inner.alloc_fd();
                inner.fd_table[fd_new] = Some(FileClass::File(inode));
                fd_new as isize
            } else {
                -1
            }
        } else {
            //其他情况
            let fd = fd as usize;
            if fd >= FD_LIMIT {
                return -1;
            }
            if let Some(FileClass::File(file)) = &inner.fd_table[fd] {
                let filename: String = file.name().clone();
                drop(inner);
                if let Some(inode) = open(filename.as_str(), path.as_str(), flags) {
                    let mut inner = task.inner_lock();
                    let fd = inner.alloc_fd();
                    inner.fd_table[fd] = Some(FileClass::File(inode));
                    fd as isize
                } else {
                    -1
                }
            } else {
                // fd 对应文件为空
                -1
            }
        }
    }
}

pub fn sys_close(fd: usize) -> isize {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }
    inner.fd_table[fd].take();
    0
}

pub fn sys_getcwd(buf: *const u8, size: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size));
    buffer.write(inner.current_path.as_bytes());
    buf as isize
}

pub fn sys_dup(fd: usize) -> isize {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }

    let inode = inner.fd_table[fd].as_ref().unwrap().clone();
    let fd_new = inner.alloc_fd();
    inner.fd_table[fd_new] = Some(inode);
    fd_new as isize
}

pub fn sys_dup3(old: usize, new: usize) -> isize {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    if old >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[old].is_none() {
        return -1;
    }
    if new >= FD_LIMIT {
        return -1;
    }

    if (new >= inner.fd_table.len()) {
        for i in inner.fd_table.len()..(new + 1) {
            inner.fd_table.push(None);
        }
    }

    let inode = inner.fd_table[old].as_ref().unwrap().clone();
    inner.fd_table[new] = Some(inode);
    new as isize
}

pub fn sys_chdir(path: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    let path = translated_str(token, path);
    if path.starts_with('/') {
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            let mut inner = task.inner_lock();
            inner.current_path = path.clone();
            return 0;
        } else {
            -1
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
            return 0;
        } else {
            -1
        }
    }
}

#[cfg(feature = "fat32_fs")]
pub fn sys_mkdirat(dirfd: isize, path: *const u8, _mode: usize) -> isize {
    let process = current_task().unwrap();
    let token = current_user_token().unwrap();
    let path = translated_str(token, path);

    let cwd = if dirfd == AT_FDCWD && !is_abs_path(&path) {
        process.inner_lock().current_path.clone()
    } else {
        String::from("/")
    };

    let ret = {
        if let Some(_) = open(
            cwd.as_str(),
            path.as_str(),
            OpenFlags::O_DIRECTROY | OpenFlags::O_RDWR,
        ) {
            -1
        } else {
            // info!("create dir,path = {}", path.as_str());
            if let Some(_) = open(
                cwd.as_str(),
                path.as_str(),
                OpenFlags::O_DIRECTROY | OpenFlags::O_RDWR | OpenFlags::O_CREATE,
            ) {
                0
            } else {
                -1
            }
        }
    };

    ret
}

#[cfg(feature = "simple_fs")]
pub fn sys_mkdirat(dirfd: isize, path: *const u8, _mode: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let path = translated_str(token, path);
    //若为绝对路径
    if path.starts_with('/') {
        drop(inner);
        if let Some(_) = open_file(path.as_str(), OpenFlags::O_DIRECTROY) {
            0
        } else {
            -1
        }
    } else {
        //若fd为当前目录
        if dirfd == AT_FDCWD {
            let now_path: String = inner.current_path.clone();
            drop(inner);
            if let Some(_) = open(now_path.as_str(), path.as_str(), OpenFlags::O_DIRECTROY) {
                0
            } else {
                -1
            }
        } else {
            //其他情况
            let dirfd = dirfd as usize;

            if dirfd >= inner.fd_table.len() {
                return -1;
            }
            if inner.fd_table[dirfd].is_none() {
                return -1;
            }

            if let Some(FileClass::File(file)) = &inner.fd_table[dirfd] {
                let filename: String = file.name().clone();
                drop(inner);
                if let Some(_) = open(filename.as_str(), path.as_str(), OpenFlags::O_DIRECTROY) {
                    0
                } else {
                    -1
                }
            } else {
                // fd 对应文件为空
                -1
            }
        }
    }
}

pub fn sys_getdents64(fd: usize, buf: *const u8, len: usize) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, len));

    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }

    if let Some(f) = &inner.fd_table[fd] {
        let file;
        if let FileClass::File(t) = f {
            file = t.clone();
        } else {
            return -1;
        }
        if !file.readable() {
            return -1;
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);

        let mut all_len: usize = 0;
        let mut dirent = Dirent::new();
        let dirent_size = core::mem::size_of::<Dirent>();
        loop {
            if len < dirent_size + all_len {
                return all_len as isize;
            }
            let readsize: isize = file.dirent(&mut dirent);
            if readsize < 0 {
                return all_len as isize;
            }
            buffer.write_at(all_len, dirent.as_bytes());
            all_len += dirent_size;
        }
    } else {
        -1
    }
}

pub fn sys_linkat(
    oldfd: isize,
    oldpath: *const u8,
    newfd: isize,
    newpath: *const u8,
    _flags: u32,
) -> isize {
    todo!();
}
#[cfg(feature = "fat32_fs")]
pub fn sys_unlinkat(dirfd: isize, path: *const u8, flags: u32) -> isize {
    use alloc::string::ToString;

    let process = current_task().unwrap();
    let token = current_user_token().unwrap();
    let inner = process.inner_lock();
    let path = translated_str(token, path);
    let mut base_path = inner.current_path.as_str();
    // 如果path是绝对路径，则dirfd被忽略
    if is_abs_path(&path) {
        base_path = "/";
    } else if dirfd != AT_FDCWD {
        if let Some(FileClass::File(osfile)) = &inner.fd_table[dirfd as usize] {
            if let Some(osfile) = osfile.find(path.as_str(), OpenFlags::empty()) {
                osfile.remove();
                return 0;
            }
        }
        return -1;
    }
    if let Some(osfile) = open(base_path, path.as_str(), OpenFlags::empty()) {
        let abs_path = if is_abs_path(&path) {
            path
        } else {
            base_path.to_string() + &path
        };
        remove_vfile_idx(&abs_path);
        osfile.remove();
        return 0;
    }
    return -1;
}

#[cfg(feature = "simple_fs")]
pub fn sys_unlinkat(dirfd: isize, path: *const u8, flags: u32) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let path = translated_str(token, path);
    let path = String::from(path.trim_end_matches('\n'));

    if path.starts_with('/') {
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            //断开链接(讨论flags)
            if flags == AT_REMOVEDIR {
                inode.delete();
                return 0;
            } else {
                if inode.is_dir() {
                    return -1;
                } else {
                    inode.delete();
                    return 0;
                }
            }
        } else {
            -1
        }
    } else {
        if dirfd == AT_FDCWD {
            let now_path: String = inner.current_path.clone();
            drop(inner);
            if let Some(inode) = open(now_path.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
                //断开链接(讨论flags)
                if flags == AT_REMOVEDIR {
                    inode.delete();
                    return 0;
                } else {
                    if inode.is_dir() {
                        return -1;
                    } else {
                        inode.delete();
                        return 0;
                    }
                }
            } else {
                -1
            }
        } else {
            let dirfd = dirfd as usize;
            if dirfd >= inner.fd_table.len() {
                return -1;
            }
            if inner.fd_table[dirfd].is_none() {
                return -1;
            }

            if let Some(FileClass::File(file)) = &inner.fd_table[dirfd] {
                let filename: String = file.name().clone();
                drop(inner);
                if let Some(inode) = open(filename.as_str(), path.as_str(), OpenFlags::O_RDONLY) {
                    //断开链接(讨论flags)
                    if flags == AT_REMOVEDIR {
                        inode.delete();
                        return 0;
                    } else {
                        if inode.is_dir() {
                            return -1;
                        } else {
                            inode.delete();
                            return 0;
                        }
                    }
                } else {
                    -1
                }
            } else {
                -1
            }
        }
    }
}

pub fn sys_umount2(special: *const u8, flags: u32) -> isize {
    let token = current_user_token().unwrap();
    let special = translated_str(token, special);

    MNT_TABLE.lock().umount(special, flags)
}

pub fn sys_mount(
    special: *const u8,
    dir: *const u8,
    ftype: *const u8,
    flags: u32,
    data: *const u8,
) -> isize {
    let token = current_user_token().unwrap();
    let special = translated_str(token, special);
    let dir = translated_str(token, dir);
    let ftype = translated_str(token, ftype);
    if !data.is_null() {
        let data = translated_str(token, data);
        MNT_TABLE.lock().mount(special, dir, ftype, flags, data)
    } else {
        MNT_TABLE
            .lock()
            .mount(special, dir, ftype, flags, String::from(""))
    }
}

pub fn sys_fstat(fd: usize, kst: *const u8) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let mut kst = UserBuffer::new(translated_byte_buffer(
        token,
        kst,
        core::mem::size_of::<Kstat>(),
    ));

    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }

    if let Some(FileClass::File(file)) = &inner.fd_table[fd] {
        let mut kstat = Kstat::new();
        let file = file.clone();
        drop(inner);
        file.fstat(&mut kstat);
        kst.write(kstat.as_bytes());
        0
    } else {
        -1
    }
}

pub fn sys_pipe2(fd: *mut u32) -> isize {
    let token = current_user_token().unwrap();
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();

    let read_fd = inner.alloc_fd();
    let (read_pipe, write_pipe) = make_pipe();
    inner.fd_table[read_fd] = Some(FileClass::Abs(read_pipe));
    let write_fd = inner.alloc_fd();
    inner.fd_table[write_fd] = Some(FileClass::Abs(write_pipe));
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    0
}
