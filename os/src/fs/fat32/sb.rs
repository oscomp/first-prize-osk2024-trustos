use alloc::sync::Arc;
use fat32_fs::{sync_all, FAT32Manager};

use crate::fs::{Inode, Statfs, SuperBlock};

pub struct FATSuperBlock {
    sb: Arc<FAT32Manager>,
    root: Arc<dyn Inode>,
}

impl FATSuperBlock {
    pub fn new(sb: Arc<FAT32Manager>, root: Arc<dyn Inode>) -> Self {
        FATSuperBlock { sb, root }
    }
}

const FAT_SUPER_MAGIC: i64 = 0x4006;

impl SuperBlock for FATSuperBlock {
    fn root_inode(&self) -> Arc<dyn Inode> {
        self.root.clone()
    }
    fn sync(&self) {
        sync_all();
    }
    fn fs_stat(&self) -> Statfs {
        let fs = self.sb.clone();
        let fsinfo = fs.get_fsinfo();
        let fsinfo = fsinfo.read();
        let bfree = fsinfo.read_free_cluster_count() * fs.sectors_per_cluster();
        let fat = fs.get_fat();
        let fat = fat.read();
        let files = fat.get_max_cluster();
        Statfs::new(
            FAT_SUPER_MAGIC,
            bfree as i64,
            bfree as i64,
            files as i64,
            files as i64,
        )
    }
}
