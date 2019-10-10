#!/bin/bash

#. ./logmaker.sh
#. ./showrepo.sh

echo These items are currently selectable:

#incremental while loop to display all files in the working repository on separate lines, separated by numerical indicators
#additionally initialises a variable corresponding to each file, which keeps track of whether the file is logged in or out
#will not properly handle files with delimiter characters in their titles due to the parsing of ls -1
i="1"
while [ $i -lt $[$(ls -1 | wc -l)+1] ]
do
	echo -n $i") "; ls -1 | head -$i | tail -1
	if [ -z "${logoutstatus[$i]}" ]
	then
		logoutstatus[$i]=0
	fi
	i=$[$i+1]
done

#allows the user to select which file they want to log in/out of
#will be revised to allow for multiple options after selecting the file, in addition to log messages
read -p "Which menu item would you like to select? " choice

ls -1 | head -$choice | tail -1 | tr '\n' ' '
if [ ${logoutstatus[$choice]} -eq "0" ]
then
	echo has been logged in to
	logoutstatus[$choice]="1"
elif [ ${logoutstatus[$choice]} -eq "1" ]
then
	echo has been logged out of
	logoutstatus[$choice]="0"
else
	echo logout status is unknown
fi