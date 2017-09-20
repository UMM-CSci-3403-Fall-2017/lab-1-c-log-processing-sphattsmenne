#!/usr/bin/bash
# Menne and Sphatt

dir=$*
stard=$(pwd)
Temp=`mktemp --directory`

for i in $dir;
	do
	NAME=`basename -s "_secure.tgz" "$i"`;
	mkdir "$Temp/$NAME";
	tar -xzf "$i" -C "$Temp/$NAME";
	./bin/process_client_logs.sh "$Temp/$NAME"
        done

"$stard"/bin/create_username_dist.sh "$Temp"

"$stard"/bin/create_hours_dist.sh "$Temp"

"$stard"/bin/create_country_dist.sh "$Temp"

"$stard"/bin/assemble_report.sh "$Temp"

mv "$Temp/failed_login_summary.html" "$stard"
