#!/bin/bash

########################################## LOCATIONS

#### TOWN CENTER

function center() {

clear

if [[ $char_hp -le 0 ]]; then
	echo "
		GAME OVER!"
	pause
	exit
	fi


echo "
	Du er i sentrum. Hvor vil du gå?

	1) Arena
	2) Shop
	3) Back Alley
	4) Hospital
	5) Character
	6) Quit
"

read -p " Velg (1-5) > " tall

if [[ $tall -eq 1 ]]; then
	randomint=`randomgen`
	if [[ $randomint -le 6 ]]; then
		thug
	elif [[ $randomint -ge 7 && $randomint -le 13 ]]; then
		troll
	elif [[ $randomint -ge 14 && $randomint -le 20 ]]; then
		raptor
	fi
elif [[ $tall -eq 2 ]]; then
	shop

elif [[ $tall -eq 3 ]]; then
	bakgate

elif [[ $tall -eq 4 ]]; then
	healing


elif [[ $tall -eq 5 ]]; then
	clear
	character
	center

elif [[ $tall -eq 6 ]]; then
	quitgame
	center

else center

fi

}


#################################################################################### Back Alley

function randomgold_hor() {
local randomgold=$(($RANDOM%30+1))
echo $randomgold
}

function randomgold_ran() {
local randomgold=$((-$RANDOM%30+1))
echo $randomgold
}

function stealing () {

randomsteal=`randomgold_hor`
randomint=`randomgen`
randomran=`randomgold_ran`

if [[ $randomint -le 6 ]]; then
	clear
	echo "	
	You found an easy target and pickpocket him without getting cought!
	
	+ $randomsteal gold.		Gold: $(( $gold + $randomsteal ))"
	(( gold += $randomsteal ))
	sleep 1
	pause
	bakgate

elif	[[ $randomint -ge 7 && $randomint -le 13 ]]; then
	if	[[ $gold -le -$(( $randomran ))  && $gold -gt 0 ]]; then
	clear
		echo "
	You attempt to steal from the wrong guy. 
	He notices you, grabs you punches you and punch you in the face. 
	Then he takes all your gold.

	- $gold gold 		gold: 0
	- - 5 hp     		Hp: $(( $char_hp - 5 ))"   
		(( gold -= gold ))
		(( char_hp -= 5 ))
		pause
		bakgate
		elif	[[ $gold -le 0 ]]; then
		(( gold <= 0 ))
		clear
		echo "
	You attempt to steal from the wrong guy. 
	He notices you, grabs you punches you and punch you in the face. 
	He tries steal from you, but you are broke... So he gives you another punch.

	- 10 hp     		Hp: $(( $char_hp - 10 ))"
	(( char_hp -= 10 ))  
	sleep 1
	pause
	bakgate
	else
	clear
	(( gold += $randomran ))
	echo "
	You break into a store, but the owner is there. 
	You get out before he catches you, but you drop some coins 
	when you rush out.
	
	$randomran gold. 	Gold: $gold"
	sleep 1
	pause
	bakgate
	fi

elif	[[ $randomint -ge 14 && $randomint -le 20 ]]; then
	clear
	(( gold += $randomsteal ))
	(( fame -= 2 ))
	echo "	
	Your attempt is succesful, but someone saw you do it!
	The rumor that you've been stealing is spreading.
	
	+$randomsteal gold. 		Gold: $gold
	- 2 fame.		Fame: $fame"
	pause
	bakgate
fi
}





function bakgate() {
randomint=`randomgen`

clear

echo "
	You wander off into an alley. The people here don't look very friendly.

	1) Shady basement
	2) Steal
	3) Back to town center
	4) Character
	5) Quit
"

read -p " Velg (1-5) > " tall

if [[ $tall -eq 1 ]]; then
	underground
elif [[ $tall -eq 2 ]]; then
	stealing
elif [[ $tall -eq 3 ]]; then
	clear
	echo "	
	Du gikk tilbake sentrum"
	sleep 1
	center

elif [[ $tall -eq 4 ]]; then
	clear
	character
	bakgate
	
elif [[ $tall -eq 5 ]]; then
	clear
	quitgame
	bakgate

else bakgate

fi

}

#################################################################################### UNDERGROUND FIGHTING

function quitgame_underground() {
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
  echo " 	Takk for at du spilte. 🙂"
  sleep 1
  pause
  clear && exit 0

else underground

 fi
}

function underground() {
randomint=`randomgen`

clear

echo "
	Du går ned en trapp. Det er mange folk som står rundt en ring og vifter med penger.
	Hva vil du gjøre?

	1) Fighte
	2) Se på
	3) Tilbake til bakgaten
	4) Character
	5) Quit
"

read -p " Velg (1-5) > " tall

if [[ $tall -eq 1 ]]; then
	fighting
elif [[ $tall -eq 2 ]]; then
	clear
	echo "
	Du ser to personer sparke og slå hverandre til blods"
	pause
	underground

elif [[ $tall -eq 3 ]]; then
	clear
	echo 	
	echo "	
	Du går tilbake opp trappen til bakgaten"
	sleep 1
	bakgate

elif [[ $tall -eq 4 ]]; then
	character
	underground

elif [[ $tall -eq 5 ]]; then
	quitgame
	underground

else underground

fi

}

function fighting () {
randomran=`randomgold_ran`
randomhor=`randomgold_hor`

clear
if [ $gold -gt 30 ]; then
	while true; do
		local int=$(($RANDOM%20+1))
		if [[ $int -eq 1 ]]; then
			(( gold += $randomran ))
			echo "
	Du fikk ett uforventet slag i ansiktet og tapte. $randomran gull."
			break; fi

		if [[ $int -eq 20 ]]; then
			(( gold += $randomhor ))
			echo "
	Du sparket han i hodet. Han ble knocket ut. $randomhor gull."
			break; fi

		if [[ $int -lt 5 && $int -gt 1 ]]; then
			echo "
	Han slo deg i ansiktet"
			sleep 0.7
		elif [[ $int -gt 5 && $int -lt 10 ]]; then
			echo "
	Du slo han i ansiktet"
			sleep 0.7
		elif [[ $int -gt 10 && $int -lt 15 ]]; then
			echo "
	Han sparket deg i magen"
			sleep 0.7
		elif [[ $int -gt 15 && $int -lt 20 ]]; then
			echo "
	Du sparket han i magen"
			sleep 0.7
		fi
	done
	pause
	underground
else
	echo "
	You need more than 30 gold to fight in the pit." 
	pause
	underground
fi
}

