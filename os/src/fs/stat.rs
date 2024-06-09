use super::ROOT_INODE;

const S_IFDIR: u32 = 0x4000;
const S_IFREG: u32 = 0x8000;
const S_IFLINK: u32 = 0xA000;

#[repr(C)]
#[derive(Debug)]
pub struct Kstat {
    st_dev: u64,   // 包含文件的设备 ID
    st_ino: u64,   // 索引节点号
    st_mode: u32,  // 文件类型和模式
    st_nlink: u32, // 硬链接数
    st_uid: u32,   // 所有者的用户 ID
    st_gid: u32,   // 所有者的组 ID
    st_rdev: u64,  // 设备 ID（如果是特殊文件）
    __pad: u64,
    st_size: u64,    // 总大小，以字节为单位
    st_blksize: u32, // 文件系统 I/O 的块大小
    __pad2: u32,
    st_blocks: u64,     // 分配的 512B 块数
    st_atime_sec: i64,  // 上次访问时间
    st_atime_nsec: i64, // 上次访问时间（纳秒精度）
    st_mtime_sec: i64,  // 上次修改时间
    st_mtime_nsec: i64, // 上次修改时间（纳秒精度）
    st_ctime_sec: i64,  // 上次状态变化的时间
    st_ctime_nsec: i64, // 上次状态变化的时间（纳秒精度）
}

impl Kstat {
    pub fn new() -> Self {
        Self {
            st_dev: 0,
            st_ino: 0,
            st_mode: 0,
            st_nlink: 1,
            st_uid: 0,
            st_gid: 0,
            st_rdev: 0,
            __pad: 0,
            st_size: 0,
            st_blksize: 512,
            __pad2: 0,
            st_blocks: 0,
            st_atime_sec: 0,
            st_atime_nsec: 0,
            st_mtime_sec: 0,
            st_mtime_nsec: 0,
            st_ctime_sec: 0,
            st_ctime_nsec: 0,
        }
    }
    pub fn init(
        &mut self,
        st_ino: u64,
        st_size: u64,
        st_atime: i64,
        st_mtime: i64,
        st_ctime: i64,
        st_blocks: u64,
        st_mode: u32,
    ) {
        self.st_ino = st_ino;
        self.st_size = st_size;
        self.st_atime_sec = st_atime;
        self.st_mtime_sec = st_mtime;
        self.st_ctime_sec = st_ctime;
        self.st_blocks = st_blocks;
        self.st_mode = st_mode;
    }

    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as *const u8, size) }
    }
}

#[repr(C)]
#[derive(Debug)]
pub struct Statfs {
    f_type: i64,       // Type of filesystem
    f_bsize: i64,      // Optimal transfer block size
    f_blocks: i64,     // Total data blocks in filesystem
    f_bfree: i64,      // Free blocks in filesystem
    f_bavail: i64,     // Free blocks available to unprivileged user
    f_files: i64,      // Total inodes in filesystem
    f_ffree: i64,      // Free inodes in filesystem
    f_fsid: i64,       // Filesystem ID
    f_name_len: i64,   // Maximum length of filenames
    f_frsize: i64,     // Fragment size
    f_flags: i64,      // Mount flags of filesystem
    f_spare: [i64; 4], // Padding bytes
}

impl Statfs {
    pub fn new(f_type: i64, f_bfree: i64, f_bavail: i64, f_files: i64, f_ffree: i64) -> Self {
        Self {
            f_type,
            f_bsize: 512,
            f_blocks: 262144,
            f_bfree,
            f_bavail,
            f_files,
            f_ffree,
            f_fsid: 0,
            f_name_len: 255,
            f_frsize: 0,
            f_flags: 0,
            f_spare: [0; 4],
        }
    }

    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as *const u8, size) }
    }
}
