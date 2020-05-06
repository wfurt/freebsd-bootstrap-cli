#!/usr/bin/env bash

. config

docker run --volume $(pwd):$(pwd) --env ROOTFS_DIR=/crossrootfs/x64 --workdir $(pwd) -ti ${DOCKER_TAG} "$@"

