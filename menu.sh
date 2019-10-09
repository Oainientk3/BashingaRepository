#!/bin/bash
echo These items are currently selectable:

#incremental while loop to display all files in the working repository on separate lines, separated by numerical indicators
#will not properly handle files with delimiter characters in their titles due to the parsing of ls -1
i="1"
x=$(ls -1 | wc -l)
while [ $i -lt $[$x+1] ]
do
	echo -n $i") "; ls -1 | head -$i | tail -1
	i=$[$i+1]
done


read -p "Which menu item would you like to select? " choice

ls -1 | head -$choice | tail -1
echo has been logged out