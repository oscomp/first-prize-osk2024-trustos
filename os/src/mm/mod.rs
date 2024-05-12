//! Memory management implementation
//!
//! SV39 page-based virtual-memory architecture for RV64 systems, and
//! everything about memory management, like frame allocator, page table,
//! map area and memory set, is implemented here.
//!
//! Every task or process has a memory_set to control its virtual memory.
mod address;
mod frame_allocator;
mod group;
mod heap_allocator;
mod map_area;
mod memory_set;
mod page_fault_handler;
mod page_table;

pub use address::{KernelAddr, PhysAddr, PhysPageNum, StepByOne, VPNRange, VirtAddr, VirtPageNum};
pub use frame_allocator::{frame_alloc, frame_dealloc, FrameTracker};
pub use group::*;
pub use map_area::{MapArea, MapAreaType, MapPermission, MapType};
pub use memory_set::{kernel_token, remap_test, MemorySet, MemorySetInner, KERNEL_SPACE};
pub use page_fault_handler::*;
pub use page_table::{
    flush_tlb, translated_byte_buffer, translated_ref, translated_refmut, translated_str, PTEFlags,
    PageTable, PageTableEntry, UserBuffer, UserBufferIterator,
};

/// initiate heap allocator, frame allocator and kernel space
pub fn init() {
    heap_allocator::init_heap();
    frame_allocator::init_frame_allocator();
    activate_kernel_space();
}

pub fn activate_kernel_space() {
    KERNEL_SPACE.lock().activate();
}
