#![no_std]
// #![feature(once_cell)]
extern crate alloc;

mod block_cache;
mod block_dev;
mod chain;
mod fat;
mod fat32_manager;
mod layout;
mod sbi;
mod vfs;

#[macro_use]
mod console;

pub const BLOCK_SZ: usize = 512;
pub const FSIMG_BASE: usize = 0x90000000;
pub use block_cache::{
    get_data_block_cache, get_info_block_cache, set_start_sector, sync_all, write_to_dev,
    CacheMode, DATA_BLOCK_CACHE_MANAGER, INFO_BLOCK_CACHE_MANAGER,
};
pub use block_dev::BlockDevice;
pub use chain::*;
pub use fat::FAT;
pub use fat32_manager::*;
pub use layout::*;
pub use vfs::VFile;
