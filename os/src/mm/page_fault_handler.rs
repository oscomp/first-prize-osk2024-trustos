// Page Fault Handler 回调

use alloc::sync::Arc;
use log::debug;

use crate::{
    config::mm::PAGE_SIZE,
    fs::{File, SEEK_CUR, SEEK_SET},
    mm::flush_tlb,
};

use super::{
    translated_byte_buffer, MapArea, PTEFlags, PageTable, UserBuffer, VirtAddr, GROUP_SHARE,
};

///mmap写触发的lazy alocation，直接新分配帧
pub fn mmap_write_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: &mut MapArea) {
    // 映射页面,拷贝数据
    vma.map_one(page_table, va.into());
    if vma.mmap_file.file.is_none() {
        return;
    }
    let file = vma.mmap_file.file.clone().unwrap();
    let old_offset = file.lseek(0, SEEK_CUR).unwrap();
    let start_addr: VirtAddr = vma.vpn_range.start().into();
    let va = va.0;

    debug!(
        "va={:x},start_addr={:x},vma.offset={:x}",
        va, start_addr.0, vma.mmap_file.offset
    );

    file.lseek(
        (va - start_addr.0 + vma.mmap_file.offset) as isize,
        SEEK_SET,
    )
    .expect("mmap_write_page_fault should not fail");
    file.read(UserBuffer {
        buffers: translated_byte_buffer(page_table.token(), va as *const u8, PAGE_SIZE).unwrap(),
    })
    .expect("mmap_write_page_fault should not fail");
    file.lseek(old_offset as isize, SEEK_SET)
        .expect("mmap_write_page_fault should not fail");
    //设置为cow
    let vpn = VirtAddr::from(va).floor();
    let mut pte_flags = vma.flags() | PTEFlags::V;
    //可写的才需要cow
    let need_cow = pte_flags.contains(PTEFlags::W);
    pte_flags &= !PTEFlags::W;
    page_table.set_map_flags(vpn, pte_flags);
    if need_cow {
        page_table.set_cow(vpn);
    }
}
///mmap读触发的lazy alocation，查看是否有共享页可直接用，没有再直接分配
pub fn mmap_read_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: &mut MapArea) {
    let frame = GROUP_SHARE.lock().find(vma.groupid, va.into());
    if let Some(frame) = frame {
        //有现成的，直接clone,需要是cow的
        let vpn = va.into();
        let mut pte_flags = vma.flags() | PTEFlags::V;
        //可写的才需要cow
        let need_cow = pte_flags.contains(PTEFlags::W);
        pte_flags &= !PTEFlags::W;
        //page_table.set_flags(vpn, pte_flags);
        let ppn = frame.ppn;
        vma.data_frames.insert(vpn, frame);
        page_table.map(vpn, ppn, pte_flags);
        if need_cow {
            page_table.set_cow(vpn);
        }
    } else {
        //第一次读，分配页面
        mmap_write_page_fault(va, page_table, vma);
        GROUP_SHARE.lock().add_frame(
            vma.groupid,
            va.into(),
            vma.data_frames.get(&va.into()).unwrap().clone(),
        )
    }
}
///堆触发的lazy alocation，必是写
pub fn lazy_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: &mut MapArea) {
    // 仅映射页面
    vma.map_one(page_table, va.into());
}

///copy on write
pub fn cow_page_fault(va: VirtAddr, page_table: &mut PageTable, vma: &mut MapArea) {
    // 只有一个，不用复制
    let frame = vma.data_frames.get(&va.into()).unwrap();
    // debug!("handle va {:#x}, count={}", va.0, Arc::strong_count(frame));
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
    vma.unmap_one(page_table, va.into());
    vma.map_one(page_table, va.into());
    flush_tlb();
    let dst = &mut page_table
        .translate(va.into())
        .unwrap()
        .ppn()
        .bytes_array_mut()[..PAGE_SIZE];
    dst.copy_from_slice(src);
    page_table.reset_cow(va.into());
    page_table.set_w(va.into());
}
