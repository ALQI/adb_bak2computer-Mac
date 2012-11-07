#!/bin/bash

aboot_bak2(){
	echo "aboot_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p5_template.img
	wait $!
	echo "aboot_bak2 is done"
}

aboot_bak2
wait
adb kill-server