logDir=$1

cd ..

cd $logDir

cat $logDir/* | awk '/Failed password for/ {print $1,$2,$3,$9,$11,$13;}' | awk '/invalid/ {print $1,$2,substr($3, 1, 2),$5,$6;} ! /invalid/ {print $1,$2,substr($3, 1, 2),$4,$5;}' > failed_login_data.txt


