#!/bin/bash

#placeholder value for testing
#logoutstatus[hello]="0"

#appends the log file whenever a file is logged in or out of the repository
log () {
	if [ ${logoutstatus[$1]} -eq "1" ]
	then
		echo $(ls -1 | head -$choice | tail -1) "was logged in by" $USER "at" $(date) >> log.txt
	elif [ ${logoutstatus[$1]} -eq "0" ]
	then
		printf 
		echo $(ls -1 | head -$choice | tail -1 >> log.txt) "was logged out by" $USER "at" $(date) >> log.txt
	fi
}

#function test
#log hello