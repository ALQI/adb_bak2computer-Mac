#!/bin/bash

data_bak1(){
	echo "data_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "cd /mnt/sdcard; /system/xbin/busybox mkfifo myfifo; /system/xbin/busybox tar --exclude='data/media' -cf myfifo /data" | adb shell
	## echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p15" | adb shell ## backs up sdcard too ##
	wait
}

data_bak1