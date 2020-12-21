#!bin/bash
cat ~/Lucky_Duck_Investigations/Dealer_Schedules_0310/combined_dealer_data | grep $1 | grep $2 | awk -F" " '{print "The Roulette dealer was",$5,$6"."}'
