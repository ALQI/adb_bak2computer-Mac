#!/bin/bash

mmcblk0boot0_bak1(){
	echo "mmcblk0boot0_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0boot0" | adb shell
	wait
}

mmcblk0boot0_bak1