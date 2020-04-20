#!/bin/sh

if [ "${VIRTUALIZATION}" = "qemu" ]; then
  VIRTULIZATION_ADDITIONS="qemu-devel"
else
  if [ -n "$SUDO_USER" ]; then
    pw groupadd vboxusers
    pw group mod vboxusers -m $SUDO_USER
  fi

  VIRTULIZATION_ADDITIONS="vagrant virtualbox-ose"
fi

pkg install -y $VIRTULIZATION_ADDITIONS libunwind cmake llvm60 bash rsync krb5 icu openssl lttng-ust git python

if [ "$VIRTUALIZATION" != "qemu" ]; then
  kldload vboxdrv
fi
