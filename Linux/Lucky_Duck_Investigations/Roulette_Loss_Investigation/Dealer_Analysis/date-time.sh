#!/bin/bash
cat combined_Roulette_Dealer_schedule | grep $1 | grep $2 | awk -F" " '{print $3,$4}'
