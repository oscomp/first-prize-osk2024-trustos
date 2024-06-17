use crate::{
    drivers::{BlockDeviceImpl, Disk},
    fs::SuperBlock,
    sync::SyncUnsafeCell,
};
use alloc::{sync::Arc, vec, vec::Vec};
use ext4::{BlockDevice, Ext4};
// use inode::Ext4OsInode;
use lazy_static::*;
mod inode;
mod sb;

pub use inode::*;
pub use sb::*;

use super::{Inode, Statfs};

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

    fn write_offset(&self, offset: usize, data: &[u8]) {
        let mut disk = self.inner.get_unchecked_mut();

        let start_block_id = offset / DISK_BLOCK_SIZE;
        let mut offset_in_block = offset % DISK_BLOCK_SIZE;

        let bytes_to_write = data.len();
        let mut total_bytes_written = 0;

        while total_bytes_written < bytes_to_write {
            let current_block_id = start_block_id + (total_bytes_written / DISK_BLOCK_SIZE);
            let bytes_to_copy =
                (bytes_to_write - total_bytes_written).min(DISK_BLOCK_SIZE - offset_in_block);

            let mut block_data = disk.read_offset(current_block_id * DISK_BLOCK_SIZE);

            block_data[offset_in_block..offset_in_block + bytes_to_copy]
                .copy_from_slice(&data[total_bytes_written..total_bytes_written + bytes_to_copy]);

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
        let ext4 = Arc::new(Ext4::open(DISK_ADAPTER.clone()));
        let root_file = ext4.create_root_file();
        let root = Arc::new(Ext4OsInode::new(root_file, ext4.clone()));
        Arc::new(Ext4SuperBlock::new(ext4, root))
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
