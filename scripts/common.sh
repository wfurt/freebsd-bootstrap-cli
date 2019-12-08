
function runCmd()
{
  ssh root@127.0.0.1 -p 8022 -i artifacts/sshKeys "$@"
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

function rsyncToLinux()
{
  rsyncQemu artifacts/sources/* :/mnt/sources
}
