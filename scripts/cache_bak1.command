#!/bin/bash

cache_bak1(){
	echo "cache_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p17" | adb shell
	wait
}

cache_bak1