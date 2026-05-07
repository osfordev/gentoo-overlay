# ToDos

1. 2026-04-16

   - remove CONFIG_MXM_WMI
   - remove CONFIG_INPUT_MOUSEDEV
   - remove CONFIG_IPMI_HANDLER
   - remove CONFIG_MWAVE
   - remove CONFIG_TCG_TPM ls /sys/firmware/acpi/tables | grep -E "TPM2|TCPA"
   - remove CONFIG_SND_HDA_CODEC_REALTEK
    - remove CONFIG_CPU_SUP_AMD=y
    - remove CONFIG_CPU_SUP_HYGON=y
    - remove CONFIG_CPU_SUP_CENTAUR=y
    - remove CONFIG_CPU_SUP_ZHAOXIN=y
    - remove CONFIG_AMD_NB=y
    - remove CONFIG_AMD_NODE=y
    - set Y: CONFIG_EXPERT=y
    - set Y: CONFIG_NETFILTER_XT_TARGET_NETMAP=y
    - set Y: CONFIG_NF_SOCKET_IPV4=m
    - set Y: CONFIG_NF_TPROXY_IPV4=m
    - set Y: CONFIG_NF_DUP_IPV4=m
    - set Y: CONFIG_NF_LOG_ARP=m
    - set Y: CONFIG_NF_LOG_IPV4=m
    - set Y: CONFIG_IP_NF_TARGET_SYNPROXY=m
    - set Y: CONFIG_BT=m
    - set Y: CONFIG_BT_INTEL=m
    - set Y: CONFIG_BT_BCM=m
    - set Y: CONFIG_BT_HCIBTUSB=m
    - set Y: CONFIG_CFG80211=m
    - set Y: CONFIG_MAC80211=m
    - set Y: CONFIG_RFKILL=m
    - set # CONFIG_SYSFB_SIMPLEFB is not set
    - remove CONFIG_NVME_CORE=y
    - remove CONFIG_BLK_DEV_NVME=y
    - remove CONFIG_NET_VENDOR_HISILICON=y
    - remove CONFIG_NET_FAILOVER=m
    - remove CONFIG_INTEL_POWERCLAMP=y
    - remove CONFIG_VIDEO_CAMERA_SENSOR=y
    - remove CONFIG_VIDEO_CAMERA_LENS=y
    - remove CONFIG_AGP=y
    - investigate for remove CONFIG_SENSORS_ATK0110=y
    - set Y: CONFIG_FIRMWARE_EDID=y
    - set Y: CONFIG_SND_CTL_LED=m
    - set Y: CONFIG_SND_HDA=m
    - set Y: CONFIG_SND_HDA_INTEL=m
    - remove CONFIG_SND_HDA_CODEC_SIGMATEL=m
    - set Y: CONFIG_SND_HDA_GENERIC=y
    - set Y: CONFIG_SND_HDA_CODEC_HDMI=y
    - set Y: CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
    - set Y: CONFIG_SND_HDA_CODEC_HDMI_SIMPLE=m
    - set Y: CONFIG_SND_HDA_CODEC_HDMI_INTEL=m
    - remove CONFIG_SND_HDA_CODEC_HDMI_ATI=m
    - remove CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
    - remove CONFIG_SND_HDA_CODEC_HDMI_NVIDIA_MCP=m
    - remove CONFIG_SND_HDA_CODEC_HDMI_TEGRA=m
    - set Y: CONFIG_SND_HDA_CORE=m
    - set Y: CONFIG_INTEL_HID_EVENT=y
    - set Y: CONFIG_INTEL_VBTN=y
    - remove CONFIG_FW_ATTR_CLASS=m
    - remove CONFIG_UBSAN=y
    - remove CONFIG_DEBUG_MEMORY_INIT=y
    - remove CONFIG_X86_AMD_PSTATE=y
    - set Y: CONFIG_PPP*=y
    - set Y: CONFIG_MACVLAN=y
    - set Y: CONFIG_IPVLAN_L3S=y
    - set Y: CONFIG_IPVLAN=y
    - set Y: CONFIG_VXLAN=y
    - set Y: CONFIG_TUN=y
    - set Y: CONFIG_VETH=y

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
