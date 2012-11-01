#!/bin/bash
# WIP: (20121023)
# store_bak2computer - This is where I'll keep all the functions, info, captains logs, functions and so on and so forth
#
# General Idea / Minimal Goals:
# - need two processes for each partition (DONE)
# - adb forward a port so the android device can send data to the machine (DONE)
# - proc1 - loadup a netcat instance on the android device then start the first part of the dd (DONE)
# - proc2 - loadup a netcat instance on the local machine then use pv catch the image on the machine via netcat (DONE)
# - menu it up in bash so its almost point and click (DONE)
#
# Kinda Reaching Goals:
# - option to convert applicable images to tars or zips for rom cooking
# - option to tar it all up for ODIN
#
# THOUGHTS:
# - will have to spawn a foreground process for each proc2 (DONE)
# - when the transfer is done will have to gracefully exit both proc1 and proc2
# 
# ALL CREDIT GOES TO: 
# das7982 - for ODIN guide here:
#    - http://forum.xda-developers.com/showpost.php?p=28876440&postcount=1
# scandiun - for "nandroid" backup directly to computer guid here: 
#    - http://forum.xda-developers.com/showpost.php?s=694f9ec3c18f700f31d3d81aaf3193ca&p=29862574&postcount=1
# and whomever they credited in their guides as well 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


## STORAGE: This data is for future use ##
#LOCALPATH="/path/to/store/the/backup"

# Standard blocks
# SYS_BLK="/dev/block/mmcblk0p14"
# DAT_BLK="/dev/block/mmcblk0p15"
# BOT_BLK="/dev/block/mmcblk0p7"

# Optional blocks
# CHE_BLK="/dev/block/mmcblk0p17"
# REC_BLK="/dev/block/mmcblk0p18"
# MOD_BLK="/dev/block/mmcblk0p1"
# LT1_BLK="/dev/block/mmcblk0p12"
# LT2_BLK="/dev/block/mmcblk0p13"
## END_STORAGE ##

## SYSTEM: backup system partition ##
system_bak1(){
	echo "system_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p14" | adb shell
	wait
}

system_bak2(){
	echo "system_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p14_system.img
	wait $!
	echo "system_bak2 is done"
}

system_bak0(){
	cd ~/adb_bak2computer
	open ./system_bak1.command
	sleep 2
	open ./system_bak2.command
	wait
}

## END_SYSTEM ##

## RECOVERY: backup recovery partition ##
recovery_bak1(){
	echo "recovery_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p18" | adb shell
	wait
}

recovery_bak2(){
	echo "recovery_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p18_recovery.img
	wait $!
	echo "recovery_bak2 is done"
}

recovery_bak0(){
	cd ~/adb_bak2computer
	open ./recovery_bak1.command
	sleep 2
	open ./recovery_bak2.command
	wait
}

## END_RECOVERY ##

## USERDATA: backup data partition ##
userdata_bak1(){
	echo "userdata_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p15" | adb shell
	wait
}

userdata_bak2(){
	echo "userdata_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p15_data.img
	wait
	echo "userdata_bak2 is done"
}

userdata_bak0(){
	cd ~/adb_bak2computer
	open ./userdata_bak1.command
	sleep 2
	open ./userdata_bak2.command
	wait
}
## END_USERDATA ##

## CDMA: backup cdma modem ##
modem_cdma_bak1(){
	echo "modem_cdma_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p1" | adb shell
	wait
}

modem_cdma_bak2(){
	echo "modem_cdma_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p1_modem.img
	wait $!
	echo "modem_cdma_bak2 is done"
}

modem_cdma_bak0(){
	cd ~/adb_bak2computer
	open ./modem_cdma_bak1.command
	sleep 2
	open ./modem_cdma_bak2.command
	wait
}

## END_CDMA ##

## LTE1: backup LTE modem1 ##
modem1_lte_bak1(){
	echo "modem1_lte_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p12" | adb shell
	wait
}

modem1_lte_bak2(){
	echo "modem1_lte_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p12_modemst1.img
	wait $!
	echo "modem1_lte_bak2 is done"
}

modem1_lte_bak0(){
	cd ~/adb_bak2computer
	open ./modem1_lte_bak1.command
	sleep 2
	open ./modem1_lte_bak2.command
	wait	
}

## END_LTE1 ##

## LTE2: backup LTE modem2 ##
modem2_lte_bak1(){
	echo "modem2_lte_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p13" | adb shell
	wait
}

modem2_lte_bak2(){
	echo "modem2_lte_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p13_modemst1.img
	wait $!
	echo "modem2_lte_bak2 is done"
}

modem2_lte_bak0(){
	cd ~/adb_bak2computer
	open ./modem2_lte_bak1.command
	sleep 2
	open ./modem2_lte_bak2.command
	wait
}

## END_LTE2 ##

## CACHE: backup cache ##
cache_bak1(){
	echo "cache_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p17" | adb shell
	wait
}

cache_bak2(){
	echo "cache_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > ./mmcblk0p17_cache.img
	wait $!
	echo "cache_bak2 is done"
}

cache_bak0(){
	cd ~/adb_bak2computer
	open ./cache_bak1.command
	sleep 2
	open ./cache_bak2.command
	wait
}

## END_CACHE ##

## BOOT: backup boot ##
boot_bak1(){
	echo "boot_bak1 is running"
	adb forward tcp:5555 tcp:5555
	sleep 2
	echo "/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd bs=4096 if=/dev/block/mmcblk0p7" | adb shell
	wait
}

boot_bak2(){
	echo "boot_bak2 is running"
	cd ~/adb_bak2computer/out
	adb forward tcp:5555 tcp:5555
	sleep 2
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p7_boot.img
	wait $!
	echo "boot_bak2 is done"
}

boot_bak0(){
	cd ~/adb_bak2computer
	open ./boot_bak1.command
	sleep 2
	open ./boot_bak2.command
	wait
}

## END_BOOT ##