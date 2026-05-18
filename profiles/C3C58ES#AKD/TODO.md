failed to start daemon: Error initializing network controller: error obtaining controller instance: failed to register "bridge" driver: failed to create NAT chain DOCKER: iptables failed: iptables --wait -t nat -N DOCKER: modprobe: FATAL: Module ip_tables not found in directory /lib/modules/6.18.18-gentoo-C3C58ES#AKD
iptables v1.8.11 (legacy): can't initialize iptables table `nat': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
(exit status 3)

 * Starting laptop_mode ...
/usr/share/laptop-mode-tools/modules/intel-sata-powermgmt: line 46: echo: write error: Operation not supported
/usr/share/laptop-mode-tools/modules/intel-sata-powermgmt: line 46: echo: write error: Operation not supported
/usr/share/laptop-mode-tools/modules/intel-sata-powermgmt: line 46: echo: write error: Operation not supported
/usr/share/laptop-mode-tools/modules/intel-sata-powermgmt: line 46: echo: write error: Operation not supported
 [ ok ]
 
 /sys/class/scsi_host/*/link_power_managemnt_policy