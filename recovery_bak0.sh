#!/bin/bash

recovery_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./recovery_bak1.command
	sleep 2
	open ./recovery_bak2.command
	wait
}

recovery_bak0
wait $!
echo "Recovery should be backed up"