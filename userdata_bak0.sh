#!/bin/bash

userdata_bak0(){
	cd ~/adb_bak2computer
	open ./userdata_bak1.command
	sleep 2
	open ./userdata_bak2.command
	wait
}

userdata_bak0
wait
echo "Data should be backed up"