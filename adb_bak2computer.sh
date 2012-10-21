#!/bin/bash
# WIP adb_bak2computer - tool to backup d2vzw (SCH-I535) partitions directly to a users desktop/laptop
# General Idea / Minimal Goals:
# - need two processes for each partition
# - adb forward a port so the android device can send data to the machine
# - proc1 - loadup a netcat instance on the android device then start the first part of the dd
# - proc2 - loadup a netcat instance on the local machine then use pv push the image to the machine via netcat
# 
# Mid Rage Goals:
# - menu it up in bash so its almost point and click
# 
#
# Kinda Reaching Goals:
# - option to convert applicable images to tars or zips for rom cooking
# - option to tar it all up for ODIN
#
# THOUGHTS:
# - will have to spawn a foreground process for each proc2
# - when the transfer is done will have to gracefully exit both proc1 and proc2 ( I may have to make a bak0 function for each partition)
# - can't do more than one dd at once so each set of functions will need to be seperated somehow
# 
# ALL CREDIT GOES TO: 
# das7982 - for ODIN guide here:
#    - http://forum.xda-developers.com/showpost.php?p=28876440&postcount=1
# scandiun - for "nandroid" backup directly to computer guid here: 
#    - http://forum.xda-developers.com/showpost.php?s=694f9ec3c18f700f31d3d81aaf3193ca&p=29862574&postcount=1
# and whomever they credited in their guides as well 
# short story I'm not taking credit for any of this, I'm just trying to make it easy to backup my S3 to my laptop
# so I can save space on my external and internal sdcards cause stock touchwiz is HUGE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Required variables
LOCALPATH="/path/to/store/the/backup"

# Standard blocks
SYS_BLK="/dev/block/mmcblk0p14"
DAT_BLK="/dev/block/mmcblk0p15"
BOT_BLK="/dev/block/mmcblk0p7"


# Optional blocks
CHE_BLK="/dev/block/mmcblk0p17"
REC_BLK="/dev/block/mmcblk0p18"
MOD_BLK="/dev/block/mmcblk0p1"
LT1_BLK="/dev/block/mmcblk0p12"
LT2_BLK="/dev/block/mmcblk0p13"


# backup system partition
system_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p14
}

system_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p14_system.img bs=4096
}

# backup recovery partition
recovery_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p18
}

recovery_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p18_recovery.img bs=4096
}

# backup data partition
data_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p15
}

data_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p15_data.img bs=4096
}

# backup CDMA MODEM
modem_cdma_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p1
}

modem_cdma_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p1_modem.img bs=4096
}

# backup LTE modem1
modem1_lte_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p12
}

modem1_lte_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p12_modemst1.img bs=4096
}

# backup LTE modem2
modem2_lte_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p13
}

modem2_lte_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p13_modemst1.img bs=4096
}

# backup cache
cache_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p17
}

cache_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p17_cache.img bs=4096
}

# backup boot
boot_bak1(){
	adb forward tcp:5555 tcp:5555
	adb shell
	/system/xbin/busybox nc -l -p 5555 -e /system/xbin/busybox dd if=/dev/block/mmcblk0p7
}

boot_bak2(){
	adb forward tcp:5555 tcp:5555
	cd $LOCALPATH
	nc 127.0.0.1 5555 | pv -i 0.5 > /mmcblk0p7_boot.img bs=4096
}

boot_bak0

# pick a partition menu
menu1(){
	# have to write the stupid menu
}

main(){
	# um do really cool stuff
}


