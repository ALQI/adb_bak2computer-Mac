#!/bin/bash

param_bak2(){
	echo "param_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p10_param.img
	wait $!
	echo "param_bak2 is done"
}

param_bak2
wait
adb kill-server