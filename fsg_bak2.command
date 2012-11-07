#!/bin/bash

fsg_bak2(){
	echo "fsg_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p21_fsg.img
	wait $!
	echo "fsg_bak2 is done"
}

fsg_bak2
wait
adb kill-server