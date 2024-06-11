use alloc::sync::Arc;
use ext4_rs::Ext4;

use crate::fs::Inode;

pub struct Ext4SuperBlock {
    sb: Arc<Ext4>,
    root: Arc<dyn Inode>,
}

impl Ext4SuperBlock {
    pub fn new(sb: Arc<Ext4>, root: Arc<dyn Inode>) -> Self {
        Self { sb, root }
    }
}
