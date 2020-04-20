# freebsd-bootstrap-cli
.NET bootstrap cli project

[![Build Status](https://api.cirrus-ci.com/github/wfurt/freebsd-bootstrap-cli.svg)](https://cirrus-ci.com/github/wfurt/freebsd-bootstrap-cli)

This projects is aiming to automate creation of .NET cli on FreeBSD.
This is not production ready - use https://github.com/dotnet/source-build for that.
However to build .NET Core you have to have functional .NET Core. And you can get it right here. (if you are lucky) 

Right now, this project is in early stages. To proceed run:

Install packages (if needed) (needs root)
```sh
sudo ./scripts/packages.sh
```

get various prerequisites from Internet
```sh
./scripts/download.sh
```

get .NET source code
```sh
./scripts/checkout.sh
```

setup build environment (needs root)
```sh
sudo ./scripts/setup.sh
```

start QEMU with Linux image.
```sh
./scripts/runQemu.sh &
export QEMU_PID=$!
```

Wait for QEMU to boot or run TBD
```sh
???
```

Update Linux image with dependencies we need
```sh
 ./scripts/updateQemu.sh
```

and then

```sh
./scripts/build.sh
```

It is incomplete but it should build _some_ bits.
