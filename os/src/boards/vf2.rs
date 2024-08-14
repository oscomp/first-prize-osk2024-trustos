use crate::config::mm::KERNEL_ADDR_OFFSET;

pub const CLOCK_FREQ: usize = 400_0000;
pub const MEMORY_END: usize = 0x8800_0000 + KERNEL_ADDR_OFFSET;

pub const MMIO: &[(usize, usize)] = &[
    (0x1704_0000, 0x1_0000),  // RTC
    (0xc00_0000, 0x400_0000), // PLIC
    (0x1000_0000, 0x1_0000),  // UART
    (0x1602_0000, 0x1_0000),  // sdio1
];
