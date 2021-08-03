# Linux-Kernel_MiSTer_build
Docker for building firmware for the
[MiST](https://github.com/MiST-devel)

## Description

First stage is building a docker, that in essence is a debian installation with
the build requirements.

The second stage is running the docker, which will build firmware for you to copy to your MiST.
You should run the docker with a mounted volume, which is where the finished
kernel image will be copied. I typically run it with `-v $(pwd):/mnt`, which
mounts current directory as `/mnt` inside the docker instance. If there is a
file `MiSTer_config` in the specified directory, it will be copied to the new
kernel config, before the kernel config menu is presented. Make your changes to
the kernel (or not) and exit the menu config, and the kernel is recompiled with
the new options (since the kernel has already been built in the initial docker,
the build time highly reduced compared to building from scratch). At last the
new kernel and the new config are copied out to the bind mounted volume on
`/mnt`, in my case current directory, as `zImage_dtb` and `MiSTer_config`.

### Using Docker

```
docker build -t mist_firmware .
docker run -v $(pwd):/mnt -ti mist_firmware
```

