#!/bin/bash

internalSD_bak1(){
	echo "internalSD_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/mnt/sdcard" | adb shell
	wait
}

internalSD_bak1