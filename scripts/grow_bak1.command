#!/bin/bash

grow_bak1(){
	echo "grow_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p23" | adb shell
	wait
}

grow_bak1