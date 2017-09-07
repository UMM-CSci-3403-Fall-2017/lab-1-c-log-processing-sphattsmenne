#!/bin/bash

logDir=$1
location=$(pwd)/*

echo $location
cd $logDir/*/var/log


cat * | awk '/Failed password for/ {print $1,$2,$3,$9,$11,$13;}' | awk '/invalid/ {print $1,$2,substr($3, 1, 2),$5,$6;} ! /invalid/ {print $1,$2,substr($3, 1, 2),$4,$5;}' > failed_login_data.txt

#mv failed_login_data.txt $location




