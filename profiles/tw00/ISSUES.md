# ISSUES

## 2026-01-17

- Не працює звук в flatpak/Sober
  - переінстальовано `USE="acl flatpak pipewire-alsa sound-server" emerge --ask --newuse --update --deep media-video/pipewire media-video/wireplumber sys-apps/systemd`
- Автоматично не обираеться Sink. `wpctl status` показує
  ```text
    Audio
    ├─ Devices:
    │      43. GP106 High Definition Audio Controller [alsa]
    │      44. Built-in Audio                      [alsa]
    ├─ Sinks:
    │  *   42. Dummy Output
  ```
- `pactl list cards` + `pactl set-card-profile alsa_card.pci-0000_03_00.1  output:hdmi-stereo` + `wpctl set-default 59` встановлює Sinks
  ```text
    Audio
    ├─ Devices:
    │      43. GP106 High Definition Audio Controller [alsa]
    │      44. Built-in Audio                      [alsa]
    ├─ Sinks:
    │      59. GP106 High Definition Audio Controller Digital Stereo (HDMI) [vol: 1.00]
  ```
- CVLC не грає через Pulse
  - грає через ALSA `cvlc --aout=alsa --alsa-audio-device=hw:1,3 https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3`
  - Не грає через Pulse `cvlc -vvv --aout=pulse https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3`
    Під час запуску CVLC статус `pactl list short sinks` залишється в SUSPENDED

## 2025-10-05 "Заморожений" екран з битими ділянками

```text
[315905.140245] NVRM: GPU at PCI:0000:03:00: GPU-409297e7-8fea-6fdd-c14e-73154d286f4a
[315905.140252] NVRM: Xid (PCI:0000:03:00): 62, 00000a9f 00000a85 00000a72 00003786 00001d3e 000027d6 01013289 00000000
[315911.559820] NVRM: Xid (PCI:0000:03:00): 31, pid=12083, name=chrome, Ch 00000010, intr 10000000. MMU Fault: ENGINE CE0 HUBCLIENT_CE0 faulted @ 0x0_04a00000. Fault is of type FAULT_INFO_TYPE_UNSUPPORTED_KIND ACCESS_TYPE_WRITE
[315913.128634] sched: RT throttling activated
```

## 2025-08-25 Black screen (останній раз користувалася вчора)

```text
Aug 24 20:57:56 tw00 root[142039]: ACPI event unhandled: jack/lineout LINEOUT unplug
Aug 24 20:57:56 tw00 root[142041]: ACPI event unhandled: jack/videoout VIDEOOUT unplug
```

```text
// dmesg
[342042.000493] pcieport 0000:00:03.0: AER: Multiple Correctable error message received from 0000:00:03.0
[342042.000505] pcieport 0000:00:03.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
[342042.000507] pcieport 0000:00:03.0:   device [8086:2f08] error status/mask=00000040/00002000
[342042.000509] pcieport 0000:00:03.0:    [ 6] BadTLP                
```

## 2025-08-13 Black screen

Залишила комп'ютер, коли повернулася екран був вимкнений. На екрані немає сигналу.

```text
// cat /var/log/messages
Aug 13 19:02:44 tw00 root[149831]: ACPI event unhandled: jack/lineout LINEOUT unplug
Aug 13 19:02:44 tw00 root[149833]: ACPI event unhandled: jack/videoout VIDEOOUT unplug
```
