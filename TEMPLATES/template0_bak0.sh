#!/bin/bash

template0_bak0(){
	cd ~/adb_bak2computer
	open ./template1_bak1.command
	sleep 2
	open ./template2_bak2.command
	wait
}

template0_bak0
wait $!
echo "Template should be backed up"