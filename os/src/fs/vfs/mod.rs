use crate::mm::UserBuffer;

pub trait SuperBlock: Send + Sync {}

pub trait Inode: Send + Sync {}

pub trait File: Send + Sync {
    fn readable(&self) -> bool;
    fn writable(&self) -> bool;
    /// read 指的是从文件中读取数据放到缓冲区中，最多将缓冲区填满，并返回实际读取的字节数
    fn read(&self, buf: UserBuffer) -> usize;
    /// 将缓冲区中的数据写入文件，最多将缓冲区中的数据全部写入，并返回直接写入的字节数
    fn write(&self, buf: UserBuffer) -> usize;
}

pub trait Ioctl: File {
    /// ioctl处理
    fn ioctl(&self, cmd: usize, arg: usize) -> isize;
}
