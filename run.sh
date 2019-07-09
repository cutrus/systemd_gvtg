#!/usr/bin/env bash

GVT_PCI="$(lspci -D | grep Intel.*Graphics | cut -f1 -d' ')"
GVT_DOM="$(echo ${GVT_PCI} | cut -f1,2 -d':')"
GVT_TYPE="$(ls /sys/devices/pci${GVT_DOM}/${GVT_PCI}/mdev_supported_types | grep V5_4)"
GVT_GUID="$(uuidgen)"

echo GVT_PCI=\"$GVT_PCI\"
echo GVT_DOM=\"$GVT_DOM\"
echo GVT_TYPE=\"$GVT_TYPE\"
echo GVT_GUID=\"$GVT_GUID\"
