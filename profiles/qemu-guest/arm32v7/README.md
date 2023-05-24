Build kernel through Docker

```shell
docker run \
  --rm \
  --interactive \
  --tty \
  --platform linux/arm/v7 \
  --mount type=bind,source="${PWD}",target=/data \
  --volume cache:/cache \
  --env KBUILD_OUTPUT=/cache/arm32v7 \
  --env KCONFIG_OVERWRITECONFIG=y \
  theanurin/gentoo-sources-bundle:5.15.102

# Inside container
mkdir /cache/arm32v7
ln --symbolic /data/profiles/qemu-guest/arm32v7/kernel.config /cache/arm32v7/.config
make menuconfig
make -j$(nproc)
file arch/arm/boot/zImage
```