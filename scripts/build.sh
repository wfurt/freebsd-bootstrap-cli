#!/usr/local/bin/bash

. artifacts/config
. scripts/common.sh

(cd artifacts/sources/coreclr ; ./build.sh -clang6.0 -skiptests -skipmanagedtools -skipmanaged -Release -portable)
(cd artifacts/sources/corefx ;  ./src/Native/build-native.sh -release)
(cd artifacts/sources/core-setup ; src/corehost/build.sh  --configuration Release  --arch x64 --hostver ${RUNTIME_VERSION} --apphostver ${RUNTIME_VERSION}  --fxrver ${RUNTIME_VERSION}  --policyver ${RUNTIME_VERSION} --commithash ${RUNTIME_HASH})

rsyncToLinux
runCmd "(cd /mnt/sources/coreclr; bash -x ./build.sh -skiptests -skipmanagedtools -skipnative  -skipcrossgen -release -osgroup FreeBSD /p:osGroup=FreeBSD /p:PackageRid=freebsd-x64 | tee coreclr.log)"
runCmd "(cd /mnt/sources/corefx; ./build.sh -c Release --restore)"
runCmd "(cd /mnt/sources/corefx; ./build.sh -c Release --build  /p:osGroup=FreeBSD /p:PackageRid=freebsd-x64)"
