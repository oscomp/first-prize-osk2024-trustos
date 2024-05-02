# 制作一个全0的镜像文件
dd if=/dev/zero of=fat32.img bs=4M count=32

DIR=fat32_fs

# 格式化为 fat32
sudo mkfs.vfat -F 32 fat32.img
sudo chmod 777 fat32.img
pwd
sudo mkdir ../${DIR}/fs 
sudo mount ../${DIR}/fat32.img ../${DIR}/fs 
#sudo cp ../user/target/riscv64gc-unknown-none-elf/release/initproc ../${DIR}/fs/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/user_shell ../${DIR}/fs/ 
sudo mkdir ../${DIR}/fs/rCoretests
sudo rm ../user/target/riscv64gc-unknown-none-elf/release/*.*
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/* ../${DIR}/fs/rCoretests/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/initproc ../${DIR}/fs/
# sudo rm ../${DIR}/fs/rCoretests/usertests 
sudo rm ../${DIR}/fs/rCoretests/initproc 

sudo cp ../user/target/riscv64gc-unknown-none-elf/release/usertests ../${DIR}/fs
sudo cp -r ../testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/* ../${DIR}/fs/ 
# sudo cp ../busybox_unstripped ../${DIR}/fs/busybox

sudo umount ../${DIR}/fs 
sudo rmdir ../${DIR}/fs
