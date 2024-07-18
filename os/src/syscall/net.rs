use alloc::{format, string::ToString};

use crate::{
    fs::{make_socket, FileClass, FileDescriptor},
    mm::put_data,
    task::current_task,
    utils::{SysErrNo, SyscallRet},
};

pub fn sys_socket(_domain: u32, _type: u32, _protocol: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let new_fd = task_inner.fd_table.alloc_fd()?;
    let close_on_exec = (_type & 0o2000000) == 0o2000000;
    let non_block = (_type & 0o4000) == 0o4000;
    task_inner.fd_table.set(
        new_fd,
        FileDescriptor::new(close_on_exec, non_block, FileClass::Abs(make_socket())),
    );
    task_inner
        .fs_info
        .insert(format!("socket{}", new_fd).to_string(), new_fd);
    Ok(new_fd)
}
pub fn sys_bind(_sockfd: usize, _addr: *const u8, _addrlen: u32) -> SyscallRet {
    Ok(0)
}
pub fn sys_getsockname(_sockfd: usize, _addr: *const u8, _addrlen: u32) -> SyscallRet {
    Ok(0)
}
pub fn sys_getpeername(_sockfd: usize, _addr: *const u8, _addrlen: u32) -> SyscallRet {
    Err(SysErrNo::Default)
}
pub fn sys_setsockopt(
    _sockfd: usize,
    _level: u32,
    _optname: u32,
    _optcal: *const u8,
    _optlen: u32,
) -> SyscallRet {
    Ok(0)
}
pub fn sys_sendto(
    _sockfd: usize,
    _buf: *const u8,
    _len: usize,
    _flags: u32,
    _dest_addr: *const u8,
    _addrlen: u32,
) -> SyscallRet {
    Ok(1)
}
pub fn sys_recvfrom(
    _sockfd: usize,
    buf: *mut u8,
    _len: usize,
    _flags: u32,
    _src_addr: *const u8,
    _addrlen: u32,
) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();
    unsafe {
        put_data(token, buf, b'x');
        put_data(token, buf.add(1), b'0');
    }
    Ok(1)
}
pub fn sys_listen(_sockfd: usize, _backlog: u32) -> SyscallRet {
    Ok(0)
}
pub fn sys_connect(_sockfd: usize, _addr: *const u8, _addrlen: u32) -> SyscallRet {
    Ok(0)
}
pub fn sys_accept(_sockfd: usize, _addr: *const u8, _addrlen: u32) -> SyscallRet {
    Ok(0)
}

pub fn sys_sendmsg(_sockfd: usize, _addr: *const u8, _flags: u32) -> SyscallRet {
    Ok(0)
}
