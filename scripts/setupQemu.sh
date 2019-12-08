#!/bin/sh

if [ ! -f artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw ]; then
  if [ ! -f artifacts/download/xenial-server-cloudimg-amd64-disk1.img ]; then
      echo Run download.sh script to get Ubuntu fragments.
      exit 1
  fi
  mkdir -p artifacts/linux/
  qemu-img convert  artifacts/download/xenial-server-cloudimg-amd64-disk1.img  artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw
  chmod 666 artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw
fi

if [ ! -f artifacts/linux/data.raw ]; then
  qemu-img create -f raw -o size=20G artifacts/linux/data.raw
fi

# mount images
mkdir artifacts/rootfs
kldload ext2fs 2>/dev/null
MD=`mdconfig -a artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw`
echo MD=$MD
mount -t ext2fs /dev/${MD}s1 artifacts/rootfs
ls -al artifacts/rootfs

# extract kernel and initrd
cp artifacts/rootfs/vmlinuz artifacts/linux
cp artifacts/rootfs/initrd.img artifacts/linux
chmod 666 artifacts/linux/*
chmod 777 artifacts/linux

# enable no-password for root and add ssh keys
sed -I .old 's/root:\*:/root::/' artifacts/rootfs/etc/shadow
if [ ! -f artifacts/sshKeys ]; then
  ssh-keygen -N '' -f artifacts/sshKeys
fi
mkdir -p artifacts/rootfs/root/.ssh
chmod 755 artifacts/rootfs/root/.ssh
cp artifacts/sshKeys.pub artifacts/rootfs/root/.ssh/authorized_keys

#disable cloud init
#rm -rf artifacts/rootfs/etc/systemd/system/cloud*
touch  /etc/cloud/cloud-init.disabled

sync
umount artifacts/rootfs
mdconfig -d -u $MD
