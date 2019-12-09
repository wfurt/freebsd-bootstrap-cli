#!/bin/sh

qemu-system-x86_64 -smp 2 -m 4024 -nographic -serial mon:stdio -append 'console=ttyS0 root=/dev/sda1'  -kernel artifacts/linux/vmlinuz -initrd artifacts/linux/initrd.img -drive file=artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw,format=raw -drive file=artifacts/linux/data.raw,format=raw -netdev user,id=ethernet.0,hostfwd=tcp::8022-:22 -device e1000,netdev=ethernet.0
