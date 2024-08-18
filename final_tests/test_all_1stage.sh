busybox echo "run time-test"
./time-test
busybox echo "run busybox_testcode.sh"
./busybox_testcode.sh
busybox echo "run iozone_testcode.sh"
./iozone_testcode.sh
busybox echo "run libctest_testcode.sh"
./libctest_testcode.sh
busybox echo "run libc-bench"
./libc-bench
busybox echo "run lua_testcode.sh"
./lua_testcode.sh
busybox echo "run lmbench_testcode.sh"
./lmbench_testcode.sh
# busybox echo "run netperf_testcode.sh"
# ./netperf_testcode.sh
# busybox echo "run iperf_testcode.sh"
# ./iperf_testcode.sh
busybox echo "run unixbench_testcode.sh"
./unixbench_testcode.sh

# busybox echo "run ltp_testcode.sh"
# #./ltp_testcode.sh
# ./test-ltp.sh ltp/testcases/bin/abort01
# ./test-ltp.sh ltp/testcases/bin/abs01
# ./test-ltp.sh ltp/testcases/bin/access01
# ./test-ltp.sh ltp/testcases/bin/access03
# ./test-ltp.sh ltp/testcases/bin/access04
# ./test-ltp.sh ltp/testcases/bin/brk01
# ./test-ltp.sh ltp/testcases/bin/brk02
# ./test-ltp.sh ltp/testcases/bin/chdir04
# ./test-ltp.sh ltp/testcases/bin/clock_getres01
# ./test-ltp.sh ltp/testcases/bin/clock_gettime01
# ./test-ltp.sh ltp/testcases/bin/clock_gettime02
# ./test-ltp.sh ltp/testcases/bin/clock_nanosleep01
# ./test-ltp.sh ltp/testcases/bin/clone01
# ./test-ltp.sh ltp/testcases/bin/clone04
# ./test-ltp.sh ltp/testcases/bin/close01
# ./test-ltp.sh ltp/testcases/bin/close02
# ./test-ltp.sh ltp/testcases/bin/copy_file_range03
# ./test-ltp.sh ltp/testcases/bin/dup01
# ./test-ltp.sh ltp/testcases/bin/dup02
# ./test-ltp.sh ltp/testcases/bin/dup03
# ./test-ltp.sh ltp/testcases/bin/dup04
# ./test-ltp.sh ltp/testcases/bin/dup07
# ./test-ltp.sh ltp/testcases/bin/dup201
# ./test-ltp.sh ltp/testcases/bin/dup202
# ./test-ltp.sh ltp/testcases/bin/dup203
# ./test-ltp.sh ltp/testcases/bin/dup204
# ./test-ltp.sh ltp/testcases/bin/dup205
# ./test-ltp.sh ltp/testcases/bin/dup206
# ./test-ltp.sh ltp/testcases/bin/dup207
# ./test-ltp.sh ltp/testcases/bin/dup3_01
# ./test-ltp.sh ltp/testcases/bin/dup3_02
# ./test-ltp.sh ltp/testcases/bin/exit02
# ./test-ltp.sh ltp/testcases/bin/faccessat01
# ./test-ltp.sh ltp/testcases/bin/faccessat02
# ./test-ltp.sh ltp/testcases/bin/fchmod01
# ./test-ltp.sh ltp/testcases/bin/fchmod04
# ./test-ltp.sh ltp/testcases/bin/fchmodat01
# ./test-ltp.sh ltp/testcases/bin/fchmodat02
# ./test-ltp.sh ltp/testcases/bin/fcntl03
# ./test-ltp.sh ltp/testcases/bin/fcntl04
# ./test-ltp.sh ltp/testcases/bin/fcntl08
# ./test-ltp.sh ltp/testcases/bin/fcntl12
# ./test-ltp.sh ltp/testcases/bin/fstat03
# ./test-ltp.sh ltp/testcases/bin/ftruncate01
# ./test-ltp.sh ltp/testcases/bin/getcwd01
# ./test-ltp.sh ltp/testcases/bin/getpagesize01
# ./test-ltp.sh ltp/testcases/bin/getppid02
# ./test-ltp.sh ltp/testcases/bin/getrandom01
# ./test-ltp.sh ltp/testcases/bin/getrandom02
# ./test-ltp.sh ltp/testcases/bin/getrandom03
# ./test-ltp.sh ltp/testcases/bin/getrandom04
# ./test-ltp.sh ltp/testcases/bin/getrandom05
# ./test-ltp.sh ltp/testcases/bin/getrusage01
# ./test-ltp.sh ltp/testcases/bin/getrusage02
# ./test-ltp.sh ltp/testcases/bin/gettid02
# ./test-ltp.sh ltp/testcases/bin/gettimeofday01
# ./test-ltp.sh ltp/testcases/bin/gettimeofday02
# ./test-ltp.sh ltp/testcases/bin/getuid01
# ./test-ltp.sh ltp/testcases/bin/lseek01
# ./test-ltp.sh ltp/testcases/bin/lseek07
# ./test-ltp.sh ltp/testcases/bin/madvise01
# ./test-ltp.sh ltp/testcases/bin/memcpy01
# ./test-ltp.sh ltp/testcases/bin/memset01
# ./test-ltp.sh ltp/testcases/bin/mkdir05
# ./test-ltp.sh ltp/testcases/bin/mmap02
# ./test-ltp.sh ltp/testcases/bin/mmap05
# ./test-ltp.sh ltp/testcases/bin/mmap06
# ./test-ltp.sh ltp/testcases/bin/mmap08
# ./test-ltp.sh ltp/testcases/bin/mmap09
# ./test-ltp.sh ltp/testcases/bin/mmap19
# ./test-ltp.sh ltp/testcases/bin/mprotect05
# ./test-ltp.sh ltp/testcases/bin/nanosleep02
# ./test-ltp.sh ltp/testcases/bin/nanosleep04
# ./test-ltp.sh ltp/testcases/bin/open01
# ./test-ltp.sh ltp/testcases/bin/open03
# ./test-ltp.sh ltp/testcases/bin/open04
# ./test-ltp.sh ltp/testcases/bin/open09
# ./test-ltp.sh ltp/testcases/bin/pipe01
# ./test-ltp.sh ltp/testcases/bin/pipe03
# ./test-ltp.sh ltp/testcases/bin/pipe06
# ./test-ltp.sh ltp/testcases/bin/pipe08
# ./test-ltp.sh ltp/testcases/bin/pipe10
# ./test-ltp.sh ltp/testcases/bin/pipe11
# ./test-ltp.sh ltp/testcases/bin/pipe13
# ./test-ltp.sh ltp/testcases/bin/pipe14
# ./test-ltp.sh ltp/testcases/bin/pipe2_01
# ./test-ltp.sh ltp/testcases/bin/poll01
# ./test-ltp.sh ltp/testcases/bin/pread01
# ./test-ltp.sh ltp/testcases/bin/pread02
# ./test-ltp.sh ltp/testcases/bin/pselect03
# ./test-ltp.sh ltp/testcases/bin/pwrite01
# ./test-ltp.sh ltp/testcases/bin/pwrite02
# ./test-ltp.sh ltp/testcases/bin/pwrite03
# ./test-ltp.sh ltp/testcases/bin/read01
# ./test-ltp.sh ltp/testcases/bin/read02
# ./test-ltp.sh ltp/testcases/bin/read04
# ./test-ltp.sh ltp/testcases/bin/readdir01
# ./test-ltp.sh ltp/testcases/bin/readv01
# ./test-ltp.sh ltp/testcases/bin/readv02
# ./test-ltp.sh ltp/testcases/bin/select03
# ./test-ltp.sh ltp/testcases/bin/sendfile02
# ./test-ltp.sh ltp/testcases/bin/sendfile03
# ./test-ltp.sh ltp/testcases/bin/sendfile05
# ./test-ltp.sh ltp/testcases/bin/sendfile06
# ./test-ltp.sh ltp/testcases/bin/sendfile08
# ./test-ltp.sh ltp/testcases/bin/set_tid_address01
# ./test-ltp.sh ltp/testcases/bin/setitimer01
# ./test-ltp.sh ltp/testcases/bin/setitimer02
# ./test-ltp.sh ltp/testcases/bin/sigaction01
# ./test-ltp.sh ltp/testcases/bin/stat01
# ./test-ltp.sh ltp/testcases/bin/stat02
# ./test-ltp.sh ltp/testcases/bin/string01
# ./test-ltp.sh ltp/testcases/bin/symlink02
# ./test-ltp.sh ltp/testcases/bin/symlink04
# ./test-ltp.sh ltp/testcases/bin/syscall01
# ./test-ltp.sh ltp/testcases/bin/time01
# ./test-ltp.sh ltp/testcases/bin/times01
# ./test-ltp.sh ltp/testcases/bin/uname01
# ./test-ltp.sh ltp/testcases/bin/uname02
# ./test-ltp.sh ltp/testcases/bin/wait01
# ./test-ltp.sh ltp/testcases/bin/wait02
# ./test-ltp.sh ltp/testcases/bin/wait401
# ./test-ltp.sh ltp/testcases/bin/waitpid01
# ./test-ltp.sh ltp/testcases/bin/waitpid03
# ./test-ltp.sh ltp/testcases/bin/waitpid04
# ./test-ltp.sh ltp/testcases/bin/write02
# ./test-ltp.sh ltp/testcases/bin/write03
# ./test-ltp.sh ltp/testcases/bin/write05
# ./test-ltp.sh ltp/testcases/bin/writev01
# ./test-ltp.sh ltp/testcases/bin/write01
# busybox echo "run unixbench_testcode.sh"
# ./unixbench_testcode.sh
# #busybox echo "run cyclic_testcode.sh"
# #./cyclictest_testcode.sh