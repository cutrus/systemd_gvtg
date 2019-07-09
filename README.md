# systemd_gvtg

## virt-manager
```bash
sudo apt install virt-manager
```

## Grub
Add to /etc/default/grub
```
i915.enable_gvt=1 kvm.ignore_msrs=1
```

Run
```bash
update-grub
reboot
```

## Check
```bash
GVT_PCI="$(lspci -D | grep Intel.*Graphics | cut -f1 -d' ')"
GVT_DOM="$(echo ${GVT_PCI} | cut -f1,2 -d':')"
ls /sys/devices/pci${GVT_DOM}/${GVT_PCI}/mdev_supported_types | grep V5_4
```

## Initramsfs

Add to /etc/initramfs-tools/modules
```bash
kvmgt
xengt
vfio-iommu-type1
vfio-mdev
```

Run
```bash
update-initramfs -u
```

## QEMU
```bash
sudo gpasswd -a $USER kvm
```
## Links
* ![https://wiki.archlinux.org/index.php/Intel_GVT-g#Configuration](https://wiki.archlinux.org/index.php/Intel_GVT-g#Configuration)
* ![https://www.reddit.com/r/VFIO/comments/8h352p/guide_running_windows_via_qemukvm_and_intel_gvtg/](https://www.reddit.com/r/VFIO/comments/8h352p/guide_running_windows_via_qemukvm_and_intel_gvtg/)
