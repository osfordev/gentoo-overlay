# Gentoo Overlay

This is a Gentoo Overlay used by [**OS For Developer**](https://github.com/osfordev) project.

## Developer Notes

### Update kernel configuration

Basically we hold on fixed versions of gentoo-sources (via mask.packages).
As result we have to update kernel configurations for each profile to be up to date.

Use following snippet to apply `make oldconfig` for each kernel configuration

- Prepare
    ```shell
    emerge-webrsync
    emerge --ask --verbose gentoo-sources
    eselect kernel XXX
    ```
- Arch: amd64
    ```shell
    cd profiles
    PROFILES_DIR=$(pwd)
    for PROFILE_AMD64 in 27K51EA#A2Q B2G18EC#ABA C3C58ES#AKD D4H65EC#AKD H5E56ET#ABU zxtower00 zxtower02 zxtower04; do
        export KCONFIG_CONFIG="$PROFILES_DIR/$PROFILE_AMD64/kernel.config" 
        echo "Updating $PROFILE_AMD64 ..."
        (cd /usr/src/linux && sudo --preserve-env=KCONFIG_CONFIG make oldconfig && rm "${KCONFIG_CONFIG}.old")
    done
    ```
- Arch: x86
