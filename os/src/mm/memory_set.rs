//! Implementation of [`MapArea`] and [`MemorySet`].
use super::{
    brk_page_fault, cow_page_fault, frame_alloc, mmap_read_page_fault, mmap_write_page_fault,
    translated_byte_buffer, FrameTracker, KernelAddr, MapArea, MapAreaType, MapPermission, MapType,
    PTEFlags, PageTable, PageTableEntry, PhysAddr, PhysPageNum, StepByOne, UserBuffer, VPNRange,
    VirtAddr, VirtPageNum, GROUP_SHARE,
};
use crate::{
    config::{
        board::{MEMORY_END, MMIO},
        mm::{
            KERNEL_ADDR_OFFSET, KERNEL_PGNUM_OFFSET, MMAP_TOP, PAGE_SIZE, USER_HEAP_SIZE,
            USER_SPACE_SIZE, USER_STACK_SIZE, USER_TRAP_CONTEXT,
        },
    },
    fs::{open_file, File, OSInode, OpenFlags},
    mm::flush_tlb,
    sync::SyncUnsafeCell,
    syscall::MmapFlags,
    task::{current_task, Aux, AuxType},
};
use alloc::{collections::BTreeMap, sync::Arc, vec::Vec};
use core::arch::asm;
use lazy_static::*;
use log::{debug, info};
use riscv::register::{
    satp,
    scause::{Exception, Trap},
};
use spin::{Mutex, MutexGuard};

extern "C" {
    fn stext();
    fn etext();
    fn srodata();
    fn erodata();
    fn sdata();
    fn edata();
    fn sbss_with_stack();
    fn ebss();
    fn ekernel();
    fn sigreturn_trampoline();
}

lazy_static! {
    /// a memory set instance through lazy_static! managing kernel space
    pub static ref KERNEL_SPACE: Mutex<MemorySetInner> =
         Mutex::new(MemorySetInner::new_kernel()) ;
}
lazy_static! {
    /// 全0页，bss段初始指向这里
    pub static ref ZERO_PAGE: Arc<FrameTracker> =
        frame_alloc().unwrap();
}
///Get kernelspace root ppn
pub fn kernel_token() -> usize {
    KERNEL_SPACE.lock().token()
}

pub struct MemorySet {
    pub inner: SyncUnsafeCell<MemorySetInner>,
}

impl MemorySet {
    pub fn new(memory_set: MemorySetInner) -> Self {
        Self {
            inner: SyncUnsafeCell::new(memory_set),
        }
    }
    pub fn get_unchecked_mut(&self) -> &mut MemorySetInner {
        self.inner.get_unchecked_mut()
    }
    pub fn get_unchecked_ref(&self) -> &MemorySetInner {
        self.inner.get_unchecked_ref()
    }
    // 对MemorySetInner封装
    #[inline(always)]
    pub fn token(&self) -> usize {
        self.inner.get_unchecked_mut().token()
    }
    #[inline(always)]
    pub fn insert_framed_area(
        &self,
        start_va: VirtAddr,
        end_va: VirtAddr,
        permission: MapPermission,
        area_type: MapAreaType,
    ) {
        self.inner
            .get_unchecked_mut()
            .insert_framed_area(start_va, end_va, permission, area_type)
    }
    #[inline(always)]
    pub fn insert_given_framed_area(
        &self,
        start_va: VirtAddr,
        end_va: VirtAddr,
        permission: MapPermission,
        area_type: MapAreaType,
        frames: Vec<Arc<FrameTracker>>,
    ) {
        self.inner
            .get_unchecked_mut()
            .insert_given_framed_area(start_va, end_va, permission, area_type, frames)
    }
    #[inline(always)]
    pub fn kernel_stack_frame(&self) -> Vec<Arc<FrameTracker>> {
        self.inner.get_unchecked_mut().kernel_stack_frame()
    }
    #[inline(always)]
    pub fn remove_area_with_start_vpn(&self, start_vpn: VirtPageNum) {
        self.inner
            .get_unchecked_mut()
            .remove_area_with_start_vpn(start_vpn)
    }
    #[inline(always)]
    pub fn mmap(
        &self,
        addr: usize,
        len: usize,
        map_perm: MapPermission,
        flags: MmapFlags,
        file: Option<Arc<OSInode>>,
        off: usize,
    ) -> usize {
        self.inner
            .get_unchecked_mut()
            .mmap(addr, len, map_perm, flags, file, off)
    }
    #[inline(always)]
    pub fn munmap(&self, addr: usize, len: usize) {
        self.inner.get_unchecked_mut().munmap(addr, len)
    }
    #[inline(always)]
    pub fn lazy_page_fault(&self, vpn: VirtPageNum, scause: Trap) -> bool {
        self.inner.get_unchecked_mut().lazy_page_fault(vpn, scause)
    }
    #[inline(always)]
    pub fn cow_page_fault(&self, vpn: VirtPageNum, scause: Trap) -> bool {
        self.inner.get_unchecked_mut().cow_page_fault(vpn, scause)
    }
    #[inline(always)]
    pub fn mprotect(
        &self,
        start_vpn: VirtPageNum,
        end_vpn: VirtPageNum,
        map_perm: MapPermission,
    ) -> PTEFlags {
        self.inner
            .get_unchecked_mut()
            .mprotect(start_vpn, end_vpn, map_perm)
    }
    #[inline(always)]
    fn push(&self, mut map_area: MapArea, data: Option<&[u8]>) {
        self.inner.get_unchecked_mut().push(map_area, data)
    }
    #[inline(always)]
    fn push_with_offset(&self, mut map_area: MapArea, offset: usize, data: Option<&[u8]>) {
        self.inner
            .get_unchecked_mut()
            .push_with_offset(map_area, offset, data)
    }
    #[inline(always)]
    fn push_with_given_frames(&self, mut map_area: MapArea, frames: Vec<Arc<FrameTracker>>) {
        self.inner
            .get_unchecked_mut()
            .push_with_given_frames(map_area, frames)
    }
    #[inline(always)]
    fn push_lazily(&self, map_area: MapArea) {
        self.inner.get_unchecked_mut().push_lazily(map_area)
    }
    #[inline(always)]
    pub fn activate(&self) {
        self.inner.get_unchecked_mut().activate();
    }
    #[inline(always)]
    pub fn recycle_data_pages(&self) {
        self.inner.get_unchecked_mut().recycle_data_pages();
    }
    #[inline(always)]
    pub fn translate(&self, vpn: VirtPageNum) -> Option<PageTableEntry> {
        self.inner.get_unchecked_mut().translate(vpn)
    }
}

/// memory set structure, controls virtual-memory space
/// 地址空间
pub struct MemorySetInner {
    pub page_table: PageTable,
    areas: Vec<MapArea>,
}

impl MemorySetInner {
    ///Create an empty `MemorySet`
    pub fn new_bare() -> Self {
        Self {
            page_table: PageTable::new(),
            areas: Vec::new(),
        }
    }
    pub fn new_from_kernel() -> Self {
        Self {
            page_table: PageTable::new_from_kernel(),
            areas: Vec::new(),
        }
    }
    ///Get pagetable `root_ppn`
    pub fn token(&self) -> usize {
        self.page_table.token()
    }
    pub fn page_table_mut(self: &mut MemorySetInner) -> &mut PageTable {
        &mut self.page_table
    }
    /// Assume that no conflicts.
    pub fn insert_framed_area(
        &mut self,
        start_va: VirtAddr,
        end_va: VirtAddr,
        permission: MapPermission,
        area_type: MapAreaType,
    ) {
        self.push(
            MapArea::new(start_va, end_va, MapType::Framed, permission, area_type),
            None,
        );
    }
    pub fn insert_given_framed_area(
        &mut self,
        start_va: VirtAddr,
        end_va: VirtAddr,
        permission: MapPermission,
        area_type: MapAreaType,
        frames: Vec<Arc<FrameTracker>>,
    ) {
        self.push_with_given_frames(
            MapArea::new(start_va, end_va, MapType::Framed, permission, area_type),
            frames,
        );
    }
    /// return frames of kernel stack
    pub fn kernel_stack_frame(&self) -> Vec<Arc<FrameTracker>> {
        self.areas
            .iter()
            .find_map(|area| {
                if area.area_type == MapAreaType::Stack && !area.map_perm.contains(MapPermission::U)
                {
                    Some(area.kernel_stack_frame())
                } else {
                    None
                }
            })
            .unwrap()
    }
    ///Remove `MapArea` that starts with `start_vpn`
    pub fn remove_area_with_start_vpn(&mut self, start_vpn: VirtPageNum) {
        if let Some((idx, area)) = self
            .areas
            .iter_mut()
            .enumerate()
            .find(|(_, area)| area.vpn_range.start() == start_vpn)
        {
            area.unmap(&mut self.page_table);
            self.areas.remove(idx);
        }
    }
    // 根据hint插入页面到指定的area并返回(va_bottom,va_top)
    // hint指示的区域必须存在
    pub fn insert_framed_area_with_hint(
        &mut self,
        hint: usize,
        size: usize,
        map_perm: MapPermission,
        area_type: MapAreaType,
    ) -> (usize, usize) {
        let start_va = self.find_insert_addr(hint, size);
        let end_va = start_va + size;
        self.insert_framed_area(
            VirtAddr::from(start_va),
            VirtAddr::from(end_va),
            map_perm,
            area_type,
        );
        (start_va, end_va)
    }
    pub fn find_insert_addr(&self, hint: usize, size: usize) -> usize {
        let end_vpn = VirtAddr::from(hint).floor();
        let start_vpn = VirtAddr::from(hint - size).floor();
        for area in self.areas.iter() {
            let (start, end) = area.vpn_range.range();
            if end_vpn > start && start_vpn < end {
                let new_hint = VirtAddr::from(start_vpn).0 - PAGE_SIZE;
                return self.find_insert_addr(new_hint, size);
            }
        }
        VirtAddr::from(start_vpn).0
    }
    /// mmap
    pub fn mmap(
        &mut self,
        addr: usize,
        len: usize,
        map_perm: MapPermission,
        flags: MmapFlags,
        file: Option<Arc<OSInode>>,
        off: usize,
    ) -> usize {
        // 映射到固定地址
        if flags.contains(MmapFlags::MAP_FIXED) {
            self.push_lazily(MapArea::new_mmap(
                VirtAddr::from(addr),
                VirtAddr::from(addr + len),
                MapType::Framed,
                map_perm,
                MapAreaType::Mmap,
                file,
                off,
                flags,
            ));
            addr
        } else {
            // 自行选择地址,计算已经使用的MMap地址
            let map_size: usize = self
                .areas
                .iter()
                .filter(|area| area.area_type == MapAreaType::Mmap)
                .map(|area| {
                    let (start, end) = area.vpn_range.range();
                    (VirtAddr::from(end).0 - VirtAddr::from(start).0)
                })
                .sum();
            let addr = MMAP_TOP - map_size - len;
            self.push_lazily(MapArea::new_mmap(
                VirtAddr::from(addr),
                VirtAddr::from(addr + len),
                MapType::Framed,
                map_perm,
                MapAreaType::Mmap,
                file,
                off,
                flags,
            ));
            addr
        }
        // addr
    }
    /// munmap
    pub fn munmap(&mut self, addr: usize, len: usize) {
        let start_vpn = VirtPageNum::from(VirtAddr::from(addr));
        let end_vpn = VirtPageNum::from(VirtAddr::from(addr + len));
        let area = self
            .areas
            .iter_mut()
            .enumerate()
            .filter(|(_, area)| area.area_type == MapAreaType::Mmap)
            .find(|(idx, area)| {
                let (start, end) = area.vpn_range.range();
                start == start_vpn
            });
        if area.is_some() {
            let (idx, area_inner) = area.unwrap();
            // 检查是否需要写回
            if area_inner.mmap_flags.contains(MmapFlags::MAP_SHARED)
                && area_inner.map_perm.contains(MapPermission::W)
            {
                let mapped_len: usize = VPNRange::new(start_vpn, end_vpn)
                    .into_iter()
                    .filter(|vpn| area_inner.data_frames.contains_key(&vpn))
                    .count()
                    * PAGE_SIZE;
                let file = area_inner.mmap_file.file.clone().unwrap();
                file.write(UserBuffer {
                    buffers: translated_byte_buffer(
                        self.page_table.token(),
                        addr as *const u8,
                        mapped_len,
                    ),
                });
            }
            // 取消映射
            for vpn in VPNRange::new(start_vpn, end_vpn) {
                area_inner.unmap_one(&mut self.page_table, vpn);
            }
            let area_end_vpn = area_inner.vpn_range.end();
            // 是否回收
            if area_end_vpn == end_vpn {
                self.areas.remove(idx);
            } else {
                area_inner.vpn_range = VPNRange::new(end_vpn, area_end_vpn);
            }
            flush_tlb();
        }
    }
    pub fn lazy_page_fault(&mut self, vpn: VirtPageNum, scause: Trap) -> bool {
        //mmap
        let area = self
            .areas
            .iter_mut()
            .filter(|area| area.area_type == MapAreaType::Mmap)
            .find(|area| {
                let (start, end) = area.vpn_range.range();
                start <= vpn && vpn < end
            });
        if area.is_some() {
            let area_inner = area.unwrap();
            if scause == Trap::Exception(Exception::StorePageFault) {
                mmap_read_page_fault(vpn.into(), &mut self.page_table, area_inner);
            } else {
                mmap_write_page_fault(vpn.into(), &mut self.page_table, area_inner);
            }
            return true;
        }
        //brk
        let area = self
            .areas
            .iter_mut()
            .filter(|area| area.area_type == MapAreaType::Brk)
            .find(|area| {
                let (start, end) = area.vpn_range.range();
                start <= vpn && vpn < end
            });
        if area.is_some() {
            let area_inner = area.unwrap();
            brk_page_fault(vpn.into(), &mut self.page_table, area_inner);
            return true;
        }
        false
    }
    pub fn cow_page_fault(&mut self, vpn: VirtPageNum, scause: Trap) -> bool {
        if scause == Trap::Exception(Exception::LoadPageFault) {
            return false;
        }
        //找到触发cow的段
        let area = self
            .areas
            .iter_mut()
            .filter(|area| area.area_type == MapAreaType::Elf || area.area_type == MapAreaType::Brk)
            .find(|area| {
                let (start, end) = area.vpn_range.range();
                start <= vpn && vpn < end
            });
        let pte = self.page_table.translate(vpn);
        if area.is_some() && pte.is_some() && pte.unwrap().is_cow() {
            let area_inner = area.unwrap();
            cow_page_fault(vpn.into(), &mut self.page_table, area_inner);
            true
        } else {
            false
        }
    }
    pub fn mprotect(
        &mut self,
        start_vpn: VirtPageNum,
        end_vpn: VirtPageNum,
        map_perm: MapPermission,
    ) -> PTEFlags {
        let mut flags = PTEFlags::empty();
        //因修改而新增的Area
        let mut new_areas = Vec::new();
        for area in self.areas.iter_mut() {
            let (start, end) = area.vpn_range.range();
            //无需修改
            if end <= start_vpn || start >= end_vpn {
                continue;
            }
            //整个area修改
            if start >= start_vpn && end <= end_vpn {
                area.map_perm = map_perm;
                flags = area.flags();
                continue;
            }
            //修改area后半部分
            if start < start_vpn && end < end_vpn {
                let mut new_area = MapArea::from_another(area);
                new_area.map_perm = map_perm;
                flags = new_area.flags();
                new_area.vpn_range = VPNRange::new(start_vpn, end);
                area.vpn_range = VPNRange::new(start, start_vpn);
                loop {
                    let mut page = area.data_frames.pop_last().unwrap();
                    if page.0 < start_vpn {
                        area.data_frames.insert(page.0, page.1);
                        break;
                    }
                    new_area.data_frames.insert(page.0, page.1);
                }
                new_areas.push(new_area);
                continue;
            }
            //修改area前半部分
            if start > start_vpn && end > end_vpn {
                let mut new_area = MapArea::from_another(area);
                new_area.map_perm = map_perm;
                flags = new_area.flags();
                new_area.vpn_range = VPNRange::new(start, end_vpn);
                area.vpn_range = VPNRange::new(end_vpn, end);
                loop {
                    let mut page = area.data_frames.pop_first().unwrap();
                    if page.0 >= end_vpn {
                        area.data_frames.insert(page.0, page.1);
                        break;
                    }
                    new_area.data_frames.insert(page.0, page.1);
                }
                new_areas.push(new_area);
                continue;
            }
            //修改area中间部分
            if start < start_vpn && end > end_vpn {
                let mut front_area = MapArea::from_another(area);
                let mut back_area = MapArea::from_another(area);
                front_area.vpn_range = VPNRange::new(start, start_vpn);
                back_area.vpn_range = VPNRange::new(end_vpn, end);
                area.vpn_range = VPNRange::new(start_vpn, end_vpn);
                area.map_perm = map_perm;
                flags = area.flags();
                loop {
                    let mut page = area.data_frames.pop_first().unwrap();
                    if page.0 >= start_vpn {
                        area.data_frames.insert(page.0, page.1);
                        break;
                    }
                    front_area.data_frames.insert(page.0, page.1);
                }
                loop {
                    let mut page = area.data_frames.pop_last().unwrap();
                    if page.0 < end_vpn {
                        area.data_frames.insert(page.0, page.1);
                        break;
                    }
                    back_area.data_frames.insert(page.0, page.1);
                }
                new_areas.push(front_area);
                new_areas.push(back_area);
                continue;
            }
        }
        for area in new_areas {
            self.areas.push(area);
        }
        flags
    }
    fn push(&mut self, mut map_area: MapArea, data: Option<&[u8]>) {
        map_area.map(&mut self.page_table);
        if let Some(data) = data {
            map_area.copy_data(&mut self.page_table, data, 0);
        }
        self.areas.push(map_area);
    }
    fn push_with_offset(&mut self, mut map_area: MapArea, offset: usize, data: Option<&[u8]>) {
        map_area.map(&mut self.page_table);
        if let Some(data) = data {
            map_area.copy_data(&mut self.page_table, data, offset);
        }
        self.areas.push(map_area);
    }
    fn push_with_given_frames(&mut self, mut map_area: MapArea, frames: Vec<Arc<FrameTracker>>) {
        map_area.map_given_frames(&mut self.page_table, frames);
        self.areas.push(map_area);
    }
    /// 不映射MapArea里的虚拟页面
    fn push_lazily(&mut self, map_area: MapArea) {
        self.areas.push(map_area);
    }
    ///仅initproc会用，将懒分配的全部分配
    fn unlazy(&mut self) {
        for map_area in self.areas.iter_mut() {
            map_area.map(&mut self.page_table);
        }
    }
    /// Without kernel stacks.
    pub fn new_kernel() -> Self {
        let mut memory_set = Self::new_bare();
        println!("kernel satp: {:#x}", memory_set.page_table.token());
        println!(".text [{:#x}, {:#x})", stext as usize, etext as usize);
        println!(".rodata [{:#x}, {:#x})", srodata as usize, erodata as usize);
        println!(".data [{:#x}, {:#x})", sdata as usize, edata as usize);
        println!(
            ".bss [{:#x}, {:#x})",
            sbss_with_stack as usize, ebss as usize
        );
        println!(
            "sigreturn_trampoline start: [{:#x}, {:#x}",
            sigreturn_trampoline as usize,
            sigreturn_trampoline as usize + PAGE_SIZE
        );
        // map kernel sections
        println!("mapping .text section");
        let s_sig_trap = sigreturn_trampoline as usize;
        let e_sig_trap = sigreturn_trampoline as usize + PAGE_SIZE;
        memory_set.push(
            MapArea::new(
                (stext as usize).into(),
                (s_sig_trap).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::X,
                MapAreaType::Elf,
            ),
            None,
        );
        memory_set.push(
            MapArea::new(
                (e_sig_trap).into(),
                (etext as usize).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::X,
                MapAreaType::Elf,
            ),
            None,
        );
        memory_set.push(
            MapArea::new(
                (s_sig_trap).into(),
                (e_sig_trap).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::X | MapPermission::U,
                MapAreaType::Elf,
            ),
            None,
        );
        println!("mapping .rodata section");
        memory_set.push(
            MapArea::new(
                (srodata as usize).into(),
                (erodata as usize).into(),
                MapType::Direct,
                MapPermission::R,
                MapAreaType::Elf,
            ),
            None,
        );
        println!("mapping .data section");
        memory_set.push(
            MapArea::new(
                (sdata as usize).into(),
                (edata as usize).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::W,
                MapAreaType::Elf,
            ),
            None,
        );
        println!("mapping .bss section");
        memory_set.push(
            MapArea::new(
                (sbss_with_stack as usize).into(),
                (ebss as usize).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::W,
                MapAreaType::Elf,
            ),
            None,
        );
        println!("mapping physical memory");
        memory_set.push(
            MapArea::new(
                (ekernel as usize).into(),
                MEMORY_END.into(),
                MapType::Direct,
                MapPermission::R | MapPermission::W,
                MapAreaType::Physical,
            ),
            None,
        );
        println!("mapping memory-mapped registers");
        for pair in MMIO {
            memory_set.push(
                MapArea::new(
                    ((*pair).0 + KERNEL_ADDR_OFFSET).into(),
                    ((*pair).0 + (*pair).1 + KERNEL_ADDR_OFFSET).into(),
                    MapType::Direct,
                    MapPermission::R | MapPermission::W,
                    MapAreaType::MMIO,
                ),
                None,
            );
        }
        println!("create new kernel successfully!");
        memory_set
    }
    /// Include sections in elf and trampoline and TrapContext and user stack,
    /// also returns user_sp and entry point.
    pub fn from_elf(elf_data: &[u8]) -> (Self, usize, usize, usize, Vec<Aux>) {
        let mut auxv = Vec::new();
        let mut memory_set = Self::new_from_kernel();
        // debug!("from_elf new stap={:#x}", memory_set.page_table.token());
        // map program headers of elf, with U flag
        let elf = xmas_elf::ElfFile::new(elf_data).unwrap();
        let elf_header = elf.header;
        let magic = elf_header.pt1.magic;
        assert_eq!(magic, [0x7f, 0x45, 0x4c, 0x46], "invalid elf!");
        let ph_count = elf_header.pt2.ph_count();
        let mut head_va = 0; // top va of ELF which points to ELF header

        auxv.push(Aux::new(
            AuxType::PHENT,
            elf.header.pt2.ph_entry_size() as usize,
        )); // ELF64 header 64bytes
        auxv.push(Aux::new(AuxType::PHNUM, ph_count as usize));
        auxv.push(Aux::new(AuxType::PAGESZ, PAGE_SIZE as usize));
        auxv.push(Aux::new(AuxType::BASE, 0 as usize));
        auxv.push(Aux::new(AuxType::FLAGS, 0 as usize));
        auxv.push(Aux::new(
            AuxType::ENTRY,
            elf.header.pt2.entry_point() as usize,
        ));
        auxv.push(Aux::new(AuxType::UID, 0 as usize));
        auxv.push(Aux::new(AuxType::EUID, 0 as usize));
        auxv.push(Aux::new(AuxType::GID, 0 as usize));
        auxv.push(Aux::new(AuxType::EGID, 0 as usize));
        auxv.push(Aux::new(AuxType::PLATFORM, 0 as usize));
        auxv.push(Aux::new(AuxType::HWCAP, 0 as usize));
        auxv.push(Aux::new(AuxType::CLKTCK, 100 as usize));
        auxv.push(Aux::new(AuxType::SECURE, 0 as usize));
        auxv.push(Aux::new(AuxType::NOTELF, 0x112d as usize));
        let mut max_end_vpn = VirtPageNum(0);
        for i in 0..ph_count {
            let ph = elf.program_header(i).unwrap();
            if ph.get_type().unwrap() == xmas_elf::program::Type::Load {
                let start_va: VirtAddr = (ph.virtual_addr() as usize).into();
                let end_va: VirtAddr = ((ph.virtual_addr() + ph.mem_size()) as usize).into();
                let offset = start_va.0 - start_va.floor().0 * PAGE_SIZE;
                let mut map_perm = MapPermission::U;
                let ph_flags = ph.flags();
                if ph_flags.is_read() {
                    map_perm |= MapPermission::R;
                }
                if ph_flags.is_write() {
                    map_perm |= MapPermission::W;
                }
                if ph_flags.is_execute() {
                    map_perm |= MapPermission::X;
                }
                let map_area = MapArea::new(
                    start_va,
                    end_va,
                    MapType::Framed,
                    map_perm,
                    MapAreaType::Elf,
                );
                if offset == 0 {
                    head_va = start_va.into();
                }
                max_end_vpn = map_area.vpn_range.end();
                memory_set.push_with_offset(
                    map_area,
                    offset,
                    Some(&elf.input[ph.offset() as usize..(ph.offset() + ph.file_size()) as usize]),
                );
                //memory_set.push_lazily(map_area);
            }
        }

        // Get ph_head addr for auxv
        let ph_head_addr = head_va + elf.header.pt2.ph_offset() as usize;
        auxv.push(Aux {
            aux_type: AuxType::PHDR,
            value: ph_head_addr as usize,
        });
        //map user heap
        let max_end_va: VirtAddr = max_end_vpn.into();
        let mut user_heap_bottom: usize = max_end_va.into();
        //guard page
        user_heap_bottom += PAGE_SIZE;
        let user_heap_top: usize = user_heap_bottom + USER_HEAP_SIZE;
        memory_set.push_lazily(MapArea::new(
            user_heap_bottom.into(),
            user_heap_top.into(),
            MapType::Framed,
            MapPermission::R | MapPermission::W | MapPermission::U,
            MapAreaType::Brk,
        ));

        // map user stack with U flags
        let user_stack_top = USER_TRAP_CONTEXT - PAGE_SIZE;
        let user_stack_bottom = user_stack_top - USER_STACK_SIZE;
        memory_set.push(
            MapArea::new(
                user_stack_bottom.into(),
                user_stack_top.into(),
                MapType::Framed,
                MapPermission::R | MapPermission::W | MapPermission::U,
                MapAreaType::Stack,
            ),
            None,
        );
        // println!("user_stack:{:#X}~{:#X}", user_stack_bottom, user_stack_top);
        // map TrapContext
        memory_set.push(
            MapArea::new(
                USER_TRAP_CONTEXT.into(),
                USER_SPACE_SIZE.into(),
                MapType::Framed,
                MapPermission::R | MapPermission::W,
                MapAreaType::Trap,
            ),
            None,
        );
        // println!("start:{:#X}", elf.header.pt2.entry_point() as usize);
        (
            memory_set,
            user_stack_top,
            user_heap_bottom,
            elf.header.pt2.entry_point() as usize,
            auxv,
        )
    }
    ///Clone a same `MemorySet`
    pub fn from_existed_user(user_space: &Arc<MemorySet>, copy_user_stack: bool) -> MemorySetInner {
        let mut memory_set = Self::new_from_kernel();
        // copy data sections/trap_context/user_stack
        for area in user_space.get_unchecked_mut().areas.iter_mut() {
            // don't copy kernel stack
            if area.area_type == MapAreaType::Stack && !area.map_perm.contains(MapPermission::U) {
                continue;
            }
            if !copy_user_stack && area.area_type == MapAreaType::Stack {
                continue;
            }
            let mut new_area = MapArea::from_another(area);
            if area.area_type == MapAreaType::Mmap {
                GROUP_SHARE.lock().add_area(new_area.groupid);
            }
            /// Mmap和brk是lazy allocation
            if area.area_type == MapAreaType::Mmap || area.area_type == MapAreaType::Brk {
                //已经分配且独占/被写过的部分按cow处理
                //其余是读共享或未分配部分，直接clone即可
                new_area.data_frames = area.data_frames.clone();
                for (vpn, frame) in area.data_frames.iter() {
                    let vpn = *vpn;
                    let pte = user_space
                        .get_unchecked_mut()
                        .page_table
                        .translate(vpn)
                        .unwrap();
                    let mut pte_flags = pte.flags();
                    let src_ppn = pte.ppn();
                    //说明有共享页，不需要修改为写时复制
                    if Arc::strong_count(frame) > 2 {
                        memory_set.page_table.map(vpn, frame.ppn, pte_flags);
                        continue;
                    }
                    //清空可写位，设置COW位
                    //下面两步不合起来是因为flags只有8位，全都用掉了
                    //所以Cow位没有放到flags里面
                    pte_flags &= !PTEFlags::W;
                    user_space
                        .get_unchecked_mut()
                        .page_table
                        .set_flags(vpn, pte_flags);
                    user_space.get_unchecked_mut().page_table.set_cow(vpn);
                    // 设置新的pagetable
                    memory_set.page_table.map(vpn, src_ppn, pte_flags);
                    memory_set.page_table.set_cow(vpn);
                }
                memory_set.push_lazily(new_area);
                continue;
            }
            // let mut page_table = &mut user_space.page_table;
            ///ELF是cow
            if area.area_type == MapAreaType::Elf {
                for vpn in area.vpn_range {
                    let pte = user_space
                        .get_unchecked_mut()
                        .page_table
                        .translate(vpn)
                        .unwrap();
                    let pte_flags = pte.flags() & !PTEFlags::W;
                    let src_ppn = pte.ppn();
                    //清空可写位，设置COW位
                    //下面两步不合起来是因为flags只有8位，全都用掉了
                    //所以Cow位没有放到flags里面
                    user_space
                        .get_unchecked_mut()
                        .page_table
                        .set_flags(vpn, pte_flags);
                    user_space.get_unchecked_mut().page_table.set_cow(vpn);
                    // 设置新的pagetable
                    memory_set.page_table.map(vpn, src_ppn, pte_flags);
                    memory_set.page_table.set_cow(vpn);
                }

                new_area.data_frames = area.data_frames.clone();
                memory_set.push_lazily(new_area);
                continue;
            }
            //既不是cow也不是mmap
            memory_set.push(new_area, None);

            // copy data from another space
            for vpn in area.vpn_range {
                let src_ppn = user_space.translate(vpn).unwrap().ppn();
                let dst_ppn = memory_set.translate(vpn).unwrap().ppn();
                dst_ppn
                    .bytes_array_mut()
                    .copy_from_slice(src_ppn.bytes_array_mut());
            }
        }
        flush_tlb();
        memory_set
    }
    ///Refresh TLB with `sfence.vma`
    pub fn activate(&self) {
        let satp = self.page_table.token();
        // println!("switch satp to  {:x}", satp);
        unsafe {
            satp::write(satp);
            asm!("sfence.vma");
        }
    }
    ///Translate throuth pagetable
    pub fn translate(&self, vpn: VirtPageNum) -> Option<PageTableEntry> {
        self.page_table.translate(vpn)
    }
    ///Remove all `MapArea`
    pub fn recycle_data_pages(&mut self) {
        // 先检测是否需要munmap
        for (idx, area) in self.areas.iter_mut().enumerate() {
            if area.area_type == MapAreaType::Mmap {
                if area.mmap_flags.contains(MmapFlags::MAP_SHARED)
                    && area.map_perm.contains(MapPermission::W)
                {
                    let addr: VirtAddr = area.vpn_range.start().into();
                    let mapped_len: usize = area
                        .vpn_range
                        .into_iter()
                        .filter(|vpn| area.data_frames.contains_key(&vpn))
                        .count()
                        * PAGE_SIZE;
                    let file = area.mmap_file.file.clone().unwrap();
                    file.write(UserBuffer {
                        buffers: translated_byte_buffer(
                            self.page_table.token(),
                            addr.0 as *const u8,
                            mapped_len,
                        ),
                    });
                }
            }
        }
        self.areas.clear();
    }
}

#[allow(unused)]
///Check PageTable running correctly
pub fn remap_test() {
    println!("remap test start!");
    let mut kernel_space = KERNEL_SPACE.lock();
    let mid_text: VirtAddr = (stext as usize + (etext as usize - stext as usize) / 2).into();
    let mid_rodata: VirtAddr =
        (srodata as usize + (erodata as usize - srodata as usize) / 2).into();
    let mid_data: VirtAddr = (sdata as usize + (edata as usize - sdata as usize) / 2).into();
    assert!(!kernel_space
        .page_table
        .translate(mid_text.floor())
        .unwrap()
        .writable(),);
    assert!(!kernel_space
        .page_table
        .translate(mid_rodata.floor())
        .unwrap()
        .writable(),);
    assert!(!kernel_space
        .page_table
        .translate(mid_data.floor())
        .unwrap()
        .executable(),);
    println!("remap_test passed!");
}
