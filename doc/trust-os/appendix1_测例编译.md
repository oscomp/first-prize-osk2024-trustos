# appendix1 测例编译

## 说在前面

这是我们在比赛结束后，根据比赛过程中的回忆编写的文档，主要是讲如何将官方的测例编译成riscv64架构下的可执行文件，所以可能有遗漏或不足，但应该能帮助大家少走一些弯路。

## 初赛测例的编译
[这是2024初赛测例的github主页](https://github.com/oscomp/testsuits-for-oskernel/tree/main)

其中riscv-syscalls-testing/user/src/oscomp目录下就是初赛测例的源码和检查程序。因为我们本地测试的时候是从测例源码编译出可执行程序，所以调试过程中并不是只能在内核中调试，还可以修改测例源码来进行帮助调试。

从CMakeLists.txt可以看出，这部分测例编译时使用的是`riscv64-unknown-elf-`工具链，这个工具链跟rCore调试需要的工具链是相同的，所以如果rCore正常配置完的话，这个初赛测例应该是可以直接在riscv-syscalls-testing/user目录下执行`./build-oscomp.sh`来获得可执行文件，可执行文件会保存在riscv-syscalls-testing/user/build/riscv64目录下。

## 复赛测例的编译
[这是2024复赛测例的github主页](https://github.com/oscomp/testsuits-for-oskernel/tree/final-2024-rv)

其中docs目录下包含了部分测例的信息（主要是busybox和lmbench的完整功能需要的系统调用）

复赛测例的环境配置是十分复杂的，因为有的测例使用`riscv64-unknow-elf-`工具链，有的使用`riscv64-linux-gnu-`工具链，还有的使用`riscv64-linux-musl-`工具链，并且它们编译时需要的各种静态动态的第三方库也五花八门，我捣鼓近一周也只勉强在本机上配出能够编译busybox的环境，因此不建议在本机上配环境来进行复赛测例的编译，也不赘述本机上配置环境的过程（当然如果你能做到就更好，因为今年的决赛现场赛有一个赛题就是用内核运行git，但是官方并不提供git的可执行文件，需要参赛队伍自行拉取源码配置环境修改编译选项并编译出riscv架构下的可执行文件，这一步我们当时并没有成功，因为实在过于困难）。针对编译环境的问题，官方提供了一个已经配置好编译环境的docker镜像，我们可以将源文件上传至docker镜像，在镜像中进行编译，最后再从镜像中下载编译产物（不过这个镜像并没有配置可以编译git的环境）。

官方提供的docker镜像[在这里](https://hub.docker.com/r/alphamj/os-contest/tags)，选择最新版（写这篇文档时是v7.8），执行`docker pull alphamj/os-contest:v7.8`即可。我们比赛时docker hub已经被ban了，所以需要一些奇技淫巧才能拉下来，相信这对读者们不是什么问题。

然后在final-2024-rv目录下执行该命令进行编译：

`docker run --rm -it -v $(pwd):/code --privileged --entrypoint make alphamj/os-contest:v7.8 -C /code sdcard`

这里我简单的介绍一下：`$(pwd):/code`是把当前目录映射到docker里的`/code`目录下，`make alphamj/os-contest:v7.8 -C /code sdcard`是指在镜像的`/code`目录下执行`make sdcard`。这个命令可以看makefile，发现是编译所有测例并生成磁盘镜像的命令。我们也可以根据自己的需要进行修改，比如`make alphamj/os-contest:v7.8 -C /code busybox`就是只编译busybox，这会把busybox的可执行文件放到/sdcard目录下，不会生成磁盘镜像。

我对我们操作系统的os目录下的makefile进行了修改，可以直接在os目录下执行`make sdcard`或`make busybox`等命令来编译测例，方便调试，具体实现可以看makefile。