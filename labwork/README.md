
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
5. 
