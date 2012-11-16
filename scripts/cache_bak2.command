#!/bin/bash

cache_bak2(){
	echo "cache_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p17_cache.img
	wait $!
	echo "cache_bak2 is done"
}

cache_bak2
wait
adb kill-server
