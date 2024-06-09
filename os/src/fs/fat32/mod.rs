mod inode;

use alloc::sync::Arc;
use fat32_fs::VFile;
pub use inode::*;

use super::OSInode;

//TODO(ZMY) 临时做一下类型体操;与VFS冲突,后续需修改
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
}
