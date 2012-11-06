#!/bin/bash

sbl1_bak0(){
	cd ~/adb_bak2computer
	open ./sbl1_bak1.command
	sleep 2
	open ./sbl1_bak2.command
	wait
}

sbl1_bak0
wait $!
echo "SBL1 should be backed up"