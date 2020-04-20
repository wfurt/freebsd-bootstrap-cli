#!/usr/bin/env bash

. artifacts/config
. scripts/common.sh

runCmd "ln -s /vagrant/sources /mnt/sources"
runCmd apt update -y

# build prerequisites
runCmd apt install -y libunwind8 libicu55 curl git clang-3.9 cmake make libc6-dev libssl-dev libkrb5-dev libcurl4-openssl-dev zlib1g-dev liblldb-3.9-dev gettext libicu-dev liblttng-ust-dev libkrb5-dev
