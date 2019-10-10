#!/bin/bash

#placeholder value for testing
logoutstatus[1]="0"

#appends the log file whenever a file is logged in or out of the repository
log () {
	if [ ${logoutstatus[$1]} -eq "1" ]
	then
		echo $1 "was logged in by" $USER "at" $(date) >> log.txt
	elif [ ${logoutstatus[$1]} -eq "0" ]
	then
		echo $1 "was logged out by" $USER "at" $(date) >> log.txt
	fi
}

#function test
log 1