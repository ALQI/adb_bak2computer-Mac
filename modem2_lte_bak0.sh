#!/bin/bash

modem2_lte_bak0(){
	cd ./adb_bak2computer
	open ./modem2_lte_bak1.command
	sleep 2
	open ./modem2_lte_bak2.command
	wait
}

modem2_lte_bak0
wait $!
echo "LTE Modem 2 should be backed up"