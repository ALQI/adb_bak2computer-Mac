#!/bin/bash

mmcblk0boot0_bak2(){
	echo "mmcblk0boot0_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0boot0_mmcblk0boot0.img
	wait $!
	echo "mmcblk0boot0_bak2 is done"
}

mmcblk0boot0_bak2
wait
adb kill-server