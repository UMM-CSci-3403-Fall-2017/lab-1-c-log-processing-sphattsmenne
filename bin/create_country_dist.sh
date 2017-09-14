#!/bin/bash

# Grabs the directory to work in
Dir=$1

# Searches through the given directory for every failed_login_data.txt. Then we use awk to grab the IP address in column 5 and put it in holder.txt to be used later
for i in $Dir/*
do
    awk '{print $5}' $i/failed_login_data.txt >> holder.txt
done



# Used  sort holder.txt and made a new file called this.txt which has holder.txt. The uniq command can get the number of occurences of each name. Then we used awk to format the data into html. Finally we use cat to place that in a new txt file called holder2.txt

sort holder.txt > this.txt

join -1 1 -2 1 this.txt ./etc/country_IP_map.txt | awk '{print $2;}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat > holder2.txt




# Used our wrap_contents script in bin to wrap our holder2.txt with the html header and footer needed
./bin/wrap_contents.sh holder2.txt ./html_components/country_dist $Dir/country_dist.html

# Removes the three temporary files we used
rm holder.txt
rm holder2.txt
rm this.txt
