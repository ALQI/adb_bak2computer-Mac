#!/bin/bash

cache_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./cache_bak1.command
	sleep 2
	open ./cache_bak2.command
	wait
}

cache_bak0
wait $!
echo "Cache should be backed up"
