#!/bin/sh

. ./config

mkdir -p ${ARTIFACTS_DIR}/download

if [ ! -f ${ARTIFACTS_DIR}/download/dotnet-install.sh ]; then
curl -o ${ARTIFACTS_DIR}/download/dotnet-install.sh  https://dot.net/v1/dotnet-install.sh
fi

#if [ ! -f ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-vmlinuz-generic ]; then
#  curl -L -o ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-vmlinuz-generic https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-vmlinuz-generic
#fi

#if [ ! -f ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-initrd-generic ]; then
#  curl -L -o ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-initrd-generic  https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-initrd-generic
#fi

mkdir -p ${ARTIFACTS_DIR}/linux
if [ ! -f ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-disk1.img ]; then
  curl -L -o ${ARTIFACTS_DIR}/download/xenial-server-cloudimg-amd64-disk1.img https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img
fi

