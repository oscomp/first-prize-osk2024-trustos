use alloc::sync::Arc;
use ext4_rs::Ext4;

use crate::fs::{Inode, Statfs, SuperBlock};

pub struct Ext4SuperBlock {
    sb: Arc<Ext4>,
    root: Arc<dyn Inode>,
}

impl Ext4SuperBlock {
    pub fn new(sb: Arc<Ext4>, root: Arc<dyn Inode>) -> Self {
        Self { sb, root }
    }
}
impl SuperBlock for Ext4SuperBlock {
    fn fs_stat(&self) -> Statfs {
        Statfs::new(0, 0, 0, 0, 0)
    }
    fn root_inode(&self) -> Arc<dyn Inode> {
        self.root.clone()
    }
    fn sync(&self) {}
}
