#!/bin/bash

recovery_bak1(){
	echo "recovery_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p18" | adb shell
	wait
}

recovery_bak1
