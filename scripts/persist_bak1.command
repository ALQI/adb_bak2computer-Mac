#!/bin/bash

persist_bak1(){
	echo "persist_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p16" | adb shell
	wait
}

persist_bak1