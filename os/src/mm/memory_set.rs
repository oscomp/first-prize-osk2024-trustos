//! Implementation of [`MapArea`] and [`MemorySet`].
use super::{
    frame_alloc, translated_byte_buffer, FrameTracker, KernelAddr, MapArea, MapAreaType,
    MapPermission, MapType, MmapPageFaultHandler, PTEFlags, PageFaultHandler, PageTable,
    PageTableEntry, PhysAddr, PhysPageNum, StepByOne, UserBuffer, VPNRange, VirtAddr, VirtPageNum,
};
use crate::{
    config::{
        board::{MEMORY_END, MMIO},
        mm::{
            KERNEL_ADDR_OFFSET, KERNEL_PGNUM_OFFSET, MMAP_TOP, PAGE_SIZE, USER_HEAP_SIZE,
            USER_SPACE_SIZE, USER_STACK_SIZE, USER_TRAP_CONTEXT,
        },
    },
    fs::RFile,
    mm::flush_tlb,
    syscall::MmapFlags,
};
use alloc::{collections::BTreeMap, sync::Arc, vec::Vec};
use core::arch::asm;
use lazy_static::*;
use log::{debug, info};
use riscv::register::satp;
use spin::Mutex;

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
    // fn strampoline();
}

lazy_static! {
    /// a memory set instance through lazy_static! managing kernel space
    pub static ref KERNEL_SPACE: Mutex<MemorySet> =
         Mutex::new(MemorySet::new_kernel()) ;
}
///Get kernelspace root ppn
pub fn kernel_token() -> usize {
    KERNEL_SPACE.lock().token()
}
/// memory set structure, controls virtual-memory space
/// 地址空间
pub struct MemorySet {
    pub page_table: PageTable,
    areas: Vec<MapArea>,
}

impl MemorySet {
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
    /// mmap
    pub fn mmap(
        &mut self,
        addr: usize,
        len: usize,
        map_perm: MapPermission,
        flags: MmapFlags,
        file: Arc<RFile>,
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
                Arc::new(MmapPageFaultHandler {}),
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
                Arc::new(MmapPageFaultHandler {}),
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
                let file = area_inner.file.clone().unwrap();
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
    pub fn mmap_page_fault(&mut self, vpn: VirtPageNum) -> bool {
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
            let handler = area_inner.page_fault_handler.as_ref().unwrap().clone();
            handler.handle_page_fault(vpn.into(), &mut self.page_table, Some(area_inner));
            true
        } else {
            false
        }
    }
    pub fn cow_page_fault(&mut self, vpn: VirtPageNum) -> bool {
        let area = self
            .areas
            .iter_mut()
            .filter(|area| area.area_type == MapAreaType::Elf || area.area_type == MapAreaType::Brk)
            .find(|area| {
                let (start, end) = area.vpn_range.range();
                start <= vpn && vpn < end
            });

        if area.is_some() && self.page_table.translate(vpn).unwrap().is_cow() {
            let area_inner = area.unwrap();
            let handler = area_inner.page_fault_handler.as_ref().unwrap().clone();
            handler.handle_page_fault(vpn.into(), &mut self.page_table, Some(area_inner));
            true
        } else {
            false
        }
    }
    fn push(&mut self, mut map_area: MapArea, data: Option<&[u8]>) {
        map_area.map(&mut self.page_table);
        if let Some(data) = data {
            map_area.copy_data(&mut self.page_table, data);
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
    /// Without kernel stacks.
    pub fn new_kernel() -> Self {
        let mut memory_set = Self::new_bare();
        println!("kernel satp: {:#x}", memory_set.page_table.token());
        // map kernel sections
        println!(".text [{:#x}, {:#x})", stext as usize, etext as usize);
        println!(".rodata [{:#x}, {:#x})", srodata as usize, erodata as usize);
        println!(".data [{:#x}, {:#x})", sdata as usize, edata as usize);
        println!(
            ".bss [{:#x}, {:#x})",
            sbss_with_stack as usize, ebss as usize
        );
        println!("mapping .text section");
        memory_set.push(
            MapArea::new(
                (stext as usize).into(),
                (etext as usize).into(),
                MapType::Direct,
                MapPermission::R | MapPermission::X,
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
    pub fn from_elf(elf_data: &[u8]) -> (Self, usize, usize, usize) {
        let mut memory_set = Self::new_from_kernel();
        // debug!("from_elf new stap={:#x}", memory_set.page_table.token());
        // map program headers of elf, with U flag
        let elf = xmas_elf::ElfFile::new(elf_data).unwrap();
        let elf_header = elf.header;
        let magic = elf_header.pt1.magic;
        assert_eq!(magic, [0x7f, 0x45, 0x4c, 0x46], "invalid elf!");
        let ph_count = elf_header.pt2.ph_count();
        let mut max_end_vpn = VirtPageNum(0);
        for i in 0..ph_count {
            let ph = elf.program_header(i).unwrap();
            if ph.get_type().unwrap() == xmas_elf::program::Type::Load {
                let start_va: VirtAddr = (ph.virtual_addr() as usize).into();
                let end_va: VirtAddr = ((ph.virtual_addr() + ph.mem_size()) as usize).into();
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
                max_end_vpn = map_area.vpn_range.end();
                memory_set.push(
                    map_area,
                    Some(&elf.input[ph.offset() as usize..(ph.offset() + ph.file_size()) as usize]),
                );
            }
        }
        //map user heap
        let max_end_va: VirtAddr = max_end_vpn.into();
        let mut user_heap_bottom: usize = max_end_va.into();
        //guard page
        user_heap_bottom += PAGE_SIZE;
        let user_heap_top: usize = user_heap_bottom + USER_HEAP_SIZE;
        memory_set.push(
            MapArea::new(
                user_heap_bottom.into(),
                user_heap_top.into(),
                MapType::Framed,
                MapPermission::R | MapPermission::W | MapPermission::U,
                MapAreaType::Brk,
            ),
            None,
        );

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
        (
            memory_set,
            user_stack_top,
            user_heap_bottom,
            elf.header.pt2.entry_point() as usize,
        )
    }
    ///Clone a same `MemorySet`
    pub fn from_existed_user(user_space: &mut MemorySet, copy_user_stack: bool) -> MemorySet {
        let mut memory_set = Self::new_from_kernel();
        // copy data sections/trap_context/user_stack
        for area in user_space.areas.iter() {
            // don't copy kernel stack
            if area.area_type == MapAreaType::Stack && !area.map_perm.contains(MapPermission::U) {
                continue;
            }
            if !copy_user_stack && area.area_type == MapAreaType::Stack {
                continue;
            }
            let mut new_area = MapArea::from_another(area);
            /// Mmap是lazy allocation
            if area.area_type == MapAreaType::Mmap {
                memory_set.push_lazily(new_area);
                continue;
            }
            let mut page_table = &mut user_space.page_table;
            ///ELF和Brk是cow
            if area.area_type == MapAreaType::Elf || area.area_type == MapAreaType::Brk {
                for vpn in area.vpn_range {
                    let pte = page_table.translate(vpn).unwrap();
                    let pte_flags = pte.flags() & !PTEFlags::W;
                    let src_ppn = pte.ppn();
                    //清空可写位，设置COW位
                    //下面两步不合起来是因为flags只有8位，全都用掉了
                    //所以Cow位没有放到flags里面
                    page_table.set_flags(vpn, pte_flags);
                    page_table.set_cow(vpn);
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
                    let file = area.file.clone().unwrap();
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
