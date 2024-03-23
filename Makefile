all:
	@cd ./os&&make build
	@cp os/target/riscv64gc-unknown-none-elf/release/os ./kernel-qemu

run:all
	@qemu-system-riscv64 \
		-machine virt \
		-kernel kernel-qemu \
		-m 128M \
		-nographic \
		-smp 2 \
		-bios ./bootloader/rustsbi-qemu.bin \
		-drive file=./simple-fat32/fat32.img,if=none,format=raw,id=x0 \ 
		-device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 \
		-device virtio-net-device,netdev=net \
		-netdev user,id=net
	@rm kernel-qemu

.PHONY: all run