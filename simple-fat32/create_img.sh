# 制作一个全0的镜像文件
dd if=/dev/zero of=fat32.img bs=4M count=32

# 格式化为 fat32
sudo mkfs.vfat -F 32 fat32.img
sudo chmod 777 fat32.img
pwd
sudo mkdir ../simple-fat32/fs 
sudo mount ../simple-fat32/fat32.img ../simple-fat32/fs 
#sudo cp ../user/target/riscv64gc-unknown-none-elf/release/initproc ../simple-fat32/fs/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/user_shell ../simple-fat32/fs/ 
sudo mkdir ../simple-fat32/fs/rCoretests
sudo rm ../user/target/riscv64gc-unknown-none-elf/release/*.*
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/* ../simple-fat32/fs/rCoretests/ 
sudo rm ../simple-fat32/fs/rCoretests/usertests 
sudo rm ../simple-fat32/fs/rCoretests/initproc 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/usertests ../simple-fat32/fs
sudo cp -r ../testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/* ../simple-fat32/fs/ 
sudo cp ../busybox ../simple-fat32/fs/busybox

sudo umount ../simple-fat32/fs 
sudo rmdir ../simple-fat32/fs
