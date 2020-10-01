#!/bin/bash

########################################## FUNCTIONS


# Funksjon som healer deg for 10 gold

function healing () {
clear
	echo "
	Vil du bruke 10 gull på å fylle 30 hp?
	
	Hp: $char_hp	Gold: $gold"

	read -p "
		1) yes
		2) no

		Choose (1-2) > " heal

	if [[ $heal -eq 1 ]]; then
		if	[[ char_hp -lt 100 ]]; then
			echo 
			if 	[[ gold -ge 10 ]]; then
				(( char_hp += 30 ))
				(( gold -= 10 ))
				maks_hp
				clear
				echo "
		You have been healed for 30 hp!
		
		Hp: $char_hp	Gold: $gold"
				pause
				center
			else
			clear
			echo "
		You need 10 gold!
		
		Gold: $gold"
			pause
			center
			fi
		else 
			clear
			echo "
		You are already at maximum hp.

		Hp: $char_hp"
		pause
		center
		fi
	else
	echo " "
	center
	fi
}

# Funksjon som gjør at man kan maks ha 100 hp

function maks_hp () {
if [[ char_hp -gt 100 ]]; then
	(( char_hp -= (( char_hp -= 100 )) ))
fi
}

# Funksjon som sier hva karakteren din har

function character () {
	clear
	echo -n "
			$navn"
title
	echo "	HP: $char_hp"
	echo "	Fame: $fame"
	echo "	Gold: $gold"
	if [[ knife -eq 1 && sword -eq 0 ]]; then
		echo "		You have a knife"
	elif ((sword == 1)); then
		echo " 		You have a sword."
	else 
		echo "		You have no weapon."
		
	fi
	pause
}

# Funksjon som gjør at man ikke kan få minus gold

function minusgold() {

if [[ gold -lt 0 ]]; then
	[[ gold -eq 0 ]]
fi
}

# Funksjon som lager "Press any key to continue"

function pause() {
 echo " "
 read -sn 1 -p "	Press any key to continue..."
 echo " "
}

#Forskjellige random tall generatorer

function randomdmg() {
randomdmg=$(($RANDOM%5+1))
echo $randomdmg
}

function randomprosent() {
randomprosent=$(($RANDOM%100+1))
echo $randomprosent
}

function randomgold() {
randomgold=$(($RANDOM%10+1))
echo $randomgold
}


function randomgen() {
randomgen=$(($RANDOM%20+1))
echo $randomgen
}

# Funksjon for å avslutte spillet

function quitgame() {
 clear
 echo " "
 echo "
	Er du sikker du vil avslutte??"

 read -p "
	Velg (y/n) > " quit
 if [[ $quit = y || $quit = Y ]]; then
  echo " "
  clear
  echo " "
  echo " 	
	Takk for at du spilte. 🙂"
  sleep 1
  pause
  clear && exit 0

else sleep 0.01

 fi
}

# Funksjon for å lage tittel ut i fra hvor mye fame man har

function title() {

if [[ fame -ge 0 && fame -le 10 ]]; then
	echo " the Beggar"

elif [[ fame -ge 11 && fame -le 20 ]]; then
	echo " the Peasant"

elif [[ fame -ge 21 && fame -le 30 ]]; then
	echo " the Underdog"

elif [[ fame -ge 31 && fame -le 40 ]]; then
	echo " the Favourite"

elif [[ fame -ge 41 && fame -le 50 ]]; then
	echo " the Rising Star"

elif [[ fame -ge 61 && fame -le 70 ]]; then
	echo " the Celebrity"

elif [[ fame -ge 71 && fame -le 80 ]]; then
	echo " the Monarch"

elif [[ fame -ge 81 && fame -le 99 ]]; then
	echo " the Deity"

elif [[ fame -ge 100 ]]; then
	echo " the Omnipotent"

fi
}
