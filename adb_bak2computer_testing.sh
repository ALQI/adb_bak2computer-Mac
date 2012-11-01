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

## FUNCTIONS: These call the .command files ##
data_bak0(){
	open ./data_bak1.command
	sleep 2
	open ./data_bak2.command
	sleep 2
	open ./data_bak3.command
	wait
}

recovery_bak0(){
	open ./recovery_bak1.command
	sleep 2
	open ./recovery_bak2.command
	wait
}

system_bak0(){
	open ./system_bak1.command
	sleep 2
	open ./system_bak2.command
	wait
}

modem1_lte_bak0(){
	open ./modem1_lte_bak1.command
	sleep 2
	open ./modem1_lte_bak2.command
	wait	
}

modem2_lte_bak0(){
	open ./modem2_lte_bak1.command
	sleep 2
	open ./modem2_lte_bak2.command
	wait
}

cache_bak0(){
	open ./cache_bak1.command
	sleep 2
	open ./cache_bak2.command
	wait
}

modem_cdma_bak0(){
	open ./modem_cdma_bak1.command
	sleep 2
	open ./modem_cdma_bak2.command
	wait
}

boot_bak0(){
	open ./boot_bak1.command
	sleep 2
	open ./boot_bak2.command
	wait
}

userdata_bak0(){
	open ./userdata_bak1.command
	sleep 2
	open ./userdata_bak2.command
	wait
}

## END_FUNCTIONS ##

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
		echo "  1) Backup UserData *HUGE*"
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
			userdata_bak0; wait $!
			;;
		"2")
			modem1_lte_bak0; wait $!
			;;
		"3")
			modem2_lte_bak0; wait $!
			;;
		"4")
			modem_cdma_bak0; wait $!
			;;
		"5")
			menu1
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
		echo "  5) Backup Recovery"
		echo "  6) ADVANCED OPTIONS MENU"
		echo "  7) EXIT"
		printf "\e[1mPick A Number\e[m:"
}

menu1(){
while [ 1 ]
do
	show_menu1
	read CHOICE
	case "$CHOICE" in
		"1")
			system_bak0; wait $!
			;;
		"2")
			data_bak0; wait $!
			;;
		"3")
			boot_bak0; wait $!
			;;
		"4")
			cache_bak0; wait $!
			;;
		"5")
			recovery_bak0; wait $!
			;;
		"6")
			menu2
			;;
		"7")
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
