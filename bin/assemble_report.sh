#!/bin/bash

# $1 is the first argument we give
#This find command finds the paths for the specified file given
# -type f means that it is searching for a file
# -name means give the name of the file you are searching for

dir=$(find $1 -type f -name 'username_dist.html')
dir2=$(find $1 -type f -name 'hours_dist.html')
dir3=$(find $1 -type f -name 'country_dist.html')

#This combines all the files 
cat $dir3 $dir2 $dir > Try.txt

# This is from our create_username_dist.sh file
# Used our wrap_contents script in bin to wrap our holder2.txt with the html header and footer needed
./bin/wrap_contents.sh Try.txt ./html_components/summary_plots $1/failed_login_summary.html

#Removes the text file
rm Try.txt
