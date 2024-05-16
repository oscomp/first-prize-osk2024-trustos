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

use crate::{
    mm::{VirtAddr, VirtPageNum},
    signal::check_signal_for_current_task,
    syscall::{syscall, Syscall},
    task::{
        current_task, current_trap_cx, exit_current_and_run_next, suspend_current_and_run_next,
    },
    timer::set_next_trigger,
    utils::{backtrace, hart_id},
};
use core::arch::{asm, global_asm};
use log::{debug, info, warn};
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
    current_task()
        .unwrap()
        .inner_lock()
        .time_data
        .update_utime();

    let strace_mask = current_task().unwrap().inner_lock().strace_mask;

    let hartid = hart_id();

    set_kernel_trap_entry();
    let scause = scause::read();
    let stval = stval::read();
    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // jump to next instruction anyway
            let mut cx = current_trap_cx();
            cx.sepc += 4;
            let syscall_id = Syscall::from(cx.x[17]);
            // get system call return value
            let result = syscall(
                cx.x[17],
                [cx.x[10], cx.x[11], cx.x[12], cx.x[13], cx.x[14], cx.x[15]],
            );
            // cx is changed during sys_exec, so we have to call it again
            cx = current_trap_cx();
            cx.x[10] = match result {
                Ok(res) => res,
                Err(errno) => (-1isize) as usize,
            };
            // handle error
            match result {
                Ok(ret) => debug!("[syscall ret] {:?} ret = {}", syscall_id, ret),
                Err(errno) => debug!("[syscall ret] {:?} ret = {}", syscall_id, errno.str()),
            }
            // strace
            if strace_mask != 0 && (strace_mask == usize::MAX || strace_mask == cx.x[17]) {
                info!(
                    "[strace] syscall {} {:?} -> {}",
                    cx.x[17], syscall_id, cx.x[10]
                );
            } else {
                if syscall_id == Syscall::Default {
                    info!("[strace] unknown syscall id {} -> {}", cx.x[17], cx.x[10]);
                }
            }
        }
        Trap::Exception(Exception::StorePageFault) | Trap::Exception(Exception::LoadPageFault) => {
            // page fault
            let mut ok: bool = false;
            {
                let task = current_task().unwrap();
                let mut task_inner = task.inner_lock();
                ok = task_inner
                    .memory_set
                    .lazy_page_fault(VirtAddr::from(stval).floor(), scause.cause());
                ok |= task_inner
                    .memory_set
                    .cow_page_fault(VirtAddr::from(stval).floor(), scause.cause());

                // drop task inner and task to avoid deadlock and exit exception
            }
            if (!ok) {
                println!(
                "[kernel] hart {} {:?} in application, bad addr = {:#x}, bad instruction = {:#x}, kernel killed it.",
                hartid,
                scause.cause(),
                stval,
                current_trap_cx().sepc,
            );
                // page fault exit code
                // exit_current_and_run_next(-2);
                exit_current_and_run_next(-2);
            }
        }
        Trap::Exception(Exception::StoreFault)
        | Trap::Exception(Exception::InstructionFault)
        | Trap::Exception(Exception::LoadFault)
        | Trap::Exception(Exception::InstructionPageFault) => {
            println!(
                "[kernel] hart {} {:?} in application, bad addr = {:#x}, bad instruction = {:#x}, kernel killed it.",
                hartid,
                scause.cause(),
                stval,
                current_trap_cx().sepc,
            );
            // page fault exit code
            // exit_current_and_run_next(-2);
            exit_current_and_run_next(-2);
        }
        Trap::Exception(Exception::IllegalInstruction) => {
            backtrace();
            println!(
                "[kernel] [hart {}] IllegalInstruction at {:#x} in application, kernel killed it.",
                hartid,
                current_trap_cx().sepc,
            );
            // illegal instruction exit code
            // exit_current_and_run_next(-3);
            exit_current_and_run_next(-3);
        }
        Trap::Interrupt(Interrupt::SupervisorTimer) => {
            debug!("Timer Interupt!");
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

    check_signal_for_current_task();

    //记录内核空间花费CPU时间，同时准备用户空间花费CPU时间
    current_task()
        .unwrap()
        .inner_lock()
        .time_data
        .update_stime();

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
pub fn trap_from_kernel() -> ! {
    use riscv::register::sepc;
    backtrace();
    let stval = stval::read();
    let sepc = sepc::read();
    let stval_vpn = VirtPageNum::from(VirtAddr::from(stval));
    let sepc_vpn = VirtPageNum::from(VirtAddr::from(sepc));
    panic!(
        "stval = {:#x}(vpn {}), sepc = {:#x}(vpn{}),
        a trap {:?} from kernel!",
        stval,
        stval_vpn.0,
        sepc,
        sepc_vpn.0,
        scause::read().cause()
    );
}
