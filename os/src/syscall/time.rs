use crate::mm::{get_data, put_data};
use crate::task::current_task;
use crate::timer::{get_time_spec, Itimerval, Rusage, TimeVal, Timespec, Tms, ITIMER_REAL};
use crate::utils::{SysErrNo, SyscallRet};
use log::debug;

pub fn sys_gettimeofday(ts: *mut Timespec) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    put_data(token, ts, get_time_spec());
    Ok(0)
}

pub fn sys_times(tms: *mut Tms) -> SyscallRet {
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    put_data(token, tms, Tms::new(&task_inner.time_data));
    Ok(0)
}

pub fn sys_settimer(
    which: usize,
    new_value: *const Itimerval,
    old_value: *mut Itimerval,
) -> SyscallRet {
    assert!(which == ITIMER_REAL, "only support Itimer Real");
    let task = current_task().unwrap();
    let task_inner = task.inner_lock();
    let token = task_inner.user_token();

    debug!(
        "[sys_settimer] which is {}, new_value is {},old_value is {}",
        which, new_value as usize, old_value as usize
    );

    if old_value as usize != 0 {
        put_data(token, old_value, task_inner.timer.timer());
    }
    if new_value as usize != 0 {
        let new_timer = get_data(token, new_value);

        task_inner.timer.set_timer(new_timer);
        task_inner.timer.set_last_time(TimeVal::now());
        if new_timer.it_value == TimeVal::new(0, 0) {
            // task_inner.sig_pending |= SigSet::SIGALRM;
            task_inner.timer.set_first_trigger(false);
        } else {
            task_inner.timer.set_first_trigger(true);
        }
    }
    Ok(0)
}

pub fn sys_clock_gettime(_clockid: usize, tp: *mut Timespec) -> SyscallRet {
    let task = current_task().unwrap();
    let inner = task.inner_lock();

    let token = inner.user_token();
    let time = get_time_spec();

    put_data(token, tp, time);
    // debug!(
    //     "[sys_clock_gettime] clockid is {}, time={:?}",
    //     clockid, time
    // );
    Ok(0)
}

pub fn sys_getrusage(who: isize, usage: *mut Rusage) -> SyscallRet {
    const RUSAGESELF: isize = 0;
    const RUSAGECHILDEN: isize = -1;

    let task = current_task().unwrap();
    let inner = task.inner_lock();
    let token = inner.user_token();

    // debug!(
    //     "[sys_getrusage] who is {}, usage is {:x}",
    //     who, usage as usize
    // );

    match who {
        RUSAGESELF => {
            let gotusage = Rusage::new_from_ms(
                inner.time_data.utime as usize,
                inner.time_data.stime as usize,
            );
            put_data(token, usage, gotusage);
            Ok(0)
        }
        RUSAGECHILDEN => {
            let gotusage = Rusage::new_from_ms(
                inner.time_data.cutime as usize,
                inner.time_data.cstime as usize,
            );
            put_data(token, usage, gotusage);
            Ok(0)
        }
        _ => return Err(SysErrNo::EINVAL),
    }
}

pub fn sys_clock_getres(_clockid: usize, _res: *mut Timespec) -> SyscallRet {
    unimplemented!();
}
