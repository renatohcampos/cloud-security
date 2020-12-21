#!bin/bash
cat ../combined*/combined* | grep $1 | grep $2 | awk -F" " '{print "The Roulette dealer was",$5,$6"."}'
