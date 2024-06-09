use alloc::{
    string::{String, ToString},
    sync::Arc,
};
use hashbrown::HashMap;
use lazy_static::*;
use spin::RwLock;

use super::Inode;

lazy_static! {
    pub static ref FSIDX: RwLock<HashMap<String, Arc<dyn Inode>>> = { RwLock::new(HashMap::new()) };
}

pub fn find_vfile_idx(path: &str) -> Option<Arc<dyn Inode>> {
    FSIDX.read().get(path).map(|vfile| Arc::clone(vfile))
}

pub fn insert_vfile_idx(path: &str, vfile: Arc<dyn Inode>) {
    FSIDX.write().insert(path.to_string(), vfile);
}

pub fn remove_vfile_idx(path: &str) {
    FSIDX.write().remove(path);
}

pub fn print_inner() {
    println!("{:#?}", FSIDX.read().keys());
}
