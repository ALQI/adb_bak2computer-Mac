#!/bin/bash

rpm_bak0(){
	cd ~/adb_bak2computer
	open ./rpm_bak1.command
	sleep 2
	open ./rpm_bak2.command
	wait
}

rpm_bak0
wait $!
echo "RPM should be backed up"