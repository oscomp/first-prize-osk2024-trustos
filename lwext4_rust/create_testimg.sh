# 制作一个全0的镜像文件
dd if=/dev/zero of=ext4.img bs=1M count=1

DIR=lwext4_rust

# 格式化为 ext4
sudo mkfs.ext4 ext4.img
sudo chmod 777 ext4.img
sudo mkdir ../${DIR}/fs 
guestmount -a ../${DIR}/ext4.img -i --rw ../${DIR}/fs
sudo cp ../final_tests/test_all_1stage.sh ../${DIR}/fs/ 
guestunmount ../${DIR}/fs
sudo rmdir ../${DIR}/fs
