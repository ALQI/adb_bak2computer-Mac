#!/bin/bash

pad_bak0(){
	cd ~/adb_bak2computer
	open ./pad_bak1.command
	sleep 2
	open ./pad_bak2.command
	wait
}

pad_bak0
wait $!
echo "PAD aka PIT should be backed up"