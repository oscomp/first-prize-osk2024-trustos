# 警告Running on unknown kernel version
原因：测试代码对os的版本信息进行了读取处理，详情见测试代码。
解决方法：修改uname获取的os的版本信息。
# 执行mprotect之后卡住，没有进程继续执行

