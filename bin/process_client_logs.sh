#!/bin/bash

# Gets and cds into the working directory
logDir=$1
cd $logDir

# We used grep to recursively get the files in $logDir. Then we used awk to get the lines which have "Failed password for". After that we use another awk command to get the the right data based on the two different cases. Finally we used cat to put all that formated data into a new txt file called failed_login_data.txt
grep -rh .| awk '/Failed password for/ {print $1,$2,$3,$9,$11,$13;}' | awk '/invalid/ {print $1,$2,substr($3, 1, 2),$5,$6;} ! /invalid/ {print $1,$2,substr($3, 1, 2),$4,$5;}' | cat > failed_login_data.txt





