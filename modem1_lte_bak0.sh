#!/bin/bash

modem1_lte_bak0(){
	cd ~/adb_bak2computer
	open ./modem1_lte_bak1.command
	sleep 2
	open ./modem1_lte_bak2.command
	wait	
}

modem1_lte_bak0
wait $!
echo "LTE Modem 1 should be backed up"