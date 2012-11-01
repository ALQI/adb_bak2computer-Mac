#!/bin/bash

data_bak4(){
	echo "data_bak4 is running"
	echo "cleanup!"
	echo "cd /mnt/sdcard; rm myfifo" | adb shell
	sleep 2
	wait
}

data_bak4