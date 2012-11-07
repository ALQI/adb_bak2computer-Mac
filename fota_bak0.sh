#!/bin/bash

fota_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./fota_bak1.command
	sleep 2
	open ./fota_bak2.command
	wait
}

fota_bak0
wait $!
echo "fota should be backed up"