#!/bin/bash

#export CC=gcc

#./looper 20 ./multi.sh 1 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench SHELL1 test(lpm): "$0}'
#./looper 20 ./multi.sh 8 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench SHELL8 test(lpm): "$0}'
./looper 20 ./multi.sh 16 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench SHELL16 test(lpm): "$0}'
#./looper 30 dc < ../testdir/dc.dat 2>&1

./arithoh 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench ARITHOH test(lps): "$0}'
./short 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench SHORT test(lps): "$0}'
./int 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench INT test(lps): "$0}'
./long 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench LONG test(lps): "$0}'
./float 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench FLOAT test(lps): "$0}'
./double 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench DOUBLE test(lps): "$0}'
./hanoi 10 | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench HANOI test(lps): "$0}'
./syscall 10 exec | ./busybox grep -o "COUNT|[[:digit:]]\+|" | ./busybox grep -o "[[:digit:]]\+" | ./busybox awk '{print "Unixbench EXEC test(lps): "$0}'
