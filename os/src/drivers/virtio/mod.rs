mod blk;

pub use blk::*;

use spin::Mutex;
use virtio_drivers::Hal;

use crate::{
    config::mm::KERNEL_ADDR_OFFSET,
    drivers::DevError,
    fs::BlockDevice,
    mm::{
        frame_alloc, frame_dealloc, FrameTracker, KernelAddr, PageTable, PhysAddr, PhysPageNum,
        StepByOne, VirtAddr,
    },
    task::current_token,
};
use alloc::{sync::Arc, vec::Vec};
use lazy_static::*;
lazy_static! {
    /// 实现 Trait BlockDevice时对内部操作加锁
    // pub static ref BLOCK_DEVICE: Arc<dyn BlockDevice> = Arc::new(BlockDeviceImpl::new());
    static ref QUEUE_FRAMES: Mutex<Vec<Arc<FrameTracker>>> = Mutex::new(Vec::new());
}

pub struct VirtIoHalImpl;

impl Hal for VirtIoHalImpl {
    fn dma_alloc(pages: usize) -> usize {
        let mut ppn_base = PhysPageNum(0);
        for i in 0..pages {
            let frame = frame_alloc().unwrap();
            if i == 0 {
                ppn_base = frame.ppn;
            }
            assert_eq!(frame.ppn.0, ppn_base.0 + i);
            QUEUE_FRAMES.lock().push(frame);
        }
        let pa: PhysAddr = ppn_base.into();
        pa.0
    }

    fn dma_dealloc(pa: usize, pages: usize) -> i32 {
        let pa = PhysAddr::from(pa);
        let mut ppn_base: PhysPageNum = pa.into();
        for _ in 0..pages {
            frame_dealloc(ppn_base);
            ppn_base.step();
        }
        0
    }

    fn phys_to_virt(addr: usize) -> usize {
        KernelAddr::from(PhysAddr::from(addr)).0
    }

    fn virt_to_phys(vaddr: usize) -> usize {
        PageTable::from_token(current_token())
            .translate_va(VirtAddr::from(vaddr))
            .unwrap()
            .0
    }
}

#[allow(dead_code)]
const fn as_dev_err(e: virtio_drivers::Error) -> DevError {
    use virtio_drivers::Error::*;
    match e {
        NotReady => DevError::Again,
        AlreadyUsed => DevError::AlreadyExists,
        InvalidParam => DevError::InvalidParam,
        DmaError => DevError::NoMemory,
        IoError => DevError::Io,
        _ => DevError::BadState,
    }
}
