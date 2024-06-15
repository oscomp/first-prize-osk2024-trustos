mod inode;
mod sb;

use core::cell::RefCell;

use alloc::sync::Arc;
use fat32_fs::{create_root_vfile, BlockDevice, FAT32Manager, VFile, BLOCK_SZ};
pub use inode::*;
use lazy_static::*;
pub use sb::*;

use crate::{
    drivers::{BlockDeviceImpl, Disk},
    fs::{insert_inode_idx, Inode, SuperBlock},
    sync::SyncUnsafeCell,
};

use super::{OSInode, Statfs};

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

pub struct DiskAdapter {
    inner: SyncUnsafeCell<Disk>,
}

impl BlockDevice for DiskAdapter {
    fn read_block(&self, block_id: usize, buf: &mut [u8]) {
        let mut disk = self.inner.get_unchecked_mut();
        disk.set_position(block_id * BLOCK_SZ);
        disk.read_one(buf);
    }

    fn write_block(&self, block_id: usize, buf: &[u8]) {
        let mut disk = self.inner.get_unchecked_mut();
        disk.set_position(block_id * BLOCK_SZ);
        disk.write_one(buf);
    }
}

lazy_static! {
    static ref DISK_ADAPTER: Arc<DiskAdapter> = Arc::new(DiskAdapter {
        inner: SyncUnsafeCell::new(Disk::new(BlockDeviceImpl::new_device())),
    });
    static ref SUPER_BLOCK: Arc<dyn SuperBlock> = {
        let fat32_manager = FAT32Manager::open(DISK_ADAPTER.clone());
        let root = Arc::new(create_root_vfile(&fat32_manager));
        Arc::new(FATSuperBlock::new(fat32_manager, root))
    };
    static ref ROOT_INODE: Arc<dyn Inode> = {
        let root = SUPER_BLOCK.root_inode();
        root
    };
}

pub fn root_inode() -> Arc<dyn Inode> {
    SUPER_BLOCK.root_inode()
}

pub fn sync() {
    SUPER_BLOCK.sync()
}

pub fn fs_stat() -> Statfs {
    SUPER_BLOCK.fs_stat()
}
