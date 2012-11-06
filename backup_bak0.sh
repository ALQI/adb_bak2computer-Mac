#!/bin/bash

backup_bak0(){
	cd ~/adb_bak2computer
	open ./backup_bak1.command
	sleep 2
	open ./backup_bak2.command
	wait
}

backup_bak0
wait $!
echo "backup should be backed up"