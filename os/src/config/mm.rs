// #![allow(unused)]
pub const USER_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_HEAP_SIZE: usize = 0x40_0000;

pub const PAGE_SIZE: usize = 0x1000;
pub const PAGE_SIZE_BITS: usize = 0xc;

pub const KERNEL_ADDR_OFFSET: usize = 0xffff_ffc0_0000_0000;

/// When directly map: vpn = ppn + kernel direct offset
pub const KERNEL_PGNUM_OFFSET: usize = KERNEL_ADDR_OFFSET >> PAGE_SIZE_BITS;

pub const USER_SPACE_SIZE: usize = 0x30_0000_0000;

// pub const USER_TRAMPOLINE: usize = USER_SPACE_SIZE - PAGE_SIZE;

pub const USER_TRAP_CONTEXT: usize = USER_SPACE_SIZE - PAGE_SIZE;

pub const TRAMPOLINE: usize = usize::MAX - PAGE_SIZE + 1;
// pub const TRAP_CONTEXT: usize = TRAMPOLINE - PAGE_SIZE;

/// boot
pub const HART_START_ADDR: usize = 0x80200000;
