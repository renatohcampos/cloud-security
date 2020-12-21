#!/bin/bash
cat ../isolated*/combined* | grep $1 | grep $2 | awk -F" " '{print $3,$4}'
