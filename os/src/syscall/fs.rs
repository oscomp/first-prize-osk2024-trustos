//! File and filesystem-related syscalls
use crate::fs::{make_pipe, open, open_file, Dirent, Kstat, OpenFlags, MNT_TABLE};
use crate::mm::{translated_byte_buffer, translated_str, UserBuffer,translated_refmut};
use crate::task::{current_task, current_user_token};
use alloc::string::String;

pub const AT_FDCWD:isize = -100;
pub const FD_LIMIT: usize = 128;
pub const AT_REMOVEDIR: u32 = 0x200;

pub fn sys_write(fd: usize, buf: *const u8, len: usize) -> isize {
    //println!("start sys_write!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let inner = task.inner_exclusive_access();
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if let Some(file) = &inner.fd_table[fd] {
        if !file.writable() {
            return -1;
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        file.write(UserBuffer::new(translated_byte_buffer(token, buf, len))) as isize
    } else {
        -1
    }
}

pub fn sys_read(fd: usize, buf: *const u8, len: usize) -> isize {
    //println!("start sys_read!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let inner = task.inner_exclusive_access();
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if let Some(file) = &inner.fd_table[fd] {
        let file = file.clone();
        if !file.readable() {
            return -1;
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);
        file.read(UserBuffer::new(translated_byte_buffer(token, buf, len))) as isize
    } else {
        -1
    }
}

pub fn sys_openat(fd:isize,path: *const u8, flags: u32,_mode:usize) -> isize {
    println!("start sys_openat!");
    let task = current_task().unwrap();
    let token = current_user_token();
    let path = translated_str(token, path);
    let mut inner = task.inner_exclusive_access();
    let flags=OpenFlags::from_bits(flags).unwrap();
    //若为绝对路径
    if path.starts_with('/'){
        if let Some(inode) = open_file(path.as_str(), flags) {
            let fd_new = inner.alloc_fd();
            inner.fd_table[fd_new] = Some(inode);
            fd_new as isize
        } else {
            -1
        }
    } else{
        //若fd为当前目录
        if fd == AT_FDCWD {
            if let Some(inode) = open(inner.current_path.as_str(),path.as_str(),flags){
                let fd_new = inner.alloc_fd();
                inner.fd_table[fd_new] = Some(inode);
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
            if let Some(file) = &inner.fd_table[fd] {
                if let Some(inode) = open(file.get_name().as_str(), path.as_str(), flags) {
                    let fd = inner.alloc_fd();
                    inner.fd_table[fd] = Some(inode);
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
    println!("start sys_close!");
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }
    inner.fd_table[fd].take();
    0
}

pub fn sys_getcwd(buf: *const u8,size: usize) ->isize {
    println!("start sys_getcwd!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();

    let buffer = UserBuffer::new(translated_byte_buffer(token, buf, size));
    //buffer.write();
    0
}

pub fn sys_dup(fd: usize) -> isize {
    println!("start sys_dup!");
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();

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

pub fn sys_dup3(old:usize,new: usize) -> isize {
    println!("start sys_dup3!");
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();

    if old >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[old].is_none() {
        return -1;
    }
    if new >= FD_LIMIT {
        return -1;
    }

    if(new>=inner.fd_table.len()){
        for i in inner.fd_table.len()..(new+1){
            inner.fd_table.push(None);
        }
    }

    let inode = inner.fd_table[old].as_ref().unwrap().clone();
    inner.fd_table[new] = Some(inode);
    new as isize

}

pub fn sys_chdir(path: *const u8) -> isize {
    println!("start sys_chdir!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();

    let path = translated_str(token, path);
    if path.starts_with('/'){
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            inner.current_path=path.clone();
            return 0;
        } else {
            -1
        }
    } else {
        if let Some(inode) = open(inner.current_path.as_str(),path.as_str(),OpenFlags::O_RDONLY){
            if inode.name() == "/"{
                inner.current_path=alloc::format!{"/{}",&path[..]};
            } else {
                inner.current_path=alloc::format!{"{}/{}",&inner.current_path[..],&path[..]};
            }
            return 0;
        } else {
            -1
        }
    }
    // let token = current_user_token();
    // let task = current_task().unwrap();
    // let mut inner = task.inner_exclusive_access();

    // let path = translated_str(token, path);
    // if let Some(new_cwd) = chdir(inner.current_path.as_str(),&path){
    //     inner.current_path = new_cwd;
    //     0
    // } else {
    //     -1
    // }
}

pub fn sys_mkdirat(dirfd:isize,path: *const u8,_mode:usize) -> isize {
    println!("start sys_mkdirat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let path = translated_str(token, path);
    //若为绝对路径
    if path.starts_with('/'){
        if let Some(_) = open_file(path.as_str(), OpenFlags::O_DIRECTROY) {
            0
        } else {
            -1
        }
    } else{
        //若fd为当前目录
        if dirfd == AT_FDCWD {
            if let Some(_) = open(inner.current_path.as_str(),path.as_str(),OpenFlags::O_DIRECTROY){
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
            if inner.fd_table[dirfd].is_none(){
                return -1
            }

            if let Some(file) = &inner.fd_table[dirfd] {
                if let Some(_) = open(file.get_name().as_str(), path.as_str(), OpenFlags::O_DIRECTROY) {
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

pub fn sys_getdents64(fd:usize,buf: *const u8,len:usize) -> isize {
    println!("start sys_getdents64!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    
    let buffer = UserBuffer::new(translated_byte_buffer(token, buf,len));

    if fd >= inner.fd_table.len(){
        return -1;
    }
    if inner.fd_table[fd].is_none(){
        return -1;
    }

    if let Some(file) =&inner.fd_table[fd]{
        let file = file.clone();
        if !file.readable() {
            return -1;
        }
        // release current task TCB manually to avoid multi-borrow
        drop(inner);

        let mut dirent = Dirent::new();
        let dirent_size = core::mem::size_of::<Dirent>();
        let mut all_len:isize= 0;
        loop{
            let readsize:isize=file.get_dirent(&mut dirent);
            if readsize < 0 {
                return all_len;
            }
            all_len += readsize;
            //buffer.write();
            if len < dirent_size+(all_len as usize) {
                return all_len;
            }
        }
    } else{
        -1
    }
}

pub fn sys_linkat(oldfd:isize,oldpath: *const u8,newfd:isize,newpath: *const u8,_flags:u32) -> isize {
    println!("start sys_linkat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let oldpath = translated_str(token, oldpath);
    let newpath = translated_str(token, newpath);
    
    if oldpath.starts_with('/'){
        if let Some(oldinode) = open_file(oldpath.as_str(), OpenFlags::O_RDONLY){
            if newpath.starts_with('/'){
                if let Some(newinode) = open_file(newpath.as_str(), OpenFlags::O_RDONLY) {
                    //进行链接
                    0
                } else {
                    -1
                }
            } else {
                if newfd == AT_FDCWD {
                    if let Some(newinode) = open(inner.current_path.as_str(),newpath.as_str(),OpenFlags::O_RDONLY) {
                        //进行链接
                        0
                    } else {
                        -1
                    }
                } else {
                    let newfd = newfd as usize;
                
                    if newfd >= inner.fd_table.len() {
                        return -1;
                    }
                    if inner.fd_table[newfd].is_none() {
                        return -1;
                    }
                
                    if let Some(newfile) = &inner.fd_table[newfd] {
                        if let Some(newinode) = open(newfile.get_name().as_str(), newpath.as_str(), OpenFlags::O_RDONLY) {
                            //进行链接
                            0
                        } else {
                            -1
                        }
                    } else {
                        -1
                    }
                }
            }
        } else {
            -1
        }
    } else {
        if oldfd == AT_FDCWD {
            if let Some(oldinode) = open(inner.current_path.as_str(),oldpath.as_str(),OpenFlags::O_RDONLY) {
                if newpath.starts_with('/'){
                    if let Some(newinode) = open_file(newpath.as_str(), OpenFlags::O_RDONLY) {
                        //进行链接
                        0
                    } else {
                        -1
                    }
                } else {
                    if newfd == AT_FDCWD {
                        if let Some(newinode) = open(inner.current_path.as_str(),newpath.as_str(),OpenFlags::O_RDONLY) {
                            //进行链接
                            0
                        } else {
                            -1
                        }
                    } else {
                        let newfd = newfd as usize;
                    
                        if newfd >= inner.fd_table.len() {
                            return -1;
                        }
                        if inner.fd_table[newfd].is_none() {
                            return -1;
                        }
                    
                        if let Some(newfile) = &inner.fd_table[newfd] {
                            if let Some(newinode) = open(newfile.get_name().as_str(), newpath.as_str(), OpenFlags::O_RDONLY) {
                                //进行链接
                                0
                            } else {
                                -1
                            }
                        } else {
                            -1
                        }
                    }
                }
            } else {
                -1
            }
        } else {
            let oldfd=oldfd as usize;

            if oldfd >= inner.fd_table.len() {
                return -1;
            }
            if inner.fd_table[oldfd].is_none() {
                return -1;
            }
            
            if let Some(oldfile) = &inner.fd_table[oldfd] {
                if let Some(oldinode) = open(oldfile.get_name().as_str(), oldpath.as_str(), OpenFlags::O_RDONLY) {
                    if newpath.starts_with('/'){
                        if let Some(newinode) = open_file(newpath.as_str(), OpenFlags::O_RDONLY) {
                            //进行链接
                            0
                        } else {
                            -1
                        }
                    } else {
                        if newfd == AT_FDCWD {
                            if let Some(newinode) = open(inner.current_path.as_str(),newpath.as_str(),OpenFlags::O_RDONLY) {
                                //进行链接
                                0
                            } else {
                                -1
                            }
                        } else {
                            let newfd = newfd as usize;
                        
                            if newfd >= inner.fd_table.len() {
                                return -1;
                            }
                            if inner.fd_table[newfd].is_none() {
                                return -1;
                            }
                        
                            if let Some(newfile) = &inner.fd_table[newfd] {
                                if let Some(newinode) = open(newfile.get_name().as_str(), newpath.as_str(), OpenFlags::O_RDONLY) {
                                    //进行链接
                                    0
                                } else {
                                    -1
                                }
                            } else {
                                -1
                            }
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

pub fn sys_unlinkat(dirfd:isize,path: *const u8,flags:u32) -> isize {
    println!("start sys_unlinkat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let path = translated_str(token, path);
    
    if path.starts_with('/'){
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
            if let Some(inode) = open(inner.current_path.as_str(),path.as_str(),OpenFlags::O_RDONLY) {
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
                0
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
        
            if let Some(file) = &inner.fd_table[dirfd] {
                if let Some(inode) = open(file.get_name().as_str(), path.as_str(), OpenFlags::O_RDONLY) {
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
                    0
                } else {
                    -1
                }
            } else {
                -1
            }
        }
    }

    
}

pub fn sys_umount2(special: *const u8, flags:u32) -> isize {
    println!("start sys_umount2!");
    let token = current_user_token();
    let special = translated_str(token, special);

    MNT_TABLE.lock().umount(special, flags)
}

pub fn sys_mount(special: *const u8, dir: *const u8, ftype: *const u8, flags:u32 ,data:*const u8) -> isize {
    println!("start sys_mount!");
    let token = current_user_token();
    let special = translated_str(token, special);
    let dir = translated_str(token, dir);
    let ftype = translated_str(token, ftype);
    if !data.is_null() {
        let data = translated_str(token, data);
        MNT_TABLE.lock().mount(special, dir, ftype, flags,data)
    } else {
        MNT_TABLE.lock().mount(special, dir, ftype, flags,String::from(""))
    }
}

pub fn sys_fstat(fd:usize, kst:*const u8) -> isize {
    println!("start sys_fstat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let kst = UserBuffer::new(translated_byte_buffer(token, kst,core::mem::size_of::<Kstat>()));

    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }

    if let Some(file) = &inner.fd_table[fd] {
        let mut kstat = Kstat::new();
        file.get_fstat(&mut kstat);
        //kst.write();
        0
    } else {
        -1
    }
}

pub fn sys_pipe2(fd:*mut u32) -> isize {
    println!("start pipe2!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();

    let read_fd = inner.alloc_fd();
    let write_fd = inner.alloc_fd();
    let (read_pipe,write_pipe) = make_pipe();
    inner.fd_table[read_fd] = Some(read_pipe);
    inner.fd_table[write_fd] = Some(write_pipe);
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    0
}