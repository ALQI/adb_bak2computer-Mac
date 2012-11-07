#!/bin/bash

data_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./data_bak1.command
	sleep 2
	open ./data_bak2.command
	sleep 2
	open ./data_bak3.command
	wait
}

data_bak0
wait
echo "Data should be backed up"

# cd ~/adb_bak2computer
# open ./data_bak4.command
# sleep 2
