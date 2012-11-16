#!/bin/bash

aboot_bak0(){
	cd ~/adb_bak2computer/scripts
	adb start-server
	wait
	open ./aboot_bak1.command
	sleep 2
	open ./aboot_bak2.command
	wait
}

aboot_bak0
wait $!
echo "aboot should be backed up"