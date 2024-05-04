//! RISC-V timer-related functionality

use crate::config::board::CLOCK_FREQ;
use crate::sbi::set_timer;
use riscv::register::time;

const TICKS_PER_SEC: usize = 100;
const MSEC_PER_SEC: usize = 1000;

#[derive(Debug, Clone, Copy)]
pub struct Timespec {
    pub tv_sec: usize,  //秒
    pub tv_nsec: usize, //纳秒
}

impl Timespec {
    pub fn new(sec: usize, nsec: usize) -> Self {
        Self {
            tv_sec: sec,
            tv_nsec: nsec,
        }
    }
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as usize as *const u8, size) }
    }
}

pub struct Tms {
    pub tms_utime: isize,  //用户模式下花费的CPU时间
    pub tms_stime: isize,  //内核模式下花费的CPU时间
    pub tms_cutime: isize, //子进程在用户模式下花费的CPU时间
    pub tms_cstime: isize, //子进程在内核模式下花费的CPU时间
}

impl Tms {
    pub fn new(time_data: &TimeData) -> Self {
        Self {
            tms_utime: time_data.utime,
            tms_stime: time_data.stime,
            tms_cutime: time_data.cutime,
            tms_cstime: time_data.cstime,
        }
    }
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as usize as *const u8, size) }
    }
}

pub struct TimeData {
    pub utime: isize,
    pub stime: isize,
    pub cutime: isize,
    pub cstime: isize,
    pub lasttime: isize,
}

impl TimeData {
    pub fn new() -> Self {
        let now = (get_time_ms()) as isize;
        Self {
            utime: 0,
            stime: 0,
            cutime: 0,
            cstime: 0,
            lasttime: now,
        }
    }
    pub fn update_utime(&mut self) {
        let now = time::read() as isize;
        let duration = now - self.lasttime;
        self.utime += duration;
        self.lasttime = now;
    }
    pub fn update_stime(&mut self) {
        let now = time::read() as isize;
        let duration = now - self.lasttime;
        self.stime += duration;
        self.lasttime = now;
    }
    pub fn clear(&mut self) {
        let now = time::read() as isize;
        self.utime = 0;
        self.stime = 0;
        self.cutime = 0;
        self.cstime = 0;
        self.lasttime = now;
    }
}

///get current time
pub fn get_time() -> usize {
    time::read()
}
/// get current time in microseconds
pub fn get_time_ms() -> usize {
    time::read() / (CLOCK_FREQ / MSEC_PER_SEC)
}
/// set the next timer interrupt
pub fn set_next_trigger() {
    set_timer(get_time() + CLOCK_FREQ / TICKS_PER_SEC);
}
