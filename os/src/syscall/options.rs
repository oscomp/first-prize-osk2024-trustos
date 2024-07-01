/// 存放系统调用的各种Option
use crate::mm::{FrameTracker, MapPermission};
use alloc::collections::BTreeMap;
use alloc::sync::Arc;
use alloc::vec::Vec;
use num_enum::FromPrimitive;
use spin::Mutex;

bitflags! {
    pub struct WaitOption:u8{
        const DEFAULT = 0;
        const WNOHANG = 1;
        const WUNTRACED = 2;
        const WCONTINUED = 8;
    }
}

bitflags! {
    /// Open file flags
    pub struct CloneFlags: u32 {
        ///
        const SIGCHLD = (1 << 4) | (1 << 0);
        ///set if VM shared between processes
        const CLONE_VM = 1 << 8;
        ///set if fs info shared between processes
        const CLONE_FS = 1 << 9;
        ///set if open files shared between processes
        const CLONE_FILES = 1 << 10;
        ///set if signal handlers and blocked signals shared
        const CLONE_SIGHAND = 1 << 11;
        ///set if a pidfd should be placed in parent
        const CLONE_PIDFD = 1 << 12;
        ///set if we want to let tracing continue on the child too
        const CLONE_PTRACE = 1 << 13;
        ///set if the parent wants the child to wake it up on mm_release
        const CLONE_VFORK = 1 << 14;
        ///set if we want to have the same parent as the cloner
        const CLONE_PARENT = 1 << 15;
        ///Same thread group?
        const CLONE_THREAD = 1 << 16;
        ///New mount namespace group
        const CLONE_NEWNS = 1 << 17;
        ///share system V SEM_UNDO semantics
        const CLONE_SYSVSEM = 1 << 18;
        ///create a new TLS for the child
        const CLONE_SETTLS = 1 << 19;
        ///set the TID in the parent
        const CLONE_PARENT_SETTID = 1 << 20;
        ///clear the TID in the child
        const CLONE_CHILD_CLEARTID = 1 << 21;
        ///Unused, ignored
        const CLONE_DETACHED = 1 << 22;
        ///set if the tracing process can't force CLONE_PTRACE on this clone
        const CLONE_UNTRACED = 1 << 23;
        ///set the TID in the child
        const CLONE_CHILD_SETTID = 1 << 24;
        ///New cgroup namespace
        const CLONE_NEWCGROUP = 1 << 25;
        ///New utsname namespace
        const CLONE_NEWUTS = 1 << 26;
        ///New ipc namespace
        const CLONE_NEWIPC = 1 << 27;
        /// New user namespace
        const CLONE_NEWUSER = 1 << 28;
        ///New pid namespace
        const CLONE_NEWPID = 1 << 29;
        ///New network namespace
        const CLONE_NEWNET = 1 << 30;
        ///Clone io context
        const CLONE_IO = 1 << 31;
    }
}

impl CloneFlags {
    pub fn is_fork(&self) -> bool {
        self.contains(CloneFlags::SIGCHLD)
    }
}

// For Mmap
bitflags! {
    /// Mmap permissions
    pub struct MmapProt: u32 {
        /// None
        const PROT_NONE = 0;
        /// Readable
        const PROT_READ = 1 << 0;
        /// Writable
        const PROT_WRITE = 1 << 1;
        /// Executable
        const PROT_EXEC = 1 << 2;
    }
}

impl From<MmapProt> for MapPermission {
    fn from(prot: MmapProt) -> Self {
        let mut map_permission = MapPermission::U;
        if prot.contains(MmapProt::PROT_READ) {
            map_permission |= MapPermission::R;
        }
        if prot.contains(MmapProt::PROT_WRITE) {
            map_permission |= MapPermission::W;
        }
        if prot.contains(MmapProt::PROT_EXEC) {
            map_permission |= MapPermission::X;
        }
        map_permission
    }
}

bitflags! {
    /// Mmap flags
    pub struct MmapFlags: u32 {
        /// Shared
        const MAP_SHARED = 1;
        /// Private
        const MAP_PRIVATE = 1 << 1;
        /// Fixed
        const MAP_FIXED = 1 << 4;
        /// Anonymous
        const MAP_ANONYMOUS = 1 << 5;
        /// Compatity
        const MAP_DENYWRITE = 1 << 11;
        /// Stack
        const MAP_STACK = 1 << 17;
    }
}

bitflags! {
    pub struct FaccessatMode: u32 {
        const F_OK = 0;
        const X_OK = 1<<0;
        const W_OK = 1<<1;
        const R_OK = 1<<2;
    }
}

bitflags! {
     /// renameat flag
    pub struct Renameat2Flags: u32 {
        const RENAME_NOREPLACE = 1 << 0;
        const RENAME_EXCHANGE = 1 << 1;
        const RENAME_WHITEOUT = 1 << 2;
    }
}

#[repr(usize)]
#[allow(non_camel_case_types)]
#[derive(Debug, PartialEq, FromPrimitive)]
pub enum IoctlCommand {
    // For struct termios
    /// Gets the current serial port settings.
    TCGETS = 0x5401,
    /// Sets the serial port settings immediately.
    TCSETS = 0x5402,
    /// Sets the serial port settings after allowing the input and output buffers to drain/empty.
    TCSETSW = 0x5403,
    /// Sets the serial port settings after flushing the input and output buffers.
    TCSETSF = 0x5404,
    /// For struct termio
    /// Gets the current serial port settings.
    TCGETA = 0x5405,
    /// Sets the serial port settings immediately.
    TCSETA = 0x5406,
    /// Sets the serial port settings after allowing the input and output buffers to drain/empty.
    TCSETAW = 0x5407,
    /// Sets the serial port settings after flushing the input and output buffers.
    TCSETAF = 0x5408,
    /// Get the process group ID of the foreground process group on this terminal.
    TIOCGPGRP = 0x540F,
    /// Set the foreground process group ID of this terminal.
    TIOCSPGRP = 0x5410,
    /// Get window size.
    TIOCGWINSZ = 0x5413,
    /// Set window size.
    TIOCSWINSZ = 0x5414,
    /// Non-cloexec
    FIONCLEX = 0x5450,
    /// Cloexec
    FIOCLEX = 0x5451,
    /// rustc using pipe and ioctl pipe file with this request id
    /// for non-blocking/blocking IO control setting
    FIONBIO = 0x5421,
    /// Read time
    RTC_RD_TIME = 0x80247009,
    #[num_enum(default)]
    Default = 0,
}

#[repr(isize)]
#[allow(non_camel_case_types)]
#[derive(Debug, PartialEq, FromPrimitive)]
pub enum SyslogType {
    SYSLOG_ACTION_CLOSE = 0,
    SYSLOG_ACTION_OPEN = 1,
    SYSLOG_ACTION_READ = 2,
    SYSLOG_ACTION_READ_ALL = 3,
    SYSLOG_ACTION_READ_CLEAR = 4,
    SYSLOG_ACTION_CLEAR = 5,
    SYSLOG_ACTION_CONSOLE_OFF = 6,
    SYSLOG_ACTION_CONSOLE_ON = 7,
    SYSLOG_ACTION_CONSOLE_LEVER = 8,
    SYSLOG_ACTION_SIZE_UNREAD = 9,
    SYSLOG_ACTION_SIZE_BUFFER = 10,
    #[num_enum(default)]
    Default = -1,
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct PollFd {
    /// 等待的 fd
    pub fd: i32,
    /// 等待的事件
    pub events: PollEvents,
    /// 返回的事件
    pub revents: PollEvents,
}

impl PollFd {
    pub fn new() -> Self {
        Self {
            fd: 0,
            events: PollEvents::empty(),
            revents: PollEvents::empty(),
        }
    }
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as *const u8, size) }
    }
}

bitflags! {
    //表示对应在文件上等待或者发生过的事件
    pub struct PollEvents: u16 {
        /// 可读
        const IN = 0x0001;
        /// 可写
        const OUT = 0x0004;
        /// 报错
        const ERR = 0x0008;
        /// 已终止，如 pipe 的另一端已关闭连接的情况
        const HUP = 0x0010;
        /// 无效的 fd
        const INVAL = 0x0020;
    }
}

pub struct Utsname {
    pub sysname: [u8; 65],
    pub nodename: [u8; 65],
    pub release: [u8; 65],
    pub version: [u8; 65],
    pub machine: [u8; 65],
    pub domainname: [u8; 65],
}

impl Utsname {
    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as *const u8, size) }
    }
}

pub struct SharedMemory {
    pub trackers: Vec<Arc<FrameTracker>>,
    pub deleted: Mutex<bool>,
}

impl SharedMemory {
    pub const fn new(trackers: Vec<Arc<FrameTracker>>) -> Self {
        Self {
            trackers,
            deleted: Mutex::new(false),
        }
    }
}

#[derive(Clone)]
pub struct MapedSharedMemory {
    pub key: usize,
    pub mem: Arc<SharedMemory>,
    pub start: usize,
    pub end: usize,
    pub size: usize,
}

impl Drop for MapedSharedMemory {
    fn drop(&mut self) {
        // self.mem.trackers.remove(self.key);
        if Arc::strong_count(&self.mem) == 1 && *self.mem.deleted.lock() == true {
            SHARED_MEMORY.lock().remove(&self.key);
        }
    }
}

pub static SHARED_MEMORY: Mutex<BTreeMap<usize, Arc<SharedMemory>>> = Mutex::new(BTreeMap::new());

bitflags! {
    pub struct ShmGetFlags: i32 {
        ///
        const SHM_R = 0o400;
        ///
        const SHM_W = 0o200;
        /// Create a new segment. If this flag is not used, then shmget() will find the segment associated with key and check to see if the user has permission to access the segment.
        const IPC_CREAT = 0o1000;
        /// This flag is used with IPC_CREAT to ensure that this call creates the segment.  If the segment already exists, the call fails.
        const IPC_EXCL = 0o2000;
        /// segment will use huge TLB pages
        const SHM_HUGETLB = 0o4000;
        /// don't check for reservations
        const SHM_NORESERVE = 0o10000;
    }
}
