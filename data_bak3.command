#!/bin/bash

data_bak3(){
	echo "data_bak3 is running"
	cd ./adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./data.tar
	wait
	echo "data_bak3 is done"
}

data_bak3
wait
adb kill-server