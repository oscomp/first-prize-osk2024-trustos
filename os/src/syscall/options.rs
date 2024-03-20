/// 存放系统调用的各种Option
bitflags! {
    pub struct WaitOption:u8{
        const DEFAULT = 0;
        const WNOHANG = 1;
        const WUNTRACED = 2;
        const WCONTINUED = 8;
    }
}
