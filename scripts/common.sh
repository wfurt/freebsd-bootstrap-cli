#!/usr/bin/env bash

function runCmdQemu()
{
  ssh root@127.0.0.1 -p 8022 -i artifacts/sshKeys "$@"
}

function runCmdVagrant()
{
  pushd ~
  vagrant ssh "$@"
  popd
}

function runCmd()
{
  if [[ "${VIRTUALIZATION}" == "qemu" ]]; then
    runCmdQemu "$@"
  else
    runCmdVagrant "$@"
  fi
}

function updateSshKeys()
{
  ssh-keygen -R '[127.0.0.1]:8022'
  ssh-keyscan  -t ecdsa   -p 8022 127.0.0.1 >> ~/.ssh/known_hosts
}

function rsyncQemu ()
{
  rsync -av -e 'ssh -p 8022 root@127.0.0.1 -i artifacts/sshKeys' "$@"
}

function rsyncVagrant ()
{
  rsync -av -e 'vagrant ssh' "@"
}

function rsyncToLinux()
{
  if [[ "${VIRTUALIZATION}" -eq "qemu" ]]; then
    rsyncQemu artifacts/sources/* :/mnt/sources
  else
    rsyncVagrant artifacts/sources/* :/mnt/sources
  fi
}
