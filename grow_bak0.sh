#!/bin/bash

grow_bak0(){
	cd ~/adb_bak2computer
	open ./grow_bak1.command
	sleep 2
	open ./grow_bak2.command
	wait
}

grow_bak0
wait $!
echo "grow should be backed up"