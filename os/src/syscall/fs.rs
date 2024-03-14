//! File and filesystem-related syscalls
use crate::console::print;
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
    let token = current_user_token();
    let task = current_task().unwrap();
    let path = translated_str(token, path);
    let path = String::from(path.trim_end_matches('\n'));
    //println!("{}space",path);
    let mut inner = task.inner_exclusive_access();
    let flags=OpenFlags::from_bits(flags).unwrap();
    //println!("ready to open:{},{}",fd,path);
    //若为绝对路径
    if path.starts_with('/'){
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), flags) {
            let mut inner = task.inner_exclusive_access();
            let fd_new = inner.alloc_fd();
            inner.fd_table[fd_new] = Some(inode);
            fd_new as isize
        } else {
            -1
        }
    } else{
        //若fd为当前目录
        if fd == AT_FDCWD {
            let now_path:String=inner.current_path.clone();
            drop(inner);
            if let Some(inode) = open(now_path.as_str(),path.as_str(),flags){
                let mut inner = task.inner_exclusive_access();
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
                let filename:String = file.get_name().clone();
                drop(inner);
                if let Some(inode) = open(filename.as_str(), path.as_str(), flags) {
                    let mut inner = task.inner_exclusive_access();
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
    println!("close fd : {}",fd);
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

    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf, size));
    buffer.write(inner.current_path.as_bytes());
    buf as isize
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
    //println!("{}",path);
    if path.starts_with('/'){
        drop(inner);
        if let Some(inode) = open_file(path.as_str(), OpenFlags::O_RDONLY) {
            let mut inner = task.inner_exclusive_access();
            inner.current_path=path.clone();
            return 0;
        } else {
            -1
        }
    } else {
        let now_path:String = inner.current_path.clone();
        //println!("nowpath:{}",now_path);
        drop(inner);
        if let Some(inode) = open(now_path.as_str(),path.as_str(),OpenFlags::O_RDONLY){
            let mut inner = task.inner_exclusive_access();
            if now_path == "/"{
                inner.current_path=alloc::format!{"/{}",&path[..]};
            } else {
                inner.current_path=alloc::format!{"{}/{}",&inner.current_path[..],&path[..]};
            }
            return 0;
        } else {
            -1
        }
    }
}

pub fn sys_mkdirat(dirfd:isize,path: *const u8,_mode:usize) -> isize {
    println!("start sys_mkdirat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let path = translated_str(token, path);
    //若为绝对路径
    if path.starts_with('/'){
        drop(inner);
        if let Some(_) = open_file(path.as_str(), OpenFlags::O_DIRECTROY) {
            0
        } else {
            -1
        }
    } else{
        //若fd为当前目录
        if dirfd == AT_FDCWD {
            let now_path:String = inner.current_path.clone();
            drop(inner);
            if let Some(_) = open(now_path.as_str(),path.as_str(),OpenFlags::O_DIRECTROY){
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
                let filename:String = file.get_name().clone();
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

pub fn sys_getdents64(fd:usize,buf: *const u8,len:usize) -> isize {
    println!("start sys_getdents64!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    
    let mut buffer = UserBuffer::new(translated_byte_buffer(token, buf,len));

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

        let mut all_len:usize= 0;
        let mut dirent = Dirent::new();
        let dirent_size = core::mem::size_of::<Dirent>();
        //println!("dirent_size:{},len:{}",dirent_size,len);
        loop{
            //println!("alllen:{}",all_len);
            if len < dirent_size+all_len {
                return all_len as isize;
            }
            let readsize:isize=file.get_dirent(&mut dirent);
            if readsize < 0 {
                return all_len as isize;
            }
            //println!("readsize:{},all_len:{}",readsize,all_len);
            buffer.write_at(all_len,dirent.as_bytes());
            all_len += dirent_size;
        }
    } else{
        -1
    }
}

pub fn sys_linkat(oldfd:isize,oldpath: *const u8,newfd:isize,newpath: *const u8,_flags:u32) -> isize {
    todo!();
}

pub fn sys_unlinkat(dirfd:isize,path: *const u8,flags:u32) -> isize {
    println!("start sys_unlinkat!");
    let token = current_user_token();
    let task = current_task().unwrap();
    let mut inner = task.inner_exclusive_access();
    let path = translated_str(token, path);
    let path = String::from(path.trim_end_matches('\n'));
    
    if path.starts_with('/'){
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
            let now_path:String = inner.current_path.clone();
            drop(inner);
            if let Some(inode) = open(now_path.as_str(),path.as_str(),OpenFlags::O_RDONLY) {
                //断开链接(讨论flags)
                //println!("{}",inode.is_dir());
                if flags == AT_REMOVEDIR {
                    inode.delete();
                    return 0;
                } else {
                    if inode.is_dir() {
                        return -1;
                    } else {
                        //println!("work here");
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
        
            if let Some(file) = &inner.fd_table[dirfd] {
                let filename:String = file.get_name().clone();
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
    let mut kst = UserBuffer::new(translated_byte_buffer(token, kst,core::mem::size_of::<Kstat>()));

    if fd >= inner.fd_table.len() {
        return -1;
    }
    if inner.fd_table[fd].is_none() {
        return -1;
    }

    if let Some(file) = &inner.fd_table[fd] {
        let mut kstat = Kstat::new();
        //println!("work here");
        let file=file.clone();
        drop(inner);
        file.get_fstat(&mut kstat);
        kst.write(kstat.as_bytes());
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
    let (read_pipe,write_pipe) = make_pipe();
    inner.fd_table[read_fd] = Some(read_pipe);
    let write_fd = inner.alloc_fd();
    inner.fd_table[write_fd] = Some(write_pipe);
    println!("{} and {}",read_fd,write_fd);
    *translated_refmut(token, fd) = read_fd as u32;
    *translated_refmut(token, unsafe { fd.add(1) }) = write_fd as u32;
    0
}
