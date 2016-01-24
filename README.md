# Unikernel demo

Contains the source code for the unikernel demo with Docker, Nginx and Rumprun.
Original here: [https://github.com/Unikernel-Systems/DockerConEU2015-demo](https://github.com/Unikernel-Systems/DockerConEU2015-demo)

## Requirements

* A Linux machine with KVM and Docker installed.
* As part of the build process, `genisoimage` need to be installed
  on the host in order to generate the filesystems used by the unikernels. On
  Ubuntu, `apt-get install genisoimage` is sufficient.
* `docker-unikernel` requires root access in order to be able to plumb
  networking into the unikernel/KVM container.

## Minimal quick start

1. `make pull`. This pulls `mato/rumprun-packages-hw-x86_64` which will take a
   while. This image contains the prebuilt rumprun unikernels for mysql, nginx
   and php.
2. `make`. This builds the unikernel containers.
3. `make rundns`. Runs a DNS server on docker0, using `mgood/resolvable`.
4. `sudo ./docker-unikernel run -P --hostname nginx unikernel/nginx`.
5. Browse to `http://nginx/`.

This will start a container with an Nginx unikernel, serving static files.
