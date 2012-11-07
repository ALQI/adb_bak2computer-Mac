#!/bin/bash

persist_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./persist_bak1.command
	sleep 2
	open ./persist_bak2.command
	wait
}

persist_bak0
wait $!
echo "persist should be backed up"