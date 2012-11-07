#!/bin/bash

sbl2_bak0(){
	cd ~/adb_bak2computer
	adb start-server
	wait
	open ./sbl2_bak1.command
	sleep 2
	open ./sbl2_bak2.command
	wait
}

sbl2_bak0
wait $!
echo "SBL2 should be backed up"