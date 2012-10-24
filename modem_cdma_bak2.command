#!/bin/bash

modem_cdma_bak2(){
	echo "modem_cdma_bak2 is running"
	cd ./adb_bak2computer
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p1_modem.img
	wait $!
	echo "modem_cdma_bak2 is done"
}

modem_cdma_bak2
