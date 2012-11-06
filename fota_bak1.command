#!/bin/bash

fota_bak1(){
	echo "fota_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p19" | adb shell
	wait
}

fota_bak1