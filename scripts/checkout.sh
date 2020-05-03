#!/usr/bin/env bash

set -e

. config

if [ -z "$1" ] || [ "$1" == 'installer' ]; then
  git clone https://github.com/dotnet/installer --branch ${SDK_BRANCH} --single-branch --depth 1
fi
if [ -z "$1" ] || [ "$1" == 'sdk' ] ; then
  git clone https://github.com/dotnet/sdk --branch ${SDK_BRANCH} --single-branch --depth 1
fi
if [ -z "$1" ] || [ "$1" == 'runtime' ]; then
  git clone https://github.com/dotnet/runtime --branch ${RUNTIME_BRANCH} --single-branch --depth 1
fi



