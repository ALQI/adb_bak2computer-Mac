#!/bin/bash

tz_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./tz_bak1.command
	sleep 2
	open ./tz_bak2.command
	wait
}

tz_bak0
wait $!
echo "tz should be backed up"