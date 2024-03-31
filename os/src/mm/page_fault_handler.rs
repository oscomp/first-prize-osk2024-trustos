// Page Fault Handler 回调

use alloc::sync::Arc;
use core::arch::asm;
use log::{debug, info};

use crate::{
    config::mm::{PAGE_SIZE, PAGE_SIZE_BITS},
    mm::flush_tlb,
};

use super::{
    memory_set, translated_byte_buffer, MapArea, MemorySet, PageTable, UserBuffer, VirtAddr,
};

///mmap出发的lazy alocation
pub fn mmap_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: Option<&mut MapArea>) {
    // 映射页面,拷贝数据
    let vma = vma.unwrap();
    vma.map_one(page_table, va.into());
    let file = vma.file.clone().unwrap();
    let old_offset = file.offset();
    let start_addr: VirtAddr = vma.vpn_range.start().into();
    let va = va.0;
    file.set_offset(va - start_addr.0 + vma.offset);
    file.read(UserBuffer {
        buffers: translated_byte_buffer(page_table.token(), va as *const u8, PAGE_SIZE),
    });
    file.set_offset(old_offset);
}

///copy on write
pub fn cow_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: Option<&mut MapArea>) {
    // 只有一个，不用复制
    let vma = vma.unwrap();
    let frame = vma.data_frames.get(&va.into()).unwrap();
    debug!("handle va {:#x}, count={}", va.0, Arc::strong_count(frame));
    if Arc::strong_count(frame) == 1 {
        page_table.reset_cow(va.into());
        page_table.set_w(va.into());
        return;
    }

    //旧物理页的内容复制到新物理页
    let src = &mut page_table
        .translate(va.into())
        .unwrap()
        .ppn()
        .bytes_array_mut()[..PAGE_SIZE];
    let old_ppn = page_table.translate(va.into()).unwrap().ppn().0;
    vma.unmap_one(page_table, va.into());
    vma.map_one(page_table, va.into());
    flush_tlb();
    let new_ppn = page_table.translate(va.into()).unwrap().ppn().0;
    let dst = &mut page_table
        .translate(va.into())
        .unwrap()
        .ppn()
        .bytes_array_mut()[..PAGE_SIZE];
    dst.copy_from_slice(src);
    page_table.reset_cow(va.into());
    page_table.set_w(va.into());
}
