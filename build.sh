#!/usr/bin/env bash

#set -e 
. ./config

./scripts/download.sh
./scripts/checkout.sh
sudo ./scripts/setupQemu.sh


