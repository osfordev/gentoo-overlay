- 2023-02-23 Turn on features CONFIG_PCIEASPM_POWERSAVE, CONFIG_PCIEASPM_POWER_SUPERSAVE and CONFIG_PCIEASPM_PERFORMANCE on C3C58ES#AKD.
    ```
    [    2.257322] iwlwifi 0000:24:00.0: can't disable ASPM; OS doesn't have ASPM control
    [    2.259453] iwlwifi 0000:24:00.0: loaded firmware version 18.168.6.1 6000g2a-6.ucode op_mode iwldvm
    [    2.263054] iwlwifi 0000:24:00.0: Detected Intel(R) Centrino(R) Advanced-N 6205 AGN, REV=0xB0
    ```
    ```shell
    $ zgrep ASPM /proc/config.gz
    CONFIG_PCIEASPM=y
    CONFIG_PCIEASPM_DEFAULT=y
    # CONFIG_PCIEASPM_POWERSAVE is not set
    # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
    # CONFIG_PCIEASPM_PERFORMANCE is not set
    ```
    See https://forums.gentoo.org/viewtopic-t-1061944-start-0.html