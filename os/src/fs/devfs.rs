use crate::fs::FileClass;
use crate::mm::{translated_byte_buffer, UserBuffer};
use crate::syscall::IoctlCommand;
use crate::task::{current_task, INITPROC};
use alloc::fmt::{Debug, Formatter};
use alloc::format;
use alloc::sync::Arc;
use core::cmp::min;
use core::mem::size_of;

use super::{File, OpenFlags};

pub struct DevZero;
pub struct DevNull;
pub struct DevRtc;
pub struct DevRandom;

pub struct DevTty;

pub fn open_device_file(path: &str) -> Option<Arc<dyn File + Send + Sync>> {
    // warning: just a fake implementation
    if path.ends_with("zero") {
        Some(Arc::new(DevZero::new()))
    } else if path.ends_with("null") {
        Some(Arc::new(DevNull::new()))
    } else if path.ends_with("rtc") || path.ends_with("rtc0") {
        Some(Arc::new(DevRtc::new()))
    } else if path.ends_with("random") {
        Some(Arc::new(DevRandom::new()))
    } else if path.ends_with("tty") {
        Some(Arc::new(DevTty::new()))
    } else {
        None
    }
}

impl DevZero {
    pub fn new() -> Self {
        Self
    }
}

impl File for DevZero {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut user_buf: UserBuffer) -> usize {
        user_buf.fill0()
    }
    fn write(&self, user_buf: UserBuffer) -> usize {
        // do nothing
        user_buf.len()
    }
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        -1
    }
}

impl DevNull {
    pub fn new() -> Self {
        Self
    }
}

impl File for DevNull {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut _user_buf: UserBuffer) -> usize {
        // do nothing
        0
    }
    fn write(&self, user_buf: UserBuffer) -> usize {
        // do nothing
        user_buf.len()
    }
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        -1
    }
}

pub struct RtcTime {
    pub year: u32,
    pub month: u8,
    pub day: u8,
    pub hour: u8,
    pub minute: u8,
    pub second: u8,
}

impl RtcTime {
    pub fn new(year: u32, month: u8, day: u8, hour: u8, minute: u8, second: u8) -> Self {
        Self {
            year,
            month,
            day,
            hour,
            minute,
            second,
        }
    }
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as usize as *const u8, size) }
    }
}

impl Debug for RtcTime {
    fn fmt(&self, f: &mut Formatter<'_>) -> core::fmt::Result {
        write!(
            f,
            "{}-{}-{} {}:{}:{}",
            self.year, self.month, self.day, self.hour, self.minute, self.second
        )
    }
}

impl DevRtc {
    pub fn new() -> Self {
        Self
    }
}

impl File for DevRtc {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut user_buf: UserBuffer) -> usize {
        let time = RtcTime::new(2000, 1, 1, 0, 0, 0);
        let str = format!("{:?}", time);
        let bytes = str.as_bytes();
        let len = min(user_buf.len(), bytes.len());
        user_buf.write(bytes);
        len
    }
    fn write(&self, user_buf: UserBuffer) -> usize {
        // do nothing
        user_buf.len()
    }
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        let cmd = IoctlCommand::from(cmd);
        let task = current_task().unwrap();
        let mut inner = task.inner_lock();
        let token = inner.user_token();

        match cmd {
            IoctlCommand::RTC_RD_TIME => {
                let time = RtcTime::new(2000, 1, 1, 0, 0, 0);
                let mut arg = UserBuffer::new(translated_byte_buffer(
                    token,
                    arg as *const u8,
                    size_of::<RtcTime>(),
                ));
                arg.write(time.as_bytes());
            }
            _ => return -1,
        }
        0
    }
}

impl DevRandom {
    pub fn new() -> Self {
        Self
    }
}

impl File for DevRandom {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut user_buf: UserBuffer) -> usize {
        user_buf.fillrandom()
    }
    fn write(&self, user_buf: UserBuffer) -> usize {
        // do nothing
        user_buf.len()
    }
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        -1
    }
}

impl DevTty {
    pub fn new() -> Self {
        Self
    }
}

impl File for DevTty {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut user_buf: UserBuffer) -> usize {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.get(0) {
            tty_device.read(user_buf)
        } else {
            panic!("get Stdin error!");
        }
    }
    fn write(&self, user_buf: UserBuffer) -> usize {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.get(1) {
            tty_device.write(user_buf)
        } else {
            panic!("get Stdout error!");
        }
    }
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.get(1) {
            tty_device.ioctl(cmd, arg)
        } else {
            panic!("get Stdout error!");
        }
    }
}
