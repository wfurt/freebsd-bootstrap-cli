#!/usr/bin/env bash

set -e

SDK_VERSION=3.0.100
RUNTIME_VERSION='3.0.0'
if [ -f DEFAULTS ]; then
. DEFAULTS
fi

mkdir -p artifacts/dotnet

if [ ! -f artifacts/dotnet-sdk-${SDK_VERSION}-linux-x64.tar.gz ]; then
curl -L -o artifacts/dotnet-sdk-${SDK_VERSION}-linux-x64.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/${SDK_VERSION}/dotnet-sdk-${SDK_VERSION}-linux-x64.tar.gz
fi

if [ ! -f artifacts/dotnet/dotnet ]; then
(cd artifacts/dotnet ; tar xfz ../dotnet-sdk-${SDK_VERSION}-linux-x64.tar.gz)
fi

if [ -f ${SDK_VERSION}/commits ]; then
. ${VERSION}/commits
fi

### guess versions if not set.
if [ -e $SDK_HASH ]; then
SDK_HASH=`head -1 artifacts/dotnet/sdk/${SDK_VERSION}/.version`
fi
if [ -e $RUNTIME_HASH ]; then
RUNTIME_HASH=`head -1  artifacts/dotnet/shared/Microsoft.NETCore.App/${RUNTIME_VERSION}/.version`
fi
if [ -e $CORECLR_HASH ]; then
CORECLR_HASH=`strings artifacts/dotnet/shared/Microsoft.NETCore.App/${RUNTIME_VERSION}/libcoreclr.so| grep @Commit:| cut -d ' ' -f4`
fi
if [ -e $COREFX_HASH ]; then
COREFX_HASH=`strings artifacts/dotnet/shared/Microsoft.NETCore.App/${RUNTIME_VERSION}/System.Native.so | grep @Commit: | cut -d ' ' -f4`
fi

if [ -e $COREFX_HASH ]; then
  echo COREFX_HASH must be set.
  exit 1
fi

if [ ! -d artifacts/sources/corefx ]; then
  git clone -b release/3.0 https://github.com/dotnet/corefx  artifacts/sources/corefx
  (cd  artifacts/sources/corefx; git checkout ${COREFX_HASH})
fi

if [ ! -d artifacts/sources/coreclr ]; then
  git clone https://github.com/dotnet/coreclr  artifacts/sources/coreclr
  (cd  artifacts/sources/coreclr; git checkout ${CORECLR_HASH})
fi

if [ ! -d artifacts/sources/core-setup ]; then
  git clone https://github.com/dotnet/core-setup  artifacts/sources/core-setup
  (cd  artifacts/sources/core-setup; git checkout ${RUNTIME_HASH})
fi

if [ ! -d artifacts/sources/core-sdk ]; then
  git clone https://github.com/dotnet/core-sdk  artifacts/sources/core-sdk
  (cd  artifacts/sources/core-sdk; git checkout ${CORESDK_HASH})
fi

if [ -d ${SDK_VERSION}/patches ]; then
   echo TBD PATEHCES!
   exit 1
fi

echo SDK_VERSION==${SDK_VERSION} > artifacts/config
echo RUNTIME_VERSION=${RUNTIME_VERSION} >> artifacts/config
echo RUNTIME_HASH=${RUNTIME_HASH} >> artifacts/config
echo SDK_HASH=${SDK_HASH} >> artifacts/config
