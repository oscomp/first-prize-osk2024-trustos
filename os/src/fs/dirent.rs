pub const NAME_LIMIT: usize = 253;

/// 存储目录中的文件信息
#[repr(C)]
#[derive(Debug)]
pub struct Dirent {
    d_ino: usize,             // 索引节点号
    d_off: isize,             // 从 0 开始到下一个 dirent 的偏移
    d_reclen: u16,            // 当前 dirent 的长度
    d_type: u8,               // 文件类型
    d_name: [u8; NAME_LIMIT], // 文件名
}

impl Dirent {
    pub fn new() -> Self {
        Self {
            d_ino: 0,
            d_off: 0,
            d_reclen: core::mem::size_of::<Self>() as u16,
            d_type: 0,
            d_name: [0; NAME_LIMIT],
        }
    }

    pub fn len(&self) -> u16 {
        self.d_reclen
    }

    pub fn init(&mut self, name: &str, off: isize, ino: usize, dtype: u8) {
        self.fill_name(name);
        self.d_off = off;
        self.d_ino = ino;
        self.d_type = dtype;
    }

    fn fill_name(&mut self, name: &str) {
        let len = name.len().min(NAME_LIMIT);
        let name_bytes = name.as_bytes();
        for i in 0..len {
            self.d_name[i] = name_bytes[i];
        }
        self.d_name[len] = 0;
    }

    pub fn as_bytes(&self) -> &[u8] {
        let size = core::mem::size_of::<Self>();
        unsafe { core::slice::from_raw_parts(self as *const _ as usize as *const u8, size) }
    }
}
