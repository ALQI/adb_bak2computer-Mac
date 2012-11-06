#!/bin/bash

sbl3_bak0(){
	cd ~/adb_bak2computer
	open ./sbl3_bak1.command
	sleep 2
	open ./sbl3_bak2.command
	wait
}

sbl3_bak0
wait $!
echo "SBL3 should be backed up"