use crate::mm::{translated_byte_buffer, translated_ref, UserBuffer};
use crate::syscall::SigSet;
use crate::task::{current_task, current_token};
use crate::timer::{
    get_time_spec, Clockid, Itimerval, Rusage, TimeVal, Timespec, Tms, ITIMER_REAL,
};
use crate::utils::{SysErrNo, SyscallRet};
use core::mem::size_of;
use log::debug;

pub fn sys_gettimeofday(ts: *const u8) -> SyscallRet {
    let token = current_token();

    let mut ts = UserBuffer::new(translated_byte_buffer(token, ts, size_of::<Timespec>()).unwrap());
    let timespec = get_time_spec();
    ts.write(timespec.as_bytes());
    Ok(0)
}

pub fn sys_times(tms: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    let mut tms = UserBuffer::new(translated_byte_buffer(token, tms, size_of::<Tms>()).unwrap());
    let times = Tms::new(&inner.time_data);
    tms.write(times.as_bytes());
    Ok(0)
}

pub fn sys_settimer(which: usize, new_value: *const u8, old_value: *const u8) -> SyscallRet {
    assert!(which == ITIMER_REAL, "only support Itimer Real");
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    debug!(
        "[sys_settimer] which is {}, new_value is {},old_value is {}",
        which, new_value as usize, old_value as usize
    );

    if old_value as usize != 0 {
        let mut buffer = UserBuffer::new(
            translated_byte_buffer(token, old_value, size_of::<Itimerval>()).unwrap(),
        );
        buffer.write((*task_inner.timer.get_ref()).timer.as_bytes());
    }
    if new_value as usize != 0 {
        let timer_inner = task_inner.timer.get_mut();
        let new_timer = translated_ref(token, new_value as *const Itimerval);

        debug!(
            "set new timer : value: {}s + {}us, interval: {}s + {}us",
            new_timer.it_value.tv_sec,
            new_timer.it_value.tv_usec,
            new_timer.it_interval.tv_sec,
            new_timer.it_interval.tv_usec
        );

        (*timer_inner).timer = *new_timer;
        timer_inner.last_time = TimeVal::now();
        if new_timer.it_value == TimeVal::new(0, 0) {
            task_inner.sig_pending.get_mut().pending |= SigSet::SIGALRM;
            timer_inner.if_first = false;
        } else {
            timer_inner.if_first = true;
        }
    }
    Ok(0)
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
    let inner = task.inner_lock();
    let token = inner.user_token();

    // debug!(
    //     "[sys_clock_gettime] clockid is {}, tp is {:x}",
    //     clockid, tp as usize
    // );

    let clockid = Clockid::from_bits(clockid as u32).unwrap();
    let mut tp = UserBuffer::new(translated_byte_buffer(token, tp, size_of::<Timespec>()).unwrap());

    match clockid {
        //当前可匹配实时时钟，单调时钟，进程CPU时钟，且三者返回值相同
        Clockid::CLOCK_REALTIME | Clockid::CLOCK_MONOTONIC | Clockid::CLOCK_PROCESS_CPUTIME_ID => {
            let timespec = get_time_spec();
            //debug!("got timespec {:?}", timespec);
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
    let inner = task.inner_lock();
    let token = inner.user_token();

    // debug!(
    //     "[sys_getrusage] who is {}, usage is {:x}",
    //     who, usage as usize
    // );

    let mut usage =
        UserBuffer::new(translated_byte_buffer(token, usage, size_of::<Rusage>()).unwrap());

    match who {
        RUSAGESELF => {
            let gotusage = Rusage::new_from_ms(
                inner.time_data.utime as usize,
                inner.time_data.stime as usize,
            );
            // debug!(
            //     "got utime {:?}, stime {:?}",
            //     gotusage.ru_utime, gotusage.ru_stime
            // );
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

pub fn sys_clock_getres(clockid: usize, res: *const u8) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    // debug!(
    //     "[sys_clock_getres] clockid is {}, res is {:x}",
    //     clockid, res as usize
    // );

    let clockid = Clockid::from_bits(clockid as u32).unwrap();
    let mut res =
        UserBuffer::new(translated_byte_buffer(token, res, size_of::<Timespec>()).unwrap());

    match clockid {
        //当前可匹配实时时钟，单调时钟，进程CPU时钟，且三者返回值相同
        Clockid::CLOCK_REALTIME | Clockid::CLOCK_MONOTONIC | Clockid::CLOCK_PROCESS_CPUTIME_ID => {
            let timespec = Timespec::new(0, 1);
            res.write(timespec.as_bytes());
            Ok(0)
        }
        _ => return Err(SysErrNo::EINVAL),
    }
}
