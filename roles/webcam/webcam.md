# configs webcam

## dmesg

```bash
208.986046] usb 1-1.2: new high-speed USB device number 4 using xhci_hcd
[  209.118825] usb 1-1.2: New USB device found, idVendor=2aad, idProduct=6353, bcdDevice= 1.00
[  209.118845] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  209.118862] usb 1-1.2: Product: iCatchtek SPCA6350
[  209.118878] usb 1-1.2: Manufacturer: iCatchtek Co Ltd 
[  209.118893] usb 1-1.2: SerialNumber: 01.00.00
[  209.193499] uvcvideo: Found UVC 1.00 device iCatchtek SPCA6350 (2aad:6353)
[  209.211903] input: iCatchtek SPCA6350 as /devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input0
[  209.212342] usbcore: registered new interface driver uvcvideo
[  209.212356] USB Video Class driver (1.1.1)
[  209.223289] usb 1-1.2: 4:6 : no or invalid class specific endpoint descriptor
[  209.224475] usbcore: registered new interface driver snd-usb-audio

```

## modules

is empty

```bash
pi@raspberrypi:~ $ cat /etc/modules
# /etc/modules: kernel modules to load at boot time.
#
# This file contains the names of kernel modules that should be loaded
# at boot time, one per line. Lines beginning with "#" are ignored.
```