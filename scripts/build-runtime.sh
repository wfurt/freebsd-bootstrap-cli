#!/usr/bin/env bash

set -e


runtime/build.sh -c release -cross -os FreeBSD
# build tests
runtime/build.sh -c release -cross -os FreeBSD subset Libs.Tests /p:archivetests=true
runtime/eng/common/msbuild.sh runtime/src/libraries/sendtohelix.proj /t:CompressRuntimeDirectory /p:HelixTargetQueue=FreeBSD  /p:TargetOS=FreeBSD /p:Configuration=Release

