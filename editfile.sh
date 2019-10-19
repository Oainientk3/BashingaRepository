#!/bin/bash


#assume already logged file out?
#make all this a func and pass in the edit file from menu?
read -p "What file would you like to edit? " editfile

#if logfile exists 
if [[ -f log.txt ]]
then
	#if file exists
	if [[ -f $editfile ]]
	then
		if grep -q $USER log.txt | grep $editfile log.txt
		then
			nano $editfile
		fi
	else
		echo "That file doesn't exist."
	fi
else 
	# theres no log file
	echo "Nothing has been logged out yet."
fi


