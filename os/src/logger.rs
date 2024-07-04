use crate::{task::current_task, utils::hart_id};
use alloc::fmt::{self, Write};
use log::{Level, LevelFilter, Metadata, Record};
use spin::{Lazy, RwLock};

#[cfg(feature = "error")]
const LOG_LEVEL: log::LevelFilter = LevelFilter::Error;
#[cfg(feature = "warn")]
const LOG_LEVEL: log::LevelFilter = LevelFilter::Warn;
#[cfg(feature = "info")]
const LOG_LEVEL: log::LevelFilter = LevelFilter::Info;
#[cfg(feature = "debug")]
const LOG_LEVEL: log::LevelFilter = LevelFilter::Debug;
#[cfg(feature = "trace")]
const LOG_LEVEL: log::LevelFilter = LevelFilter::Trace;

struct SimpleLogger;
impl log::Log for SimpleLogger {
    fn enabled(&self, metadata: &Metadata) -> bool {
        unsafe { metadata.level() <= NOW_LEVEL }
    }
    fn log(&self, record: &Record) {
        let (pid, tid) = if let Some(task) = current_task() {
            (task.pid() as isize, task.tid() as isize)
        } else {
            (-1, -1)
        };
        if self.enabled(record.metadata()) {
            println!(
                "\x1b[{}m[{}] [HART{}] [PID {}] [TID {}] {}\x1b[0m",
                level_color(record.level()),
                record.level(),
                hart_id(),
                pid,
                tid,
                record.args()
            );
            LOG_BUF.write().write_fmt(format_args!(
                "\x1b[{}m[{}] [HART{}] [PID {}] [TID {}] {}\x1b[0m\n",
                level_color(record.level()),
                record.level(),
                hart_id(),
                pid,
                tid,
                record.args()
            ));
        }
    }
    fn flush(&self) {}
}

static LOGGER: SimpleLogger = SimpleLogger;
static mut SAVED_LEVEL: log::LevelFilter = LevelFilter::Off;
static mut NOW_LEVEL: log::LevelFilter = LOG_LEVEL;

pub fn init() {
    log::set_logger(&LOGGER)
        .map(|()| log::set_max_level(LOG_LEVEL))
        .unwrap();
}

fn level_color(level: Level) -> u8 {
    match level {
        Level::Error => 31,
        Level::Warn => 93,
        Level::Info => 34,
        Level::Debug => 32,
        Level::Trace => 90,
    }
}

pub fn change_log_level(level: usize) -> isize {
    let level = match level {
        0 => LevelFilter::Off,
        1 => LevelFilter::Error,
        2 => LevelFilter::Warn,
        3 => LevelFilter::Info,
        4 => LevelFilter::Debug,
        5 => LevelFilter::Trace,
        _ => return -1,
    };
    unsafe {
        NOW_LEVEL = level;
    }
    log::set_logger(&LOGGER)
        .map(|()| log::set_max_level(level))
        .unwrap();
    0
}

pub fn console_log_off() {
    unsafe {
        SAVED_LEVEL = NOW_LEVEL;
        NOW_LEVEL = LevelFilter::Off;
    }
    log::set_logger(&LOGGER)
        .map(|()| log::set_max_level(LevelFilter::Off))
        .unwrap();
}

pub fn console_log_on() {
    unsafe {
        NOW_LEVEL = SAVED_LEVEL;

        log::set_logger(&LOGGER)
            .map(|()| log::set_max_level(NOW_LEVEL))
            .unwrap();
    }
}

pub const LOG_BUF_LEN: usize = 4096;
pub struct LogBuffer {
    pub empty: bool, // The same values of head and tail mean that the log_buf is either empty or full
    pub clear_empty: bool,
    pub clear_head: usize, // the head after the last clear command
    pub head: usize,
    pub tail: usize,
    pub inner: [u8; LOG_BUF_LEN],
}

impl LogBuffer {
    // READ
    pub fn read(&mut self, buf: &mut [u8], len: usize) -> usize {
        let head = self.head;
        let r_len = self.unread_size().min(len);
        let r1_len = LOG_BUF_LEN - head;
        if r1_len < r_len {
            buf[0..r1_len].copy_from_slice(&self.inner[head..LOG_BUF_LEN]);
            buf[r1_len..r_len].copy_from_slice(&self.inner[0..r_len - r1_len]);
        } else {
            buf[0..r_len].copy_from_slice(&self.inner[head..head + r_len]);
        }
        // update
        self.head = (head + r_len) % LOG_BUF_LEN;
        let unread_sz = self.unread_size();
        if unread_sz < self.unclear_size() {
            self.clear_head = self.head;
        }
        if unread_sz == 0 {
            self.empty = true;
            self.clear_empty = true;
        }
        return r_len;
    }
    // READ_ALL & READ_CLEAR: depend on the value of "clear"
    // read the last len bytes
    pub fn read_all(&mut self, buf: &mut [u8], len: usize, clear: bool) -> usize {
        let tail = self.tail;
        let r_len = self.unclear_size().min(len);
        if tail > r_len {
            buf[0..r_len].copy_from_slice(&self.inner[tail - r_len..tail]);
        } else {
            let r1_len = r_len - tail;
            buf[0..r1_len].copy_from_slice(&self.inner[LOG_BUF_LEN - r1_len..LOG_BUF_LEN]);
            buf[r1_len..r_len].copy_from_slice(&self.inner[0..tail]);
        }
        // clear
        if clear {
            self.clear_buf();
        }
        return r_len;
    }
    // from head to tail
    pub fn unread_size(&self) -> usize {
        let head = self.head;
        let tail = self.tail;
        if head < tail || self.empty {
            tail - head
        } else {
            LOG_BUF_LEN + tail - head
        }
    }
    // from clear_head to tail
    fn unclear_size(&self) -> usize {
        let clear_head = self.clear_head;
        let tail = self.tail;
        if clear_head < tail || self.clear_empty {
            tail - clear_head
        } else {
            LOG_BUF_LEN + tail - clear_head
        }
    }
    // clear the log buffer
    pub fn clear_buf(&mut self) {
        self.clear_head = self.tail;
        self.clear_empty = true;
    }
}

pub fn read_log_buf(buf: &mut [u8], len: usize) -> usize {
    LOG_BUF.write().read(buf, len)
}

pub fn read_all_log_buf(buf: &mut [u8], len: usize) -> usize {
    LOG_BUF.write().read_all(buf, len, false)
}

pub fn read_clear_log_buf(buf: &mut [u8], len: usize) -> usize {
    LOG_BUF.write().read_all(buf, len, true)
}

pub fn clear_log_buf() {
    LOG_BUF.write().clear_buf();
}

pub fn unread_size() -> usize {
    LOG_BUF.read().unread_size()
}

impl Write for LogBuffer {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        let buf = s.as_bytes();
        let w_len;
        let tail = self.tail;
        let head = self.head;
        if head < tail || self.empty {
            w_len = (LOG_BUF_LEN + head - tail).min(buf.len());
        } else {
            w_len = (head - tail).min(buf.len());
        }
        if w_len > 0 {
            self.empty = false;
            self.clear_empty = false;
            let w1_len = LOG_BUF_LEN - tail;
            if w1_len < w_len {
                &self.inner[tail..LOG_BUF_LEN].copy_from_slice(&buf[0..w1_len]);
                &self.inner[0..w_len - w1_len].copy_from_slice(&buf[w1_len..w_len]);
            } else {
                &self.inner[tail..tail + w_len].copy_from_slice(&buf[0..w_len]);
            }
            // update tail
            self.tail = (tail + w_len) % LOG_BUF_LEN;
        }
        Ok(())
    }
}

pub static LOG_BUF: Lazy<RwLock<LogBuffer>> = Lazy::new(|| {
    RwLock::new(LogBuffer {
        empty: true,
        clear_empty: true,
        clear_head: 0,
        head: 0,
        tail: 0,
        inner: [0; LOG_BUF_LEN],
    })
});
