#!/bin/bash

internalSD_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./internalSD_bak1.command
	sleep 2
	open ./internalSD_bak2.command
	wait
}

internalSD_bak0
wait $!
echo "internalSD should be backed up"