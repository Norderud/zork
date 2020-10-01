#!/bin/bash

source functions.sh
source locations.sh
source enemies.sh


###################### Character


fame=1
gold=100
char_dmg=$(($RANDOM%10))
char_hp=90


########################### VÅPEN


knife=0
knivdmg=5



sword=0
sverddmg=10



######################## SHOP

function shop() {

clear


echo "
	Du er i butikken. Hva vil du ha?

	1) Kniv		(100 gold)
	2) Sverd	(500 gold)
	3) Billboard	(50 gold)
	4) Exit
"

read -p " Velg (1-4) > " shopvalg

if [[ $shopvalg -eq 1 ]]; then

	if [[ gold -lt 100 ]]; then
	clear
		echo "
	nigga you broke."
	pause
	shop
	fi			

	if [[ knife -eq 0 ]]; then
	clear
	echo "
	Du har kjøpt en kniv."
	((knife += 1))
	((gold -= 100))
	pause
	shop
	
	else
	clear
	echo "
	This item is unavailable."
	pause
	shop

	fi


elif [[ $shopvalg -eq 2 ]]; then
	if [[ gold -lt 500 ]]; then
	clear
		echo "
	nigga you broke."
	pause
	shop
	fi	

	if [[ knife -eq 1 && sword -eq 0 ]]; then 
	clear
	echo "
	Du har kjøpt et sverd."
	((sword += 1))
	((gold -= 500))
	pause
	shop

	else
	clear
	echo "
	This item is unavailable."
	pause
	shop
	fi

elif [[ $shopvalg -eq 3 ]]; then
	if [[ gold -lt 50 ]]; then
	clear
		echo "
	nigga you broke."
	pause
	shop
	fi	

	clear
	echo "
	Your fame has increased."
	((gold -= 50))
	((fame += 10))
	pause
	shop



elif [[ $shopvalg -eq 4 ]]; then
	clear
	echo "
	Du går ut og tilbake til byen."
	pause
	center

else
	shop

fi


}



#################################################################################### START

clear

echo "Velkommen til ZORK!"
sleep 1
echo "Zork er et interaktivt tekstbasert spill på høyde med The Witcher 3."
pause
clear

echo "Det er enda i utviklingsfasen."
pause
clear

echo "Er du klar?"
pause
clear

read -p "Hva heter du? > " navn
sleep 0.2

echo "Velkommen $navn."
pause
center
