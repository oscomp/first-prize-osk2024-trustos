# 报错FATAL: kernel too old
原因：uname获取的os版本太小。
解决方法：更改uname获取的release和version，暂不知道至少需要改成多少，5.0.0可以通过。
# mprotect卡住
原因：对area_frames的处理存在死循环问题
解决方法：已经解决，见mpotect。
# mprotect后出现LoadPageFault
原因：MapPermission只能设置部分位，不要直接覆盖页表中对应的页表项的访问权限。
解决方法：将原来的页表项或上设置的部分位再赋值即可。
