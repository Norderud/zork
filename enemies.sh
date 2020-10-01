#!/bin/bash

########################### ENEMIES



######################## TROLL


function troll() {
prosent=`randomprosent`
troll_hp=50

troll_def=0
penger=`randomgold`
randomint=`randomgen`
clear

read -p "
		Du møter et troll!!" engage

pause

((troll_hp == 50 ))

while true; do

char_dmg=$(($RANDOM%10 + 5))
troll_dmg=$(($RANDOM%7 + 5 ))
troll_def=$(($RANDOM%4))
char_def=$(($RANDOM%5))
clear

read -p "
	Det er et troll foran deg. Hva gjør du:

	Troll HP: $troll_hp
	Your HP: $char_hp

	1) Angrip
	2) Teleport

	Velg (1-2) > " atk

	if [[ $atk -eq 1 ]]; then
		
		trollatkd


		pause

		trollatk
		
		pause

		if [[ $troll_hp -le 0 ]]; then
			echo "	grats
			Du tjente 1 fame
			og $penger gold!"
		((fame += 1))
		((gold += $penger))
		break; 

		elif [[ $char_hp -le 0 ]]; then
		
		echo "	You fainted... You lost 5 fame."
		((fame -= 5))
		break;
		fi

	elif [[ $atk -eq 2 ]]; then
		((fame -=1))
	echo "
	You teleported to safety.. coward.

	Fame decreased by 1"
	pause
	center
	
	else 
		echo " "
	fi
done
pause
center
}

function trollatk() {

((char_hp -= troll_dmg))

((char_hp += char_def))

}

function trollatkd() {

((troll_hp -= char_dmg))
if [[ knife -eq 1 && sword -eq 0 ]]; then
	((troll_hp -= knivdmg))
	echo "You hit troll for $char_dmg + $knivdmg))"
fi

if [[ sword -eq 1 ]]; then
	((troll_hp -= sverddmg))
	echo "You hit troll for $char_dmg + $sworddmg."

else
	echo -e "
	You hit troll for $char_dmg. Troll defends $troll_def dmg."


fi
((troll_hp += troll_def))

}

############################### thug

function thug() {
prosent=`randomprosent`
thug_hp=50
thug_def=0
penger=`randomgold`
randomint=`randomgen`
clear

read -p "
		Du møter en kjeltring!!!" engage

pause

((thug_hp == 50 ))

while true; do

char_dmg=$(($RANDOM%10 + 5 ))
thug_dmg=$(($RANDOM%7 + 5 ))
thug_def=$(($RANDOM%4))
char_def=$(($RANDOM%4))

clear

read -p "
	Det er en kjeltring foran deg. Hva gjør du:

	Thug HP: $thug_hp
	Your HP: $char_hp

	1) Angrip
	2) Teleport

	Velg (1-2) > " atk

	if [[ $atk -eq 1 ]]; then
		
		thugatkd

	echo -e "
	You hit thug for $char_dmg. Thug defends $thug_def dmg."
		pause

		thugatk
		echo -e "
	Thug hits you for $thug_dmg. You defend $char_def dmg."
		pause

		if [[ $thug_hp -le 0 ]]; then
			echo "	grats
			Du tjente 1 fame
			og $penger gold!"
		((fame += 1))
		((gold += $penger))
		break; 

		elif [[ $char_hp -le 0 ]]; then
		
		echo "	You fainted... You lost 5 fame."
		((fame -= 5))
		break;
		fi

	elif [[ $atk -eq 2 ]]; then
		((fame -=1))
	echo "
	You teleported to safety.. coward.

	Fame decreased by 1"
	pause
	center

		 



	
	else 
		echo " "
	fi
done
pause
center

}

function thugatk() {

((char_hp -= thug_dmg))

((char_hp += char_def))

}

function thugatkd() {

((thug_hp -= char_dmg))
if [[ knife -eq 1 ]]; then
	((thug_hp -= knivdmg))
fi

if [[ sword -eq 1 ]]; then
	((thug_hp -= sverddmg))
fi
((thug_hp += thug_def))

}




########################## raptor

function raptor() {
prosent=`randomprosent`
raptor_hp=50
penger=`randomgold`
randomint=`randomgen`
clear

read -p "
		Du møter en raptor!!" engage

pause

((raptor_hp == 50 ))

while true; do

char_dmg=$(($RANDOM%10 + 5))
raptor_dmg=$(($RANDOM%7 + 5))
raptor_def=$(($RANDOM%4))
char_def=$(($RANDOM%5))

clear

read -p "
	Det er en raptor foran deg. Hva gjør du:

	Raptor HP: $raptor_hp
	Your HP: $char_hp

	1) Angrip
	2) Teleport

	Velg (1-2) > " atk

	if [[ $atk -eq 1 ]]; then
		
		raptoratkd

	echo -e "
	You hit raptor for $char_dmg. Raptor defends $raptor_def dmg."
		pause

		raptoratk
		echo -e "
	Raptor hits you for $raptor_dmg. You defend $char_def dmg."
		pause

		if [[ $raptor_hp -le 0 ]]; then
			echo "	grats
			Du tjente 1 fame
			og $penger gold!"
		((fame += 1))
		((gold += $penger))
		break; 

		elif [[ $char_hp -le 0 ]]; then
		
		echo "	You fainted... You lost 5 fame."
		((fame -= 5))
		break;
		fi

	elif [[ $atk -eq 2 ]]; then
		((fame -=1))
	echo "
	You teleported to safety.. coward.

	Fame decreased by 1"
	pause
	center

		 



	
	else 
		echo " "
	fi
done
pause
center

}

function raptoratk() {

((raptor_dmg -= char_def))

((char_hp -= raptor_dmg))



}

function raptoratkd() {

((raptor_hp -= char_dmg))
if [[ knife -eq 1 ]]; then
	((raptor_hp -= knivdmg))
fi

if [[ sword -eq 1 ]]; then
	((raptor_hp -= sverddmg))
fi
((raptor_hp += raptor_def))

}

