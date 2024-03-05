//! Implementation of [`TrapContext`]
use riscv::register::sstatus::{self, Sstatus, SPP};

#[repr(C)]
#[derive(Debug)]
///trap context structure containing sstatus, sepc and registers
pub struct TrapContext {
    /// user trap to kernel need to save those regs
    /// general regs[0..31]
    pub x: [usize; 32],
    /// CSR sstatus      
    pub sstatus: Sstatus, // 32
    /// CSR sepc
    pub sepc: usize, // 33
    /// kernel return to user need to save those regs
    pub kernel_sp: usize, // 34
    pub kernel_ra: usize,      // 35 trap_handler
    pub kernel_s: [usize; 12], // 36 - 47
    pub kernel_fp: usize,      // 48
    /// kernel hart address
    pub kernel_tp: usize, // 49
}

impl TrapContext {
    ///set stack pointer to x_2 reg (sp)
    pub fn set_sp(&mut self, sp: usize) {
        self.x[2] = sp;
    }
    ///init app context
    pub fn app_init_context(
        entry: usize,
        sp: usize,
        kernel_sp: usize,
        trap_handler: usize,
    ) -> Self {
        let mut sstatus = sstatus::read();
        sstatus.set_spp(SPP::User);
        let mut cx = Self {
            x: [0; 32],
            sstatus,
            sepc: entry,
            kernel_sp,
            kernel_ra: trap_handler,
            kernel_s: [0; 12],
            kernel_fp: 0,
            kernel_tp: 0,
        };
        cx.set_sp(sp);
        cx
    }
    // pub fn app_init_context(
    //     entry: usize,
    //     sp: usize,
    //     kernel_satp: usize,
    //     kernel_sp: usize,
    //     trap_handler: usize,
    // ) -> Self {
    //     let mut sstatus = sstatus::read();
    //     // set CPU privilege to User after trapping back
    //     sstatus.set_spp(SPP::User);
    //     let mut cx = Self {
    //         x: [0; 32],
    //         sstatus,
    //         sepc: entry,
    //         kernel_satp,
    //         kernel_sp,
    //         trap_handler,
    //     };
    //     cx.set_sp(sp);
    //     cx
    // }
}
