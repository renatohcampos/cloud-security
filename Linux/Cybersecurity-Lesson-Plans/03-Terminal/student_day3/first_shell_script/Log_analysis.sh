#!/usr/bin.zsh

awk -F" " '{print $4, $6}' LogA.txt > ../learning_awk/Update3_Combined_Access_logs.txt
