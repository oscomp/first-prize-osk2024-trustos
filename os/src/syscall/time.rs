use crate::mm::{
    translated_byte_buffer, translated_ref, translated_refmut, translated_str, UserBuffer, VirtAddr,
};
use crate::task::{current_task, current_token};
use crate::timer::{get_time_ms, get_time_spec, Clockid, Itimerval, Rusage, Timespec, Tms};
use crate::utils::{SysErrNo, SyscallRet};
use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec::Vec;
use core::mem::size_of;
use log::{debug, info};

pub fn sys_gettimeofday(ts: *const u8) -> SyscallRet {
    let token = current_token();

    let mut ts = UserBuffer::new(translated_byte_buffer(token, ts, size_of::<Timespec>()));
    let timespec = get_time_spec();
    ts.write(timespec.as_bytes());
    Ok(0)
}

pub fn sys_times(tms: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut tms = UserBuffer::new(translated_byte_buffer(token, tms, size_of::<Tms>()));
    let mut times = Tms::new(&inner.time_data);
    tms.write(times.as_bytes());
    Ok(0)
}

pub fn sys_settimmer(
    which: usize,
    new_value: *const Itimerval,
    old_value: *const Itimerval,
) -> SyscallRet {
    todo!()
}
/*//暂时没办法实现，无法修改csr
pub fn sys_clock_settime(clockid: usize, tp: *const u8) -> isize {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let clockid = Clockid::from_bits(clockid as u32).unwrap();
    let tp = translated_ref(token, tp as *const Timespec);

    match clockid {
        //当前可匹配实时时钟，单调时钟，进程CPU时钟，且三者返回值相同
        Clockid::CLOCK_REALTIME | Clockid::CLOCK_MONOTONIC | Clockid::CLOCK_PROCESS_CPUTIME_ID => {
            //修改csr
            0
        }
        _ => -1,
    }
}
*/
pub fn sys_clock_gettime(clockid: usize, tp: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let clockid = Clockid::from_bits(clockid as u32).unwrap();
    let mut tp = UserBuffer::new(translated_byte_buffer(token, tp, size_of::<Timespec>()));

    match clockid {
        //当前可匹配实时时钟，单调时钟，进程CPU时钟，且三者返回值相同
        Clockid::CLOCK_REALTIME | Clockid::CLOCK_MONOTONIC | Clockid::CLOCK_PROCESS_CPUTIME_ID => {
            let time = get_time_ms();
            let mut timespec = Timespec::new(time / 1000, (time % 1000) * 1000000);
            tp.write(timespec.as_bytes());
            Ok(0)
        }
        _ => return Err(SysErrNo::EINVAL),
    }
}

const RUSAGESELF: isize = 0;
const RUSAGECHILDEN: isize = -1;

pub fn sys_getrusage(who: isize, usage: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    let token = inner.user_token();

    let mut usage = UserBuffer::new(translated_byte_buffer(token, usage, size_of::<Rusage>()));

    match who {
        RUSAGESELF => {
            let gotusage = Rusage::new_from_ms(
                inner.time_data.utime as usize,
                inner.time_data.stime as usize,
            );
            usage.write(gotusage.as_bytes());
            Ok(0)
        }
        RUSAGECHILDEN => {
            let gotusage = Rusage::new_from_ms(
                inner.time_data.cutime as usize,
                inner.time_data.cstime as usize,
            );
            usage.write(gotusage.as_bytes());
            Ok(0)
        }
        _ => return Err(SysErrNo::EINVAL),
    }
}
