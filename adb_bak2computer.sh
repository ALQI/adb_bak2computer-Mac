#!/bin/bash
# adb_bak2computer - tool to backup d2vzw (SCH-I535) partitions directly to a users desktop/laptop
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
printf "\e[8;25;72;t"
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


## MENU2: Advanced/Optional backups ##
show_menu2(){
	clear
	O_Alquimista
		echo "  1) Backup Recovery"
		echo "  2) Backup LTE Modem Part1"
		echo "  3) Backup LTE Modem Part2"
		echo "  4) Backup CDMA Modem"
		echo "  5) BACK TO MAIN MENU"
		echo "  6) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu2(){
while [ 1 ]
do
	show_menu2
	read CHOICE
	case "$CHOICE" in
		"1")
			sh ./recovery_bak0.sh
			;;
		"2")
			sh ./modem1_lte_bak0.sh
			;;
		"3")
			sh ./modem2_lte_bak0.sh
			;;
		"4")
			sh ./modem_cdma_bak0.sh
			;;
		"5")
			show_menu1
			;;
		"6")
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
		echo "  5) ADVANCED OPTIONS MENU"
		echo "  6) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu1(){
while [ 1 ]
do
	show_menu1
	read CHOICE
	case "$CHOICE" in
		"1")
			sh ./system_bak0.sh
			;;
		"2")
			sh ./data_bak0.sh
			;;
		"3")
			sh ./boot_bak0.sh
			;;
		"4")
			sh ./cache_bak0.sh
			;;
		"5")
			show_menu2
			;;
		"6")
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
