#!/bin/bash

system_bak0(){
	cd ~/adb_bak2computer
	open ./system_bak1.command
	sleep 2
	open ./system_bak2.command
	wait
}

system_bak0
wait $!
echo "System should be backed up"