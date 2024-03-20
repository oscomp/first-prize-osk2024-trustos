//! Trap handling functionality
//!
//! For rCore, we have a single trap entry point, namely `__alltraps`. At
//! initialization in [`init()`], we set the `stvec` CSR to point to it.
//!
//! All traps go through `__alltraps`, which is defined in `trap.S`. The
//! assembly language code does just enough work restore the kernel space
//! context, ensuring that Rust code safely runs, and transfers control to
//! [`trap_handler()`].
//!
//! It then calls different functionality based on what exactly the exception
//! was. For example, timer interrupts trigger task preemption, and syscalls go
//! to [`syscall()`].
mod context;

use crate::config::mm::TRAMPOLINE;
use crate::sync::interrupt_on;
use crate::syscall::syscall;
use crate::task::{current_task,current_trap_cx, exit_current_and_run_next, suspend_current_and_run_next};
use crate::timer::set_next_trigger;
use crate::utils::hart_id;
use core::arch::{asm, global_asm};
use log::{debug, info};
use riscv::register::{
    mtvec::TrapMode,
    scause::{self, Exception, Interrupt, Trap},
    sie, stval, stvec,
};

global_asm!(include_str!("trap.S"));

extern "C" {
    fn __trap_from_user();
}
/// initialize CSR `stvec` as the entry of `__alltraps`
pub fn init() {
    set_kernel_trap_entry();
}

fn set_kernel_trap_entry() {
    unsafe {
        stvec::write(trap_from_kernel as usize, TrapMode::Direct);
    }
}

fn set_user_trap_entry() {
    unsafe {
        stvec::write(__trap_from_user as usize, TrapMode::Direct);
    }
}
/// enable timer interrupt in sie CSR
pub fn enable_timer_interrupt() {
    unsafe {
        sie::set_stimer();
    }
}

#[no_mangle]
/// handle an interrupt, exception, or system call from user space
pub fn trap_handler() {
    //记录用户空间花费CPU时间，同时准备内核空间花费CPU时间
    current_task().unwrap().inner_lock().time_data.update_utime();

    let hartid = hart_id();
    // debug!("trap handler");
    set_kernel_trap_entry();
    let scause = scause::read();
    let stval = stval::read();
    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // jump to next instruction anyway
            let mut cx = current_trap_cx();
            cx.sepc += 4;
            // debug!("run syscall {}", cx.x[17]);
            // get system call return value
            let result = syscall(
                cx.x[17],
                [
                    cx.x[10] as isize,
                    cx.x[11] as isize,
                    cx.x[12] as isize,
                    cx.x[13] as isize,
                    cx.x[14] as isize,
                    cx.x[15] as isize,
                ],
            );
            // cx is changed during sys_exec, so we have to call it again
            cx = current_trap_cx();
            cx.x[10] = result as usize;
        }
        Trap::Exception(Exception::StoreFault)
        | Trap::Exception(Exception::StorePageFault)
        | Trap::Exception(Exception::InstructionFault)
        | Trap::Exception(Exception::InstructionPageFault)
        | Trap::Exception(Exception::LoadFault)
        | Trap::Exception(Exception::LoadPageFault) => {
            println!(
                "[kernel] hart {} {:?} in application, bad addr = {:#x}, bad instruction = {:#x}, kernel killed it.",
                hartid,
                scause.cause(),
                stval,
                current_trap_cx().sepc,
            );
            // page fault exit code
            exit_current_and_run_next(-2);
        }
        Trap::Exception(Exception::IllegalInstruction) => {
            println!(
                "[kernel] [hart {}] IllegalInstruction in application, kernel killed it.",
                hartid
            );
            // illegal instruction exit code
            exit_current_and_run_next(-3);
        }
        Trap::Interrupt(Interrupt::SupervisorTimer) => {
            // println!("Timer Interupt!");
            set_next_trigger();
            suspend_current_and_run_next();
        }
        _ => {
            panic!(
                "Unsupported trap {:?}, stval = {:#x}!",
                scause.cause(),
                stval
            );
        }
    }

    //记录内核空间花费CPU时间，同时准备用户空间花费CPU时间
    current_task().unwrap().inner_lock().time_data.update_stime();

    // debug!("in trap handler,return to user space");
    // 手动内联trap_return
    set_user_trap_entry();
    extern "C" {
        #[allow(improper_ctypes)]
        fn __return_to_user(cx: *mut TrapContext);
    }
    unsafe {
        // 方便调试进入__return_to_user
        let trap_cx = current_trap_cx();
        __return_to_user(trap_cx);
    }
}

pub use context::TrapContext;

#[no_mangle]
/// set the new addr of __restore asm function in TRAMPOLINE page,
/// set the reg a0 = trap_cx_ptr, reg a1 = phy addr of usr page table,
/// finally, jump to new addr of __restore asm function
pub fn trap_return_for_new_task_once() {
    set_user_trap_entry();
    extern "C" {
        #[allow(improper_ctypes)]
        fn __return_to_user_for_new_task_once(cx: *mut TrapContext);
    }
    unsafe {
        __return_to_user_for_new_task_once(current_trap_cx());
    }
}

#[no_mangle]
/// Unimplement: traps/interrupts/exceptions from kernel mode
/// Todo: Chapter 9: I/O device
pub fn trap_from_kernel() -> ! {
    debug!("trap from kernel!");
    use riscv::register::sepc;
    panic!(
        "stval = {:#x}, sepc = {:#x}\n
        a trap {:?} from kernel!",
        stval::read(),
        sepc::read(),
        scause::read().cause()
    );
}
