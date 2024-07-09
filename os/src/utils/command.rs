///记录busybox所支持的所有命令
pub fn find_command_in_busybox(command: &str) -> bool {
    match command {
        "basename" | "cal" | "cat" | "clear" | "cp" | "cut" | "date" | "df" | "dirname"
        | "dmesg" | "du" | "echo" | "expr" | "false" | "find" | "free" | "grep" | "head"
        | "hexdump" | "hwclock" | "kill" | "ls" | "md5sum" | "mkdir" | "more" | "mv" | "od"
        | "printf" | "ps" | "pwd" | "rmdir" | "rm" | "sleep" | "sort" | "stat" | "strings"
        | "[" | "tail" | "touch" | "true" | "uname" | "uniq" | "uptime" | "wc" | "which" => true,
        _ => false,
    }
}
