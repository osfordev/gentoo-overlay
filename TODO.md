# ToDos

Unset CONFIG_AGP
Unset CONFIG_MXM_WMI
Unset CONFIG_INPUT_MOUSEDEV
Unset CONFIG_IPMI_HANDLER
Unset CONFIG_MWAVE
Unset CONFIG_TCG_TPM ls /sys/firmware/acpi/tables | grep -E "TPM2|TCPA"
Unset CONFIG_SND_HDA_CODEC_HDMI_ATI
Unset CONFIG_SND_HDA_CODEC_HDMI_NVIDIA
Unset CONFIG_SND_HDA_CODEC_HDMI_NVIDIA_MCP
Unset CONFIG_SND_HDA_CODEC_HDMI_TEGRA
Unset CONFIG_SND_HDA_CODEC_REALTEK

1. 2026-04-09

   ```text
   IMPORTANT: config file '/etc/issue' needs updating.
   ```

1. 2023-02-23

   Turn on features CONFIG_PCIEASPM_POWERSAVE, CONFIG_PCIEASPM_POWER_SUPERSAVE and CONFIG_PCIEASPM_PERFORMANCE on C3C58ES#AKD.

   ```text
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
