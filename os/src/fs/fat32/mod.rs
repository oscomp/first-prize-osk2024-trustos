mod fsidx;
mod inode;

use alloc::sync::Arc;
use fat32_fs::VFile;
pub use fsidx::*;
pub use inode::*;

use super::OSInode;

///TODO(ZMY) 临时做一下类型体操;与VFS冲突,后续需修改
#[cfg(feature = "fat32")]
impl OSInode {
    /// 将文件指针转换为切片,避免拷贝
    /// 读取完整的文件也可以用
    pub unsafe fn read_as_elf(&self) -> &[u8] {
        // 类型体操
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.read_as_elf()
        }
    }
    pub fn first_cluster(&self) -> u32 {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.first_cluster()
        }
    }
    pub fn set_first_cluster(&self, first_cluster: u32) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.set_first_cluster(first_cluster);
        }
    }

    pub fn delete(&self) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.delete();
        }
    }

    pub fn remove(&self) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.remove();
        }
    }

    pub fn setsym(&self) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.setsym();
        }
    }

    pub fn file_size(&self) -> usize {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.get_size() as usize
        }
    }

    pub fn set_file_size(&self, size: u32) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.set_size(size);
        }
    }

    pub fn set_accessed_time(&self, atime: u64) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.set_accessed_time(atime);
        }
    }
    pub fn set_modification_time(&self, mtime: u64) {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.set_modification_time(mtime);
        }
    }
    pub fn accessed_time(&self) -> u64 {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            // inode.set_modification_time(mtime);
            inode.accessed_time()
        }
    }
    pub fn modification_time(&self) -> u64 {
        unsafe {
            let inode = Arc::from_raw(Arc::into_raw(self.inode.clone()) as *const VFile);
            inode.modification_time()
        }
    }
}
