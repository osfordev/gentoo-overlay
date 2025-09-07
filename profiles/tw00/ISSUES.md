# ISSUES

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
