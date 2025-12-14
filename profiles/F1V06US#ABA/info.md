# Information

## `lspci -kvnn`

```text
00:00.0 Host bridge [0600]: Intel Corporation 3rd Gen Core processor DRAM Controller [8086:0154] (rev 09)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: ivb_uncore

00:02.0 VGA compatible controller [0300]: Intel Corporation 3rd Gen Core processor Graphics Controller [8086:0166] (rev 09) (prog-if 00 [VGA controller])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 28
	Memory at d4000000 (64-bit, non-prefetchable) [size=4M]
	Memory at c0000000 (64-bit, prefetchable) [size=256M]
	I/O ports at 4000 [size=64]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [d0] Power Management version 2
	Capabilities: [a4] PCI Advanced Features
	Kernel driver in use: i915

00:14.0 USB controller [0c03]: Intel Corporation 7 Series/C210 Series Chipset Family USB xHCI Host Controller [8086:1e31] (rev 04) (prog-if 30 [XHCI])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, medium devsel, latency 0, IRQ 32
	Memory at d4720000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: [70] Power Management version 2
	Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
	Kernel driver in use: xhci_hcd

00:16.0 Communication controller [0780]: Intel Corporation 7 Series/C216 Chipset Family MEI Controller #1 [8086:1e3a] (rev 04)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 29
	Memory at d4734000 (64-bit, non-prefetchable) [size=16]
	Capabilities: [50] Power Management version 3
	Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Kernel driver in use: mei_me

00:19.0 Ethernet controller [0200]: Intel Corporation 82579V Gigabit Network Connection [8086:1503] (rev 04)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 31
	Memory at d4700000 (32-bit, non-prefetchable) [size=128K]
	Memory at d473a000 (32-bit, non-prefetchable) [size=4K]
	I/O ports at 4060 [disabled] [size=32]
	Capabilities: [c8] Power Management version 2
	Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [e0] PCI Advanced Features
	Kernel driver in use: e1000e

00:1a.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #2 [8086:1e2d] (rev 04) (prog-if 20 [EHCI])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, medium devsel, latency 0, IRQ 16
	Memory at d4739000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci

00:1b.0 Audio device [0403]: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller [8086:1e20] (rev 04)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 33
	Memory at d4730000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [70] Express Root Complex Integrated Endpoint, IntMsgNum 0
	Capabilities: [100] Virtual Channel
	Capabilities: [130] Root Complex Link
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1c.0 PCI bridge [0604]: Intel Corporation 7 Series/C216 Chipset Family PCI Express Root Port 1 [8086:1e10] (rev c4) (prog-if 00 [Normal decode])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 24
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: d4600000-d46fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), IntMsgNum 0
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Hewlett-Packard Company Device [103c:179c]
	Capabilities: [a0] Power Management version 2
	Kernel driver in use: pcieport

00:1c.1 PCI bridge [0604]: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 2 [8086:1e12] (rev c4) (prog-if 00 [Normal decode])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 25
	Bus: primary=00, secondary=02, subordinate=22, sec-latency=0
	I/O behind bridge: 2000-3fff [size=8K] [16-bit]
	Memory behind bridge: d0000000-d3ffffff [size=64M] [32-bit]
	Prefetchable memory behind bridge: bf200000-bf3fffff [size=2M] [32-bit]
	Capabilities: [40] Express Root Port (Slot+), IntMsgNum 0
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Hewlett-Packard Company Device [103c:179c]
	Capabilities: [a0] Power Management version 2
	Kernel driver in use: pcieport

00:1c.2 PCI bridge [0604]: Intel Corporation 7 Series/C210 Series Chipset Family PCI Express Root Port 3 [8086:1e14] (rev c4) (prog-if 00 [Normal decode])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 26
	Bus: primary=00, secondary=23, subordinate=23, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: d4500000-d45fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), IntMsgNum 0
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Hewlett-Packard Company Device [103c:179c]
	Capabilities: [a0] Power Management version 2
	Kernel driver in use: pcieport

00:1c.3 PCI bridge [0604]: Intel Corporation 7 Series/C216 Chipset Family PCI Express Root Port 4 [8086:1e16] (rev c4) (prog-if 00 [Normal decode])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 27
	Bus: primary=00, secondary=24, subordinate=24, sec-latency=0
	I/O behind bridge: [disabled] [16-bit]
	Memory behind bridge: d4400000-d44fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: [disabled] [64-bit]
	Capabilities: [40] Express Root Port (Slot+), IntMsgNum 0
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [90] Subsystem: Hewlett-Packard Company Device [103c:179c]
	Capabilities: [a0] Power Management version 2
	Kernel driver in use: pcieport

00:1d.0 USB controller [0c03]: Intel Corporation 7 Series/C216 Chipset Family USB Enhanced Host Controller #1 [8086:1e26] (rev 04) (prog-if 20 [EHCI])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, medium devsel, latency 0, IRQ 16
	Memory at d4738000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Capabilities: [98] PCI Advanced Features
	Kernel driver in use: ehci-pci

00:1f.0 ISA bridge [0601]: Intel Corporation HM76 Express Chipset LPC Controller [8086:1e59] (rev 04)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, medium devsel, latency 0
	Capabilities: [e0] Vendor Specific Information: Len=0c <?>
	Kernel driver in use: lpc_ich

00:1f.2 SATA controller [0106]: Intel Corporation 7 Series Chipset Family 6-port SATA Controller [AHCI mode] [8086:1e03] (rev 04) (prog-if 01 [AHCI 1.0])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 30
	I/O ports at 4088 [size=8]
	I/O ports at 4094 [size=4]
	I/O ports at 4080 [size=8]
	I/O ports at 4090 [size=4]
	I/O ports at 4040 [size=32]
	Memory at d4737000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
	Capabilities: [70] Power Management version 3
	Capabilities: [a8] SATA HBA v1.0
	Capabilities: [b0] PCI Advanced Features
	Kernel driver in use: ahci

23:00.0 FireWire (IEEE 1394) [0c00]: JMicron Technology Corp. IEEE 1394 Host Controller [197b:2380] (rev 30) (prog-if 10 [OHCI])
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 255
	Memory at d4500000 (32-bit, non-prefetchable) [size=2K]
	Memory at d4505000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [44] Power Management version 3
	Capabilities: [80] Express Endpoint, IntMsgNum 0
	Capabilities: [94] MSI: Enable- Count=1/1 Maskable- 64bit-

23:00.1 System peripheral [0880]: JMicron Technology Corp. SD/MMC Host Controller [197b:2392] (rev 30)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: bus master, fast devsel, latency 0, IRQ 18
	Memory at d4504000 (32-bit, non-prefetchable) [size=256]
	Expansion ROM at d4508000 [disabled] [size=32K]
	Capabilities: [a4] Power Management version 3
	Capabilities: [80] Express Endpoint, IntMsgNum 0
	Capabilities: [94] MSI: Enable- Count=1/1 Maskable- 64bit-
	Kernel driver in use: sdhci-pci

23:00.2 SD Host controller [0805]: JMicron Technology Corp. Standard SD Host Controller [197b:2391] (rev 30) (prog-if 01)
	Subsystem: Hewlett-Packard Company Device [103c:179c]
	Flags: fast devsel, IRQ 18
	Memory at d4503000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [a4] Power Management version 3
	Capabilities: [80] Express Endpoint, IntMsgNum 0
	Capabilities: [94] MSI: Enable- Count=1/1 Maskable- 64bit-

24:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM43228 802.11a/b/g/n [14e4:4359]
	Subsystem: Hewlett-Packard Company BCM943228HM4L 802.11a/b/g/n 2x2 Wi-Fi Adapter [103c:182c]
	Flags: fast devsel, IRQ 255
	Memory at d4400000 (64-bit, non-prefetchable) [disabled] [size=16K]
	Capabilities: [40] Power Management version 3
	Capabilities: [58] Vendor Specific Information: Len=78 <?>
	Capabilities: [48] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [d0] Express Endpoint, IntMsgNum 0
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [13c] Virtual Channel
	Capabilities: [160] Device Serial Number 00-00-8b-ff-ff-af-70-18
	Capabilities: [16c] Power Budgeting <?>
```

## `lsusb -tv`

```text
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/6p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/6p, 480M
        ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
        |__ Port 005: Dev 003, If 0, Class=Chip/SmartCard, Driver=[none], 12M
            ID 04e6:5119 SCM Microsystems, Inc. SCR3340 - ExpressCard54 Smart Card Reader
        |__ Port 006: Dev 004, If 0, Class=Vendor Specific Class, Driver=btusb, 12M
            ID 0a5c:21e1 Broadcom Corp. HP Portable SoftSailing
        |__ Port 006: Dev 004, If 1, Class=Vendor Specific Class, Driver=btusb, 12M
            ID 0a5c:21e1 Broadcom Corp. HP Portable SoftSailing
        |__ Port 006: Dev 004, If 2, Class=Vendor Specific Class, Driver=[none], 12M
            ID 0a5c:21e1 Broadcom Corp. HP Portable SoftSailing
        |__ Port 006: Dev 004, If 3, Class=Application Specific Interface, Driver=[none], 12M
            ID 0a5c:21e1 Broadcom Corp. HP Portable SoftSailing
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
```

## `cat /proc/cpuinfo`

```text
processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 58
model name	: Intel(R) Core(TM) i5-3340M CPU @ 2.70GHz
stepping	: 9
microcode	: 0x21
cpu MHz		: 1299.353
cache size	: 3072 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 2
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt dtherm ida arat pln pts md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only flexpriority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_unknown
bogomips	: 5388.09
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:
```
