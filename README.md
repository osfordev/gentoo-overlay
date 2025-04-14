# Gentoo Overlay

This is a Gentoo Overlay used by [**OS For Developer**](https://github.com/osfordev) project.

## Developer Notes

### Update kernel configuration

Basically we hold on fixed versions of gentoo-sources (via mask.packages).
As result we have to update kernel configurations for each profile to be up to date.

Use following snippet to apply `make oldconfig` for each kernel configuration

- Arch: amd64
    ```shell
    docker run --rm --interactive --tty \
      --platform linux/amd64 \
      --mount type=bind,source="${PWD}",target=/data \
      theanurin/gentoo-sources-bundle:amd64-5.15.177

    cd /data/profiles
    PROFILES_DIR=$(pwd)
    for PROFILE_AMD64 in \
      "27K51EA#A2Q" \
      "B2G18EC#ABA" \
      "C3C58ES#AKD" \
      "D4H65EC#AKD" \
      "DELLCS24SC" \
      "DigitalOceanDroplet" \
      "H5E56ET#ABU" \
      "qemu-guest/builder/amd64" \
      "V5-131_0742/amd64" \
      "virtualbox-guest/amd64" \
      "tw00" \
      "tw04" \
      ; do
        export KCONFIG_CONFIG="$PROFILES_DIR/$PROFILE_AMD64/kernel.config"
        echo "Updating $PROFILE_AMD64 ..."
        (cd /usr/src/linux && make oldconfig && rm -f "${KCONFIG_CONFIG}.old")
    done
    ```
- Arch: arm32v7
    ```shell
    docker run --rm --interactive --tty \
      --platform linux/arm/v7 \
      --mount type=bind,source="${PWD}",target=/data \
      theanurin/gentoo-sources-bundle:arm32v7-5.15.177

    cd /data/profiles
    PROFILES_DIR=$(pwd)
    for PROFILE_ARM32V7 in \
      "cubietruck" \
      "qemu-guest/builder/arm32v7" \
      ; do
        export KCONFIG_CONFIG="$PROFILES_DIR/$PROFILE_ARM32V7/kernel.config" 
        echo "Updating $PROFILE_ARM32V7 ..."
        (cd /usr/src/linux && make oldconfig && rm -f "${KCONFIG_CONFIG}.old")
    done
    ```
- Arch: x86
    ```shell
    docker run --rm --interactive --tty \
      --platform linux/386 \
      --mount type=bind,source="${PWD}",target=/data \
      theanurin/gentoo-sources-bundle:i686-5.15.177

    cd /data/profiles
    PROFILES_DIR=$(pwd)
    for PROFILE_X86 in \
      "ASRockPV530" \
      "V5-131_0742/x86" \
      ; do
        export KCONFIG_CONFIG="$PROFILES_DIR/$PROFILE_X86/kernel.config" 
        echo "Updating $PROFILE_X86 ..."
        (cd /usr/src/linux && make oldconfig && rm -f "${KCONFIG_CONFIG}.old")
    done
    ```

### Test kernel build via Docker

```shell
# Choose one of
export PROFILE=27K51EA#A2Q
export PROFILE=B2G18EC#ABA
export PROFILE=C3C58ES#AKD
export PROFILE=D4H65EC#AKD
export PROFILE=DigitalOceanDroplet
export PROFILE=H5E56ET#ABU
export PROFILE=V5_131_0742_V2_21/amd64
export PROFILE=VirtualBoxGuest/amd64
export PROFILE=qemu-guest/amd64
export PROFILE=zxtower00
export PROFILE=zxtower02
export PROFILE=zxtower04

# See https://packages.gentoo.org/packages/sys-kernel/gentoo-sources
export KERNEL_VERSION=5.15.177

docker run --rm --interactive --tty \
  --platform linux/amd64 \
  --env KCONFIG_OVERWRITECONFIG=y \
  --mount type=bind,source="${PWD}/profiles/${PROFILE}",target=/data \
  "theanurin/gentoo-sources-bundle:amd64-${KERNEL_VERSION}"

ln -s /data/kernel.config .config
make menuconfig

emerge-webrsync
FEATURES="-ipc-sandbox -network-sandbox -pid-sandbox" ACCEPT_LICENSE="*" emerge --oneshot sys-firmware/intel-microcode sys-kernel/linux-firmware

make -j$(nproc)

exit
```
