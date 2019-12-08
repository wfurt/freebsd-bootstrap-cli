#!/usr/local/bin/bash -e

. scripts/common.sh

updateSshKeys

#while [ 1 ]; do
#runCmd echo
#if [ $? == 0 ]; then
#  break
#fi
#sleep 20
#done

runCmd 'if [ ! -d /mnt/sources ]; then ( mkfs /dev/sdb; echo "/dev/sdb /mnt ext2 defaults 0 0" >> /etc/fstab ; mount -a; mkdir -p /mnt/sources /mnt/tmp /mnt/packages ~/.nuget; chmod 777 /mnt/tmp; rm -rf /tmp ~/.nuget/packages; ln -sf /mnt/tmp /; ln -sf /mnt/packages ~/.nuget/) fi'

runCmd apt update -y
runCmd apt upgrade -y
# build prerequisites
runCmd apt install -y libunwind8 libicu55 curl git clang-3.9 cmake make libc6-dev libssl-dev libkrb5-dev libcurl4-openssl-dev zlib1g-dev liblldb-3.9-dev gettext libicu-dev liblttng-ust-dev libkrb5-dev


