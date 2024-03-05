
sudo chmod 777 disk.img
pwd
sudo mkdir ../simple-fat32/fs 
sudo mount ../simple-fat32/disk.img ../simple-fat32/fs 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/initproc ../simple-fat32/fs/ 
sudo cp ../user/target/riscv64gc-unknown-none-elf/release/user_shell ../simple-fat32/fs/ 
sudo umount ../simple-fat32/fs 
sudo rmdir ../simple-fat32/fs
