#!/bin/bash

ssd_bak0(){
	cd ~/adb_bak2computer/scripts
	adb start-server
	wait
	open ./ssd_bak1.command
	sleep 2
	open ./ssd_bak2.command
	wait
}

ssd_bak0
wait $!
echo "ssd should be backed up"