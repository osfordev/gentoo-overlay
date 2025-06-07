# Notes

## CONFIG_KVM as module

Помилка запуску VirtualBox:
- `VT-x is not available (VERR_VMX_NO_VMX)`
- `VirtualBox can't operate in VMX root mode. Please disable the KVM kernel extension, recompile your kernel and reboot (VERR_VMX_IN_VMX_ROOT_MODE).`

Конфлікт між VirtualBox і CONFIG_KVM виникає через спробу обох систем отримати ексклюзивний доступ до апаратної віртуалізації процесора — Intel VT-x або AMD-V.

- CONFIG_KVM — це параметр ядра Linux, що вмикає підтримку KVM (Kernel-based Virtual Machine).
KVM використовує апаратні можливості процесора для створення віртуальних машин.
- VirtualBox — гіпервізор, який також використовує ці самі апаратні функції для пришвидшення роботи віртуальних машин.

❗️ Лише одна система може одночасно отримати доступ до VT-x / AMD-V.
