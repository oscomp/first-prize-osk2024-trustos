use crate::{
    drivers::{BlockDeviceImpl, Disk},
    fs::{Inode, SuperBlock},
    sync::SyncUnsafeCell,
};
use alloc::{sync::Arc, vec, vec::Vec};
use ext4_rs::{BlockDevice, Ext4};
use inode::Ext4Inode;
use lazy_static::*;
use sb::Ext4SuperBlock;

use super::{OSInode, Statfs};

mod inode;
mod sb;

pub struct DiskAdapter {
    inner: SyncUnsafeCell<Disk>,
}

const DISK_BLOCK_SIZE: usize = 512;
const BLOCK_SIZE: usize = 4096;

impl BlockDevice for DiskAdapter {
    fn read_offset(&self, offset: usize) -> Vec<u8> {
        let mut disk = self.inner.get_unchecked_mut();
        let mut buf = vec![0u8; BLOCK_SIZE];

        let start_block_id = offset / DISK_BLOCK_SIZE;
        let mut offset_in_block = offset % DISK_BLOCK_SIZE;
        let mut total_bytes_read = 0;

        while total_bytes_read < buf.len() {
            let current_block_id = start_block_id + (total_bytes_read / DISK_BLOCK_SIZE);
            let bytes_to_copy =
                (buf.len() - total_bytes_read).min(DISK_BLOCK_SIZE - offset_in_block);

            let block_data = disk.read_offset(current_block_id * DISK_BLOCK_SIZE + offset_in_block);

            buf[total_bytes_read..total_bytes_read + bytes_to_copy]
                .copy_from_slice(&block_data[offset_in_block..offset_in_block + bytes_to_copy]);

            total_bytes_read += bytes_to_copy;
            offset_in_block = 0; // After the first block, subsequent blocks read from the beginning
        }

        buf
    }

    fn write_offset(&self, offset: usize, buf: &[u8]) {
        let mut disk = self.inner.get_unchecked_mut();

        let start_block_id = offset / DISK_BLOCK_SIZE;
        let mut offset_in_block = offset % DISK_BLOCK_SIZE;

        let bytes_to_write = buf.len();
        let mut total_bytes_written = 0;

        while total_bytes_written < bytes_to_write {
            let current_block_id = start_block_id + (total_bytes_written / DISK_BLOCK_SIZE);
            let bytes_to_copy =
                (bytes_to_write - total_bytes_written).min(DISK_BLOCK_SIZE - offset_in_block);

            let mut block_data = disk.read_offset(current_block_id * DISK_BLOCK_SIZE);

            block_data[offset_in_block..offset_in_block + bytes_to_copy]
                .copy_from_slice(&buf[total_bytes_written..total_bytes_written + bytes_to_copy]);

            disk.write_offset(current_block_id * DISK_BLOCK_SIZE, &block_data)
                .unwrap();

            total_bytes_written += bytes_to_copy;
            offset_in_block = 0; // After the first block, subsequent blocks start at the beginning
        }
    }
}

lazy_static! {
    static ref DISK_ADAPTER: Arc<DiskAdapter> = Arc::new(DiskAdapter {
        inner: SyncUnsafeCell::new(Disk::new(BlockDeviceImpl::new_device())),
    });
    static ref SUPER_BLOCK: Arc<dyn SuperBlock> = {
        let ext4 = Ext4::open(DISK_ADAPTER.clone());
        let root_file = ext4.create_root_file();
        let root = Arc::new(Ext4Inode::new(ext4.clone(), root_file));
        Arc::new(Ext4SuperBlock::new(ext4, root))
    };
    static ref ROOT_INODE: Arc<dyn Inode> = { SUPER_BLOCK.root_inode() };
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

#[cfg(feature = "ext4")]
impl OSInode {
    /// 将文件指针转换为切片,避免拷贝
    /// 读取完整的文件也可以用
    pub unsafe fn read_as_elf(&self) -> &[u8] {
        todo!()
    }
}
