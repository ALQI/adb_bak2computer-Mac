#!/bin/bash

T_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./T_bak1.command
	sleep 2
	open ./T_bak2.command
	wait
}

T_bak0
wait $!
echo "T should be backed up"