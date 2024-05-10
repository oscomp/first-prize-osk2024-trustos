mod error;
mod hart;
use core::arch::asm;

pub use error::*;
pub use hart::hart_id;
use log::warn;

use crate::{config::mm::PAGE_SIZE, mm::VirtAddr};

/// 跟踪函数的调用栈
pub fn backtrace() {
    unsafe {
        let mut fp: usize;
        asm!("mv {}, fp", out(reg) fp);
        let start: VirtAddr = VirtAddr::from(fp).floor().into();
        let end: VirtAddr = VirtAddr::from(fp).ceil().into();
        let fp_addr = VirtAddr::from(fp);
        if (start <= fp_addr && fp_addr < end) {
            let ptr = fp as *const usize;
            warn!("[stack_backtrace] {:#x},", ptr.offset(-8).read());
            fp = ptr.offset(-16).read();
        }
    }
}
/// 对齐到页
pub fn page_round_up(v: usize) -> usize {
    if v % PAGE_SIZE == 0 {
        v
    } else {
        v - (v % PAGE_SIZE) + PAGE_SIZE
    }
}
