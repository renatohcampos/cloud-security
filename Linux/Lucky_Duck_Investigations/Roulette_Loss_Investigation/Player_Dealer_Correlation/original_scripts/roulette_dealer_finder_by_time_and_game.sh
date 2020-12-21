#!/bin/bash

CHARLEN=${#1}
END=$(($CHARLEN - 2))
MERIDIEM=${1:(-2)}
TIME=${1:0:$(($END))}
GAME=$3


echo "You have selected" $TIME $MERIDIEM "on" $2"."
echo "The game you have selected is:" $GAME


if [[ $GAME == *"oulette" ]];
then
	cat ../../Dealer*/$2* | grep $TIME* | grep $MERIDIEM* | awk -F" " '{print "The Roulette dealer was",$5,$6"."}'
fi

if [[ $GAME == *"lackjack" ]] || [[ $GAME == *"lackJack" ]];
then
        cat ../../Dealer*/$2* | grep $TIME* | grep $MERIDIEM* | awk -F" " '{print "The BlackJack dealer was",$3,$4"."}'
fi

if [[ $GAME == *"exas"* ]];
then
        cat ../../Dealer*/$2* | grep $TIME* | grep $MERIDIEM* | awk -F" " '{print "The Texas Hold Em dealer was",$7,$8"."}'
fi


