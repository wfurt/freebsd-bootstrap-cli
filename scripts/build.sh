#!/usr/local/bin/bash

. artifacts/config
. scripts/common.sh

(cd artifacts/sources/coreclr ; ./build.sh -clang6.0 -skiptests -skipmanagedtools -skipmanaged -Release)
(cd artifacts/sources/core-setup ; src/corehost/build.sh  --configuration Release  --arch x64 --hostver ${RUNTIME_VERSION} --apphostver ${RUNTIME_VERSION}  --fxrver ${RUNTIME_VERSION}  --policyver ${RUNTIME_VERSION} --commithash ${RUNTIME_HASH})

rsyncToLinux
runCmd "(cd /mnt/sources/coreclr; ./build.sh -skipnative  -skipcrossgen -release -osGroup=FreeBSD)"
