#!/bin/bash

data_bak2(){
	echo "data_bak2 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "cd /mnt/sdcard; /system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox cat /mnt/sdcard/myfifo" | adb shell
	wait
}

data_bak2
