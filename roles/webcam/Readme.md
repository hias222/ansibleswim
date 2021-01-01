# install webcam

<https://ourcodeworld.com/articles/read/1212/top-5-best-open-source-webrtc-media-server-projects>
<https://github.com/versatica/mediasoup-demo>
<https://webrtc.github.io/samples/>
<https://www.linux-projects.org/uv4l/installation/>
<https://github.com/jacksonliam/mjpg-streamer>
<https://gstreamer.freedesktop.org>
<https://www.epiphan.com/blog/best-cameras-for-live-streaming>

## possible protocolls

* stream with mjpeg
* WebRTC
* RTSP

## RTSP: use v4l2rtspserver

* this tool generates rtsp stream out of usb or csi webcam. The latenz is around 0.5s - 1s
* see details in tasks main.yml [role](tasks/main.yml)

## WebRTC and stream: uv4l

### uv4l prerequisites

It only works with rapian 32 version

* Kernel version: 5.4
* 32 bit
* put empty file with name ssh in root boot partition for ssh access

Other systems tested - not working, the issues are always different

* ubuntu 20 23bit - wrong libssl lib (2020/12)
* ubuntu 20 64bit - no uv4l version avaialable (2020/12)
* ubuntu 18 32bit (Bionic Beaver) - errors on running uv4l - maybe its possible o fix it
  
### installation

<https://github.com/hias222/ansibleswim/blob/master/roles/webcam/tasks/webrtc.yml>

### finde cam with dmesg

```bash
dmesg

[  432.687499] usb 1-1.3: USB disconnect, device number 4
[  453.063004] usb 1-1.3: new high-speed USB device number 6 using xhci_hcd
[  453.168877] usb 1-1.3: New USB device found, idVendor=2aad, idProduct=6353, bcdDevice= 1.00
[  453.168886] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  453.168893] usb 1-1.3: Product: iCatchtek SPCA6350
[  453.168900] usb 1-1.3: Manufacturer: iCatchtek Co Ltd 
[  453.168906] usb 1-1.3: SerialNumber: 01.00.00
[  453.170363] uvcvideo: Found UVC 1.00 device iCatchtek SPCA6350 (2aad:6353)
[  453.180146] uvcvideo 1-1.3:1.0: Entity type for entity Extension 3 was not initialized!
[  453.180157] uvcvideo 1-1.3:1.0: Entity type for entity Processing 2 was not initialized!
[  453.180165] uvcvideo 1-1.3:1.0: Entity type for entity Camera 1 was not initialized!
[  453.180355] input: iCatchtek SPCA6350 as /devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.3/1-1.3:1.0/input/input1
[  453.181238] usb 1-1.3: 4:6 : no or invalid class specific endpoint descriptor
```
