mod device;
mod disk;
pub use device::*;
pub use disk::*;

cfg_if::cfg_if! {
    if #[cfg(feature="board_qemu")]{
        mod virtio;
        use virtio_drivers::VirtIOHeader;
        use virtio::*;
        use crate::config::mm::KERNEL_ADDR_OFFSET;

        pub type BlockDeviceImpl = VirtIoBlkDev<VirtIoHalImpl>;

        impl BlockDeviceImpl {
            pub fn new_device() -> Self {
                const VIRTIO0: usize = 0x10001000 + KERNEL_ADDR_OFFSET;
                unsafe { VirtIoBlkDev::new(&mut *(VIRTIO0 as *mut VirtIOHeader)) }
            }
        }
    }else if #[cfg(feature="board_vf2")]{
        mod vf2;
        pub type BlockDeviceImpl = vf2::Vf2BlkDev;
    }
}
