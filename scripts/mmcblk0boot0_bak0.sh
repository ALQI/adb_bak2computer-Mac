#!/bin/bash

mmcblk0boot0_bak0(){
	cd ~/adb_bak2computer/scripts
	adb start-server
	wait
	open ./mmcblk0boot0_bak1.command
	sleep 2
	open ./mmcblk0boot0_bak2.command
	wait
}

mmcblk0boot0_bak0
wait $!
echo "mmcblk0boot0 should be backed up"