#!/bin/bash
# adb_bak2computer - tool to backup d2vzw (SCH-I535) partitions directly to a users desktop/laptop
# 
# UPDATED: 20121115
# 
# ALL CREDIT GOES TO: 
# das7982 - for ODIN guide here:
#    - http://forum.xda-developers.com/showpost.php?p=28876440&postcount=1
# scandiun - for "nandroid" backup directly to computer guid here: 
#    - http://forum.xda-developers.com/showpost.php?s=694f9ec3c18f700f31d3d81aaf3193ca&p=29862574&postcount=1
# and whomever they credited in their guides as well 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

## ENVIRONMENT: setup our environment for us shall we ##
shopt -s extglob
printf "\e[8;29;72;t"
## END_ENVIRONMENT ##

## ART: obligatory silly ascii art ##
O_Alquimista() {
cat <<"EOT"
         _____/\/\______/\/\__________/\/\/\/\____/\/\/\/\_    
        ___/\/\/\/\____/\/\________/\/\____/\/\____/\/\___     
       _/\/\____/\/\__/\/\________/\/\____/\/\____/\/\___      
      _/\/\/\/\/\/\__/\/\________/\/\__/\/\______/\/\___       
     _/\/\____/\/\__/\/\/\/\/\____/\/\/\/\/\__/\/\/\/\_        
    __________________________________________________         
          = A . L . Q . U . I . M . I . S . T . A =            
                     adb_back2computer                         
EOT
}
## END_ART ##

## MENU3: CRAZY BACKUP options ##
show_menu3(){
	clear
	O_Alquimista
		echo "  1) Backup aboot"
		echo "  2) Backup SBL1"
		echo "  3) Backup SBL2"
		echo "  4) Backup SBL3"
		echo "  5) Backup RPM"
		echo "  6) Backup TZ"
		echo "  7) Backup PAD"
		echo "  8) Backup Param"
		echo "  9) Backup efs"
		echo "  10) Backup Persist"
		echo "  11) Backup fota"
		echo "  12) Backup backup"
		echo "  13) Backup fsg"
		echo "  14) Backup ssd"
		echo "  15) Backup grow"
		echo "  16) Backup mmcblk0boot0"
		echo "  17) Backup mmcblk0boot1"
		echo "  18) BACK TO ADVOANCED OPTIONS MENU"
		echo "  19) BACK TO MAIN MENU"
		echo "  20) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu3(){
while [ 1 ]
do
	show_menu3
	read CHOICE
	case "$CHOICE" in
		"1")
			sh ./scripts/aboot_bak0.sh
			;;
		"2")
			sh ./scripts/sbl1_bak0.sh
			;;
		"3")
			sh ./scripts/sbl2_bak0.sh
			;;
		"4")
			sh ./scripts/sbl3_bak0.sh
			;;
		"5")
			sh ./scripts/rpm_bak0.sh
			;;
		"6")
			sh ./scripts/tz_bak0.sh
			;;
		"7")
			sh ./scripts/pad_bak0.sh
			;;
		"8")
			sh ./scripts/param_bak0.sh
			;;
		"9")
			sh ./scripts/efs_bak0.sh
			;;
		"10")
			sh ./scripts/persist_bak0.sh
			;;
		"11")
			sh ./scripts/fota_bak0.sh
			;;
		"12")
			sh ./scripts/backup_bak0.sh
			;;
		"13")
			sh ./scripts/fsg_bak0.sh
			;;
		"14")
			sh ./scripts/ssd_bak0.sh
			;;
		"15")
			sh ./scripts/grow_bak0.sh
			;;
		"16")
			sh ./scripts/mmcblk0boot0_bak0.sh
			;;
		"17")
			sh ./scripts/mmcblk0boot1_bak0.sh
			;;
		"18")
			menu2
			;;
		"19")
			menu1
			;;
		"20")
			exit
			;;
	esac
done	
}

## END_MENU3 ##

## MENU2: Advanced/Optional backups ##
show_menu2(){
	clear
	O_Alquimista
		echo "  1) Backup UserData"
		echo "  2) Backup LTE Modem Part1"
		echo "  3) Backup LTE Modem Part2"
		echo "  4) Backup CDMA Modem"
		echo "  5) CRAZY BACKUP OPTIONS"
		echo "  6) BACK TO MAIN MENU"
		echo "  7) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu2(){
while [ 1 ]
do
	show_menu2
	read CHOICE
	case "$CHOICE" in
		"1")
			sh ./scripts/userdata_bak0.sh
			;;
		"2")
			sh ./scripts/modem1_lte_bak0.sh
			;;
		"3")
			sh ./scripts/modem2_lte_bak0.sh
			;;
		"4")
			sh ./scripts/modem_cdma_bak0.sh
			;;
		"5")
			menu3
			;;
		"6")
			menu1
			;;
		"7")
			exit
			;;
	esac
done	
}

## END_MENU2 ##


## MENU1: pick a partition menu ##
show_menu1(){
	clear
	O_Alquimista
		echo "  1) Backup System"
		echo "  2) Backup Data"
		echo "  3) Backup Boot"
		echo "  4) Backup Cache"
		echo "  5) Backup Recovery"
		echo "  6) Backup Internal SDCard"
		echo "  7) Backup External SDCard"
		echo "  8) ADVANCED OPTIONS MENU"
		echo "  9) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu1(){
while [ 1 ]
do
	show_menu1
	read CHOICE
	case "$CHOICE" in
		"1")
			sh ./scripts/system_bak0.sh
			;;
		"2")
			sh ./scripts/data_bak0.sh
			;;
		"3")
			sh ./scripts/boot_bak0.sh
			;;
		"4")
			sh ./scripts/cache_bak0.sh
			;;
		"5")
			sh ./scripts/recovery_bak0.sh
			;;
		"6")
			sh ./scripts/internalSD_bak0.sh
			;;
		"7")
			sh ./scripts/externalSD_bak0.sh
			;;
		"8")
			menu2
			;;
		"9")
			exit
			;;
	esac
done
}

## END_MENU1 ##

## MAIN: This is where the magic happens ##
main(){
	menu1
}

main

## END_MAIN ##
