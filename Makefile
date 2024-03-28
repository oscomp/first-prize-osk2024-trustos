all:
	# @cd ./os&&make build
	@cp os/target/riscv64gc-unknown-none-elf/release/os.bin ./kernel-qemu
	@pwd

run:
	@qemu-system-riscv64 \
		-machine virt \
		-kernel kernel-qemu \
		-m 128M \
		-nographic \
		-smp 2 \
		-bios sbi-qemu \
		-drive file=disk.img,if=none,format=raw,id=x0  \
		-device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 \
		-device virtio-net-device,netdev=net \
		-netdev user,id=net
	@rm kernel-qemu

.PHONY: all run