#!/bin/bash

. ./editfile.sh

#placeholder value for testing
#logoutstatus[hello]="0"

#appends the log file whenever a file is logged in or out of the repository
log(){
	if [[ ${logoutstatus[$1]} -eq "1" ]]
	then
		echo $(ls -1q | head -$choice | tail -1) "was logged in by" $USER "at" $(date) >> log.txt
		read -p "Would you like to edit the file you just logged into? (yes/no)" editchoice
		if [[ "$editchoice" == "yes" || "$editchoice" == "Yes" || "$editchoice" == "YES" ]]; then
			fileedit
		elif [[ "$editchoice" == "no" || "$editchoice" == "No" || "$editchoice" == "NO" ]]; then
			return
		else
			echo "invalid user input"
		fi
	elif [[ ${logoutstatus[$1]} -eq "0" ]]
	then
		echo $(ls -1q | head -$choice | tail -1 >> log.txt) "was logged out by" $USER "at" $(date) >> log.txt
		read -p "Would you like to leave a message on what was edited? (yes/no)" messagechoice
		if [[ "$messagechoice" == "yes" || "$messagechoice" == "Yes" || "$messagechoice" == "YES" ]]; then
			read -p "please enter your message:" message
			echo "Logout message:"$message >> log.txt
		elif [[ "$messagechoice" == "no" || "$messagechoice" == "No" || "$messagechoice" == "NO" ]]; then
			echo "No logout message was set" >> log.txt
		else
			echo "invalid user input"
		fi
	fi
}

#function test
#log hello