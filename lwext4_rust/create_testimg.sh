# 制作一个全0的镜像文件
dd if=/dev/zero of=ext4.img bs=1M count=1

DIR=lwext4_rust

# 格式化为 ext4
mkfs.ext4 ext4.img
chmod 777 ext4.img
mkdir ../${DIR}/fs 
guestmount -a ../${DIR}/ext4.img -m /dev/sda --rw ../${DIR}/fs
cp ../final_tests/test_all_1stage.sh ../${DIR}/fs/ 
guestunmount ../${DIR}/fs
rmdir ../${DIR}/fs
