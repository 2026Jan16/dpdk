
1. NIC binding
dpdk-devbind.py --bind=vfio-pci <NIC>

2. Device exposure to user space
PCI BAR mapping. BAR: Base address registers

3. DMA: Deal with physical addresses.
Memory controller executes read / write requests and gives the data / result back
to the requestor.
Hardwares have their own DMA engines. NICs, NVMe, GPUs, they all have their own DMA engines.
However there are devices that are not DMA capable like USB devices. In that case the USB
controller has the DMA engine not individual device.

4. Devices are generally seen as just memory addresses a driver can read and write from and to.



#### DPDK specific
1. Whatever interfaces are bound to DPDK drivers. DPDK enumerates them and presents
them to user space application as port ids - 0, 1, 2, 3

2. IOMMU
. CPU support - for this we need to check BIOS settings
. Kernel enabled it - for this we need to check kernel's boot parameters.

    Eg: cat /proc/cmdline 
        BOOT_IMAGE=/boot/vmlinuz-6.8.0-101-generic root=UUID=f7166b66-df09-49ee-bb48-e97e37bf3c74 ro intel_iommu=on iommu=pt default_hugepagesz=1G hugepagesz=1G hugepages=32 vfio_pci.enable_sriov=1 info=ALL isolcpus=4-27,69-79,30-55,93-128
    If not enabled it needs to be added to the grub.cfg file.

    ls /sys/kernel/iommu_groups/
    . IOMMU groups is a smallest set of devices that can be separated from each other.

. Is actively usable

3. VFIO-PCI driver
. modprobe vfio-pcio
. Bind device to vfio-pci driver

4. Hugepages - Provide DMA efficient memory 
. Physically contiguous memory chunks.
. Large pages, so fewer page table entries, and fewer TLB entries. Faster translations.
. Address page faults overhead.



#### Build
sudo apt install python3-pyelftools
meson -Dexamples=all build
meson setup --reconfigure
