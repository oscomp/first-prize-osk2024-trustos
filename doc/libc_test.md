# Lictest
## run_static.sh
### fscanf
#### pipe error
现象: fscanf卡死在pipe.read,单线程读写，只写入13字节，但是需要读取1024字节,Pipe一直让出cpu，无法结束读取
出错代码:
``` c
TEST(i, write(p[1], "hello, world\n", 13), 13, "write error %d!=%d (%s)");
TEST(i, fscanf(f, "%s %[own]", a, b), 2, "got %d fields, expected %d");
TEST_S(a, "hello,", "wrong result for %s");
```
错误原因: fscanf默认传入buffer大小为1024字节,pipe实现采用阻塞实现，若未读满1024字节会一直等待写入
解决方案: 将pipe实现改为非阻塞式

#### sys_unlinkat error
现象: tmp_file调用未成功执行,open后调用unlinkat随后fdopen,fdopen操作失败
出错代码:
``` c
FILE *tmpfile(void)
{
    // ......
	for (try=0; try<MAXTRIES; try++) {
		__randname(s+13);
		fd = sys_open(s, O_RDWR|O_CREAT|O_EXCL, 0600);
		if (fd >= 0) {
			__syscall(SYS_unlink, s);
			f = __fdopen(fd, "w+");
			if (!f) __syscall(SYS_close, fd);
			return f;
		}
	}
}

```
错误原因: 对于ext4文件,若是只有一个链接且有活跃的fd未关闭,调用unlink时应该将该操作延迟到所有对应的fd全部关闭为止。
解决方案: 为Ext4Inode添加delay标识变量并实现RAII自动管理

#### sys_munmap error
错误原因: munmmap时只回收了mmap的一个区间的前一部分,mprotect会拆分mmap的区间
解决方案: 支持拆分区间的回收