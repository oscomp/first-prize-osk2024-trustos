# busybox echo "run time-test"
# ./time-test
# busybox echo "run busybox_testcode.sh"
# ./busybox_testcode.sh
# busybox echo "run iozone_testcode.sh"
# ./iozone_testcode.sh
# busybox echo "run libctest_testcode.sh"
# ./libctest_testcode.sh
# busybox echo "run libc-bench"
# ./libc-bench
# busybox echo "run splice-test"
# ./splice-test-1
# ./splice-test-2
# ./splice-test-3
# ./splice-test-4
# ./splice-test-5
# busybox echo "run lua_testcode.sh"
# ./lua_testcode.sh
# busybox echo "run lmbench_testcode.sh"
# ./lmbench_testcode.sh
# busybox echo "run netperf_testcode.sh"
# ./netperf_testcode.sh
# busybox echo "run iperf_testcode.sh"
# ./iperf_testcode.sh
# busybox echo "run unixbench_testcode.sh"
# ./unixbench_testcode.sh

# busybox time test-ltp.sh ltp/testcases/bin/abort01 | busybox tee ltp-result.txt


busybox echo "run ltp-test"
busybox touch ./ltp-result.txt
busybox time busybox sh -c "busybox ls --color=never -1 ltp/testcases/bin/ | busybox xargs -n 1 -I {} ./test-ltp.sh ltp/testcases/bin/{}" 
./ltp_count.sh

# busybox time ./test-ltp.sh ltp/testcases/bin/abort01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/abs01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/access01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/access03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/access04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/brk01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/brk02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/chdir04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/clock_getres01  | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/clock_gettime01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/clock_gettime02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/clock_nanosleep01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/clone01 | busybox tee ltp-result.txt 
# busybox time ./test-ltp.sh ltp/testcases/bin/clone04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/close01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/close02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/copy_file_range03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup07 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup201 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup202 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup203 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup204 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup205 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup206 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup207 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup3_01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/dup3_02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/exit02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/faccessat01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/faccessat02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fchmod01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fchmod04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fchmodat01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fchmodat02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fcntl03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fcntl04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fcntl08 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fcntl12 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/fstat03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/ftruncate01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getcwd01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getpagesize01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getppid02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrandom01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrandom02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrandom03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrandom04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrandom05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrusage01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getrusage02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/gettid02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/gettimeofday01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/gettimeofday02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/getuid01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/lseek01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/lseek07 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/madvise01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/memcpy01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/memset01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mkdir05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap06 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap08 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap09 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mmap19 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/mprotect05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/nanosleep02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/nanosleep04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/open01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/open03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/open04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/open09 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe06 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe08 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe10 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe11 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe13 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe14 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pipe2_01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/poll01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pread01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pread02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pselect03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pwrite01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pwrite02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/pwrite03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/read01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/read02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/read04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/readdir01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/readv01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/readv02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/select03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sendfile02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sendfile03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sendfile05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sendfile06 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sendfile08 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/set_tid_address01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/setitimer01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/setitimer02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/sigaction01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/stat01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/stat02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/string01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/symlink02 | busybox tee ltp-result.txt 
# busybox time ./test-ltp.sh ltp/testcases/bin/symlink04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/syscall01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/time01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/times01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/uname01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/uname02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/wait01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/wait02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/wait401 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/waitpid01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/waitpid03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/waitpid04 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/write02 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/write03 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/write05 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/writev01 | busybox tee ltp-result.txt
# busybox time ./test-ltp.sh ltp/testcases/bin/write01 | busybox tee ltp-result.txt
# busybox echo "run unixbench_testcode.sh"
# ./unixbench_testcode.sh
# #busybox echo "run cyclic_testcode.sh"
# #./cyclictest_testcode.sh