use crate::{
    fs::FileClass,
    mm::{translated_byte_buffer, UserBuffer},
    syscall::{IoctlCommand, PollEvents},
    task::{current_task, INITPROC},
    utils::SyscallRet,
};
use alloc::{
    collections::BTreeMap,
    fmt::{Debug, Formatter},
    format,
    string::{String, ToString},
    sync::Arc,
};
use core::{cmp::min, mem::size_of};
use lazy_static::lazy_static;
use spin::{Mutex, RwLock};

use super::{File, Ioctl, Kstat, Stdout};

pub struct DevZero;
pub struct DevNull;
pub struct DevRtc;
pub struct DevRandom;

pub struct DevTty;

pub struct DevCpuDmaLatency {
    reaction_time: RwLock<u32>, //进程最大反应时间,即CPU最大延迟,单位us
}

//设备树，通过设备名称可以查找到设备号
lazy_static! {
    pub static ref DEVICES: Mutex<BTreeMap<String, usize>> = Mutex::new(BTreeMap::new());
}

//从1起算，0为其他抽象文件
static mut DEV_NO: usize = 1;

pub fn register_device(abs_path: &str) {
    unsafe {
        DEVICES.lock().insert(abs_path.to_string(), DEV_NO);
        DEV_NO += 1;
    }
}

pub fn unregister_device(abs_path: &str) {
    DEVICES.lock().remove(&abs_path.to_string());
}

pub fn find_device(abs_path: &str) -> bool {
    DEVICES.lock().get(&abs_path.to_string()).is_some()
}

pub fn get_devno(abs_path: &str) -> usize {
    *DEVICES.lock().get(&abs_path.to_string()).unwrap()
}

pub fn open_device_file(abs_path: &str) -> Option<Arc<dyn File>> {
    match abs_path {
        "/dev/zero" => Some(Arc::new(DevZero::new())),
        "/dev/null" => Some(Arc::new(DevNull::new())),
        "/dev/rtc" | "/dev/rtc0" | "/dev/misc/rtc" => Some(Arc::new(DevRtc::new())),
        "/dev/random" => Some(Arc::new(DevRandom::new())),
        "/dev/tty" => Some(Arc::new(DevTty::new())),
        "/dev/cpu_dma_latency" => Some(Arc::new(DevCpuDmaLatency::new())),
        _ => None,
    }
    /*
    // warning: just a fake implementation
    if abs_path == "/dev/zero" {
        Some(Arc::new(DevZero::new()))
    } else if abs_path == "/dev/null" {
        Some(Arc::new(DevNull::new()))
    } else if abs_path == "/dev/rtc" || abs_path == "/dev/rtc0" || abs_path == "/dev/misc/rtc" {
        Some(Arc::new(DevRtc::new()))
    } else if abs_path == "/dev/random" {
        Some(Arc::new(DevRandom::new()))
    } else if abs_path == "/dev/tty" {
        Some(Arc::new(DevTty::new()))
    } else {
        None
    }
    */
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
    fn read(&self, mut user_buf: UserBuffer) -> SyscallRet {
        Ok(user_buf.fill0())
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        // do nothing
        Ok(user_buf.len())
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/zero");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
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
    fn read(&self, mut _user_buf: UserBuffer) -> SyscallRet {
        // do nothing
        Ok(0)
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        // do nothing
        Ok(user_buf.len())
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/null");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
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
    fn read(&self, mut user_buf: UserBuffer) -> SyscallRet {
        let time = RtcTime::new(2000, 1, 1, 0, 0, 0);
        let str = format!("{:?}", time);
        let bytes = str.as_bytes();
        let len = min(user_buf.len(), bytes.len());
        user_buf.write(bytes);
        Ok(len)
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        // do nothing
        Ok(user_buf.len())
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/rtc");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
    }
}

impl Ioctl for DevRtc {
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        let cmd = IoctlCommand::from(cmd);
        let task = current_task().unwrap();
        let mut inner = task.inner_lock();
        let token = inner.user_token();

        match cmd {
            IoctlCommand::RTC_RD_TIME => {
                let time = RtcTime::new(2000, 1, 1, 0, 0, 0);
                let mut arg = UserBuffer::new(
                    translated_byte_buffer(token, arg as *const u8, size_of::<RtcTime>()).unwrap(),
                );
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
    fn read(&self, mut user_buf: UserBuffer) -> SyscallRet {
        Ok(user_buf.fillrandom())
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        // do nothing
        Ok(user_buf.len())
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/random");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
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
    fn read(&self, mut user_buf: UserBuffer) -> SyscallRet {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.try_get_file(0) {
            tty_device.read(user_buf)
        } else {
            panic!("get Stdin error!");
        }
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.try_get_file(1) {
            tty_device.write(user_buf)
        } else {
            panic!("get Stdout error!");
        }
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/tty");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
    }
}

impl Ioctl for DevTty {
    fn ioctl(&self, cmd: usize, arg: usize) -> isize {
        if let Some(FileClass::Abs(tty_device)) = INITPROC.inner_lock().fd_table.try_get_file(1) {
            // tty_device.ioctl(cmd, arg)
            let tty_device = unsafe { Arc::from_raw(Arc::into_raw(tty_device) as *const Stdout) };
            tty_device.ioctl(cmd, arg)
        } else {
            panic!("get Stdout error!");
        }
    }
}

impl DevCpuDmaLatency {
    pub fn new() -> Self {
        Self {
            reaction_time: RwLock::new(10),
        }
    }
}

impl File for DevCpuDmaLatency {
    fn readable(&self) -> bool {
        true
    }
    fn writable(&self) -> bool {
        true
    }
    fn read(&self, mut user_buf: UserBuffer) -> SyscallRet {
        let reaction_time = *self.reaction_time.read();
        let buf = [
            (reaction_time >> 24) as u8,
            (reaction_time >> 16) as u8,
            (reaction_time >> 8) as u8,
            reaction_time as u8,
        ];
        Ok(user_buf.write(&buf))
    }
    fn write(&self, user_buf: UserBuffer) -> SyscallRet {
        let mut bytes: [u8; 4] = [0; 4];
        let mut count = 0;
        for sub_buff in user_buf.buffers.iter() {
            let sblen = (*sub_buff).len();
            for j in 0..sblen {
                bytes[count] = (*sub_buff)[j];
                count += 1;
            }
        }
        let mut reaction_time = self.reaction_time.write();
        *reaction_time = (bytes[0] as u32) << 24
            | (bytes[1] as u32) << 16
            | (bytes[2] as u32) << 8
            | bytes[3] as u32;
        Ok(4)
    }
    fn fstat(&self) -> Kstat {
        let devno = get_devno("/dev/cpu_dma_latency");
        Kstat {
            st_dev: devno,
            st_rdev: devno,
            ..Kstat::default()
        }
    }
    fn poll(&self, events: PollEvents) -> PollEvents {
        let mut revents = PollEvents::empty();
        if events.contains(PollEvents::IN) {
            revents |= PollEvents::IN;
        }
        if events.contains(PollEvents::OUT) {
            revents |= PollEvents::OUT;
        }
        revents
    }
}
