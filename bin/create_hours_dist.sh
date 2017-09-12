#!/bin/bash

# Grabs the directory to work in
Dir=$1

# Searches through the given directory for every failed_login_data.txt. Then we use awk to grab the hour in column 3 and put it in holder.txt to be used later
for i in $Dir/*
do
    awk '{print $3}' $i/failed_login_data.txt >> holder.txt
done

# Used sort to sort holder.txt so uniq can get the number of occurences of each hours and failed login attempts. Then we used awk to format the data into html. Finally we use cat to place that in a new txt file called holder2.txt
sort holder.txt | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat > holder2.txt

# Used our wrap_contents script in bin to wrap our holder2.txt with the html header and footer needed
./bin/wrap_contents.sh holder2.txt ./html_components/hours_dist $Dir/hours_dist.html

# Removes the two temporary holder files we used
rm holder.txt
rm holder2.txt
