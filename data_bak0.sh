#!/bin/bash

data_bak0(){
	cd ./adb_bak2computer
	open ./data_bak1.command
	sleep 2
	open ./data_bak2.command
	wait
}

data_bak0
wait $!
echo "Data should be backed up"