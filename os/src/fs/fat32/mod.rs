mod inode;
mod sb;

use alloc::sync::Arc;
use fat32_fs::{create_root_vfile, FAT32Manager, VFile};
pub use inode::*;
use lazy_static::*;
pub use sb::*;

use crate::{
    drivers::BLOCK_DEVICE,
    fs::{insert_vfile_idx, Inode, SuperBlock},
};

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

lazy_static! {
    pub static ref SUPER_BLOCK: Arc<dyn SuperBlock> = {
        let fat32_manager = FAT32Manager::open(BLOCK_DEVICE.clone());
        let root = Arc::new(create_root_vfile(&fat32_manager));
        Arc::new(FATSuperBlock::new(fat32_manager, root))
    };
    pub static ref ROOT_INODE: Arc<dyn Inode> = {
        let root = SUPER_BLOCK.root_inode();
        insert_vfile_idx("/", root.clone());
        root
    };
}
