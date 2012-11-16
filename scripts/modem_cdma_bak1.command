#!/bin/bash

modem_cdma_bak1(){
	echo "modem_cdma_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p1" | adb shell
	wait
}

modem_cdma_bak1