#!/usr/bin/env bash

set -e

. config

DOTNET_BUILD_SKIP_CROSSGEN=1 installer/build.sh  -c release /p:IncludeAspNetCoreRuntime=false /p:CreateCrossgenSymbols=false
ls -al installer/artifacts/bin/redist/Release/dotnet/sdk/
