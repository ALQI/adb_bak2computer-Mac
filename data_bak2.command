#!/bin/bash

data_bak2(){
	echo "data_bak2 is running"
	cd ./adb_bak2computer
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p15_data.img
	wait $!
	echo "data_bak2 is done"
}

data_bak2
