#!/bin/bash

userdata_bak1(){
	echo "userdata_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p15" | adb shell
	wait
}

userdata_bak1
wait