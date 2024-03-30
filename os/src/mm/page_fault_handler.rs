// Page Fault Handler 回调

use alloc::sync::Arc;
use log::info;

use crate::config::mm::PAGE_SIZE;

use super::{
    memory_set, translated_byte_buffer, MapArea, MemorySet, PageTable, UserBuffer, VirtAddr,
};

pub trait PageFaultHandler: Send + Sync {
    fn handle_page_fault(
        &self,
        va: VirtAddr,
        page_table: &mut PageTable,
        vma: Option<&mut MapArea>,
    );
}

#[derive(Clone)]
pub struct MmapPageFaultHandler {}

impl PageFaultHandler for MmapPageFaultHandler {
    fn handle_page_fault(
        &self,
        va: VirtAddr,
        page_table: &mut PageTable,
        vma: Option<&mut MapArea>,
    ) {
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
}

#[derive(Clone)]
pub struct CowPageFaultHandler {}

impl PageFaultHandler for CowPageFaultHandler {
    fn handle_page_fault(
        &self,
        va: VirtAddr,
        page_table: &mut PageTable,
        vma: Option<&mut MapArea>,
    ) {
        // 只有一个，不用复制
        let vma = vma.unwrap();
        let frame = vma.data_frames.get(&va.into()).unwrap();
        println!("handle va {:#X}, count={}", va.0, Arc::strong_count(frame));
        if Arc::strong_count(frame) == 1 {
            page_table.reset_cow(va.into());
            page_table.set_w(va.into());
            return;
        }

        let src = &mut page_table
            .translate(va.into())
            .unwrap()
            .ppn()
            .bytes_array_mut()[..PAGE_SIZE];
        vma.unmap_one(page_table, va.into());
        vma.map_one(page_table, va.into());
        let dst = &mut page_table
            .translate(va.into())
            .unwrap()
            .ppn()
            .bytes_array_mut()[..PAGE_SIZE];
        dst.copy_from_slice(src);
    }
}
