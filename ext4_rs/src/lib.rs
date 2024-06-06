#![feature(error_in_core)]
#![no_std]
#![allow(unused)]

pub mod consts;
pub mod ext4_error;
pub mod ext4_impl;
pub mod ext4_interface;
pub mod ext4_structs;
pub mod prelude;
pub mod utils;

pub use consts::*;
pub use ext4_error::*;
// pub use ext4::*;
#[allow(unused)]
pub use ext4_impl::*;
pub use ext4_interface::*;
pub use ext4_structs::*;
pub use utils::*;

extern crate alloc;

#[cfg(test)]
mod tests {
    mod write_test {

        #[test]
        fn test_write() {}
    }
}
