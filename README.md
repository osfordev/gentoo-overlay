# Gentoo Overlay

This is a Gentoo Overlay used by [**OS For Developer**](https://github.com/osfordev) project.

## Quick Start

### Via `eselect-repository`

```shell
eselect repository add osfordev git https://github.com/osfordev/gentoo-overlay.git
```

### Manual Repo Config

```shell
mkdir /etc/portage/repos.conf

cat <<EOF > /etc/portage/repos.conf/default.conf
[gentoo]
location = /var/db/repos/gentoo
priority = 0
eclass-overrides = osfordev
sync-type = webrsync
EOF

cat <<EOF > /etc/portage/repos.conf/osfordev.conf
[osfordev]
location = /var/db/repos/osfordev
# Higher priority (default gentoo is -1000) ensures that our ebuilds take precedence in case of version collisions.
priority = 50
auto-sync = yes

sync-type = zipfile
sync-uri = https://osfordev.github.io/gentoo-overlay/latest.zip

#sync-type = git
#sync-uri = https://github.com/osfordev/gentoo-overlay.git
#sync-git-clone-extra-opts = --single-branch --branch dev
EOF

emerge --sync
```

## Additional Configuration

```shell
eselect profile list
eselect profile set osfordev:.../.../....
```

```shell
emerge --oneshot gentoo-sources
```

```shell
cat <<EOF > /etc/env.d/99kernel-config
# https://www.kernel.org/doc/html/v6.12/kbuild/kconfig.html#environment-variables

#
# If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will
# not break symlinks when .config is a symlink to somewhere else.
#
KCONFIG_OVERWRITECONFIG=y

#
# This environment variable can be used to specify a default kernel
# config file name to override the default name of “.config”.
#
KCONFIG_CONFIG=/etc/portage/make.profile/kernel.config
EOF

env-update
```

```shell
ln --symbolic /etc/portage/make.profile/kernel.config /usr/src/linux/.config
```

## Developer Notes

### Update `config-latest-gentoo`

Basically we hold on fixed versions of gentoo-sources (via mask.packages).
As result we have to update kernel configurations for each profile to be up to date.

Use following snippet to apply `make oldconfig` for each kernel configuration

- Arch: amd64
  ```shell
  docker run --rm --interactive --tty \
    --platform linux/amd64 \
    --mount type=bind,source="${PWD}",target=/data \
    theanurin/gentoo-sources-bundle:amd64-6.18.26

  for PROFILE_BUNDLE in \
    "27K51EA#A2Q:27K51EA#A2Q" \
    "B2G18EC#ABA:B2G18EC#ABA" \
    "C3C58ES#AKD:C3C58ES#AKD" \
    "D4H65EC#AKD:D4H65EC#AKD" \
    "DELLCS24SC:DELLCS24SC" \
    "DigitalOceanDroplet:DigitalOceanDroplet" \
    "H5E56ET#ABU:H5E56ET#ABU" \
    "qemuguest/builder/amd64:qemuguestbuilder" \
    "V5_131_0742/amd64:V5_131_0742" \
    "virtualboxguest/amd64:virtualboxguest" \
    "tw00:tw00" \
    "tw02:tw02" \
    "tw04:tw04" \
    ; do
      PROFILE_DIR="/data/profiles/$(echo ${PROFILE_BUNDLE} | cut -d: -f1)"
      PROFILE_NAME="$(echo ${PROFILE_BUNDLE} | cut -d: -f2)"
      export KCONFIG_CONFIG="${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      cp --dereference "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      echo "Updating ${KCONFIG_CONFIG} ..."
      make oldconfig
      rm "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
      ln --symbolic "config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
  done


  ```
- Arch: arm32v7
  ```shell
  docker run --rm --interactive --tty \
    --platform linux/arm/v7 \
    --mount type=bind,source="${PWD}",target=/data \
    theanurin/gentoo-sources-bundle:arm32v7-6.18.26

  for PROFILE_BUNDLE in \
    "cubietruck:cubietruck" \
    "qemuguest/builder/arm32v7:qemuguestbuilder" \
    ; do
      PROFILE_DIR="/data/profiles/$(echo ${PROFILE_BUNDLE} | cut -d: -f1)"
      PROFILE_NAME="$(echo ${PROFILE_BUNDLE} | cut -d: -f2)"
      export KCONFIG_CONFIG="${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      cp --dereference "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      echo "Updating ${KCONFIG_CONFIG} ..."
      make oldconfig
      rm "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
      ln --symbolic "config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
  done
  ```
- Arch: x86
  ```shell
  docker run --rm --interactive --tty \
    --platform linux/386 \
    --mount type=bind,source="${PWD}",target=/data \
    theanurin/gentoo-sources-bundle:i686-6.18.26

  for PROFILE_BUNDLE in \
    "ASRockPV530:ASRockPV530" \
    "qemuguest/builder/x86:qemuguestbuilder" \
    "V5_131_0742/x86:V5_131_0742" \
    "virtualboxguest/x86:virtualboxguest" \
    ; do
      PROFILE_DIR="/data/profiles/$(echo ${PROFILE_BUNDLE} | cut -d: -f1)"
      PROFILE_NAME="$(echo ${PROFILE_BUNDLE} | cut -d: -f2)"
      export KCONFIG_CONFIG="${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      cp --dereference "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}"
      echo "Updating ${KCONFIG_CONFIG} ..."
      make oldconfig
      rm "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
      ln --symbolic "config-${KERNEL_VERSION}-gentoo-${PROFILE_NAME}" "${PROFILE_DIR}/config-latest-gentoo-${PROFILE_NAME}"
  done

  NET_VENDOR_FUNGIBLE
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
export PROFILE=tw00
export PROFILE=tw02
export PROFILE=tw04

# See https://packages.gentoo.org/packages/sys-kernel/gentoo-sources
export KERNEL_VERSION=6.12.58

docker run --rm --interactive --tty \
  --platform linux/amd64 \
  --env KCONFIG_OVERWRITECONFIG=y \
  --env PROFILE \
  --mount type=bind,source="${PWD}/profiles/${PROFILE}",target=/data \
  "theanurin/gentoo-sources-bundle:amd64-${KERNEL_VERSION}"

ln -s /data/config-${KERNEL_VERSION}-gentoo-${PROFILE} .config
make menuconfig

emerge-webrsync
emerge --oneshot sys-firmware/intel-microcode sys-kernel/linux-firmware
FEATURES="-ipc-sandbox -network-sandbox -pid-sandbox" ACCEPT_LICENSE="*" emerge --oneshot sys-firmware/intel-microcode sys-kernel/linux-firmware

make -j$(nproc)

exit
```

### Add new target system

Get SKU number

```shell
emerge --ask --verbose sys-apps/dmidecode
SKU_NUMBER=$(dmidecode -s system-sku-number)
echo "SKU Number: ${SKU_NUMBER}"
```

### Build Cubietruck

```shell
KERNEL_VERSION=6.17.13

docker run --rm --interactive --tty \
      --platform linux/arm/v7 \
      --env KBUILD_OUTPUT="/kernel-build-cache" \
      --volume kernel-build-cache-gentoo-cubietruck-${KERNEL_VERSION}:/kernel-build-cache \
      --mount type=bind,source="${PWD}",target=/data \
      theanurin/gentoo-sources-bundle:arm32v7-${KERNEL_VERSION}

export KCONFIG_CONFIG=/data/profiles/cubietruck/config-${KERNEL_VERSION}-gentoo-cubietruck

sed --in-place 's~label = "cubietruck:blue:usr";~label = "cubietruck:blue:usr"; default-state = "on";~g' arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
sed --in-place 's~label = "cubietruck:orange:usr";~label = "cubietruck:orange:usr"; default-state = "off"; linux,default-trigger = "heartbeat";~g' arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
sed --in-place 's~label = "cubietruck:white:usr";~label = "cubietruck:white:usr"; default-state = "off"; linux,default-trigger = "heartbeat";~g' arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
sed --in-place 's~label = "cubietruck:green:usr";~label = "cubietruck:green:usr"; default-state = "off"; linux,default-trigger = "heartbeat";~g' arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts

make menuconfig \
  && make -j$(nproc) zImage modules dtbs \
  && rm --recursive --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck" \
  && rm --recursive --force "/data/.build/cubietruck-${KERNEL_VERSION}/lib/modules/${KERNEL_VERSION}-gentoo-cubietruck" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/boot" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/current" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/zImage" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/sun7i-a20-cubietruck.dtb" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/config" \
  && rm --force "/data/.build/cubietruck-${KERNEL_VERSION}/boot/System.map" \
  && mkdir --parents "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck" \
  && make INSTALL_MOD_PATH="/data/.build/cubietruck-${KERNEL_VERSION}" modules_install \
  && cp --dereference arch/arm/boot/zImage                                  "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/zImage-${KERNEL_VERSION}-gentoo-cubietruck" \
  && cp --dereference "${KCONFIG_CONFIG}"                                   "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/config-${KERNEL_VERSION}-gentoo-cubietruck" \
  && cp --dereference System.map                                            "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/System-${KERNEL_VERSION}-gentoo-cubietruck.map" \
  && ln --symbolic "zImage-${KERNEL_VERSION}-gentoo-cubietruck"             "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/zImage" \
  && cp --dereference arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dtb  "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/sun7i-a20-cubietruck.dtb" \
  && ln --symbolic "config-${KERNEL_VERSION}-gentoo-cubietruck"             "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/config" \
  && ln --symbolic "System-${KERNEL_VERSION}-gentoo-cubietruck.map"         "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/System.map" \
  && ln --symbolic         "."                                              "/data/.build/cubietruck-${KERNEL_VERSION}/boot/boot" \
  && ln --symbolic         "${KERNEL_VERSION}-gentoo-cubietruck"            "/data/.build/cubietruck-${KERNEL_VERSION}/boot/current" \
  && ln --symbolic --force "current/zImage"                                 "/data/.build/cubietruck-${KERNEL_VERSION}/boot/zImage" \
  && ln --symbolic --force "current/sun7i-a20-cubietruck.dtb"               "/data/.build/cubietruck-${KERNEL_VERSION}/boot/sun7i-a20-cubietruck.dtb" \
  && ln --symbolic --force "current/config"                                 "/data/.build/cubietruck-${KERNEL_VERSION}/boot/config" \
  && ln --symbolic --force "current/System.map"                             "/data/.build/cubietruck-${KERNEL_VERSION}/boot/System.map"

# If you need uImage
emerge-webrsync && emerge --ask dev-embedded/u-boot-tools \
  && make -j$(nproc) uImage LOADADDR=0x40008000 \
  && cp --dereference arch/arm/boot/uImage                                  "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/uImage-${KERNEL_VERSION}-gentoo-cubietruck" \
  && ln --symbolic "uImage-${KERNEL_VERSION}-gentoo-cubietruck"             "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/uImage" \
  && ln --symbolic --force "current/uImage"                                 "/data/.build/cubietruck-${KERNEL_VERSION}/boot/uImage"

cat arch/arm/boot/zImage arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dtb > zImage-with-dtb
mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008000 -n "Linux-6.17-Gentoo" -d zImage-with-dtb "/data/.build/cubietruck-${KERNEL_VERSION}/boot/${KERNEL_VERSION}-gentoo-cubietruck/uImage-dtb"
```
