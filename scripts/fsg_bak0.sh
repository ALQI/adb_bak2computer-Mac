#!/bin/bash

fsg_bak0(){
	cd ~/adb_bak2computer/scripts
	adb start-server
	wait
	open ./fsg_bak1.command
	sleep 2
	open ./fsg_bak2.command
	wait
}

fsg_bak0
wait $!
echo "fsg should be backed up"