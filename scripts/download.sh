#!/bin/sh

mkdir -p artifacts/download

if [ ! -f artifacts/download/dotnet-install.sh ]; then
curl -o artifacts/download/dotnet-install.sh  https://dot.net/v1/dotnet-install.sh
fi

#if [ ! -f artifacts/download/xenial-server-cloudimg-amd64-vmlinuz-generic ]; then
#  curl -L -o artifacts/download/xenial-server-cloudimg-amd64-vmlinuz-generic https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-vmlinuz-generic
#fi

#if [ ! -f artifacts/download/xenial-server-cloudimg-amd64-initrd-generic ]; then
#  curl -L -o artifacts/download/xenial-server-cloudimg-amd64-initrd-generic  https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-initrd-generic
#fi

mkdir -p artifacts/linux
if [ ! -f artifacts/download/xenial-server-cloudimg-amd64-disk1.img ]; then
  curl -L -o artifacts/download/xenial-server-cloudimg-amd64-disk1.img https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img
fi

#mkdir -p artifacts/linux
#if [ ! -f  artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw ];then
#  qemu-img convert  artifacts/download/xenial-server-cloudimg-amd64-disk1.img  artifacts/linux/xenial-server-cloudimg-amd64-disk1.raw
#fi
