# cd ../final_tests/libc-bench
# sudo make clean
# cd -
# make libc-bench

cd ../lwext4_rust 
./create_img.sh
cd -
make clean
make run