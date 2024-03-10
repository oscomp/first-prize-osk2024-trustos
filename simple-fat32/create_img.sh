# 制作一个全0的镜像文件
dd if=/dev/zero of=fat32.img bs=4M count=64

# 格式化为 fat32
sudo mkfs.vfat -F 32 fat32.img
sudo chmod 777 fat32.img
pwd
sudo mkdir ../simple-fat32/fs 
sudo mount ../simple-fat32/fat32.img ../simple-fat32/fs 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/initproc ../simple-fat32/fs/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/user_shell ../simple-fat32/fs/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/cat ../simple-fat32/fs/ 
sudo cp -r ../testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/* ../simple-fat32/fs/ 

sudo umount ../simple-fat32/fs 
sudo rmdir ../simple-fat32/fs
