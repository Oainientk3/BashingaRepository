#!/bin/bash

#. ./logmaker.sh
#. ./showrepo.sh

#BackupMenu.sh is included.

#tests if a file (sorted position of which is referred to by the first parameter) is of wanted file type (second parameter)
testfiletype(){
	if [ $(ls -l | head -$[$1+1] | tail -1 | head -c 1) = "$2" ]
	then
		echo "1"
		return "1"
	else
		echo "0"
		return "0"
	fi
}

#testfiletype 4 "d"


filedisplay(){
	echo These items are currently selectable:

	#incremental while loop to display all files in the working repository on separate lines, separated by numerical indicators
	#additionally initialises a variable corresponding to each file, which keeps track of whether the file is logged in or out
	#will not properly handle files with delimiter characters in their titles due to the parsing of ls -1
	i="1"
	while [ $i -lt $[$(ls -1 | wc -l)+1] ]
	do
		if [ $(testfiletype $i -) -eq "1" ]
		then
			echo -n $i") "; ls -1 | head -$i | tail -1
			if [ -z "${logoutstatus[$i]}" ]
			then
				logoutstatus[$i]=0
			fi
		fi
		i=$[$i+1]
	done
}


##put this into a function that can be called when tryiing to edit/logout a file is selected
#allows the user to select which file they want to log in/out of
#will be revised to allow for multiple options after selecting the file, in addition to log messages
logFileOut(){
	read -p "Which menu item would you like to select? " choice
	case ${logoutstatus[$choice]} in
		"0")
			echo -n "You have logged in to " 
			ls -1 | head -$choice | tail -1
			logoutstatus[$choice]="1" 
			;;
		"1")
			echo -n "You have logged out of "
			ls -1 | head -$choice | tail -1 
			logoutstatus[$choice]="0"
			;;
		*)
			echo "logout status of that item is unknown"
			;;
	esac
}


backup(){
##
#alllows to user to backup there work into a tar/zip file
#Currently doesn't work whilst I fix issue that 

	read -p "Pleasse select from the following options" choice
	case ${backupstatus[$choice]} in
		"0")
			echo -n "Backup your current work into tar"
			read -p 'Wheres is the file located' filelocation
			name=$(date '+%Y-%m-%d')
			tar -cvf "$name.zip" filelocation code
			backupstatus{$choice}="1"
			;;
		"1")
			echo -n "Backup your current work into a zip"
			read -p 'Wheres is the file located' filelocation
			name=$(date '+%Y-%m-%d')
			tar -cvf "$name.zip" code			
			backupstatus{$choice}="1"
			;;
		"2")
			echo -n "Restore your previous Backup (tar)"
			#option
			read -p 'Whats the file called' filename
			read -p 'Wheres is the file located' filelocation
			tar -xvf $filename.tar filelocation
			backupstatus{$choice}="1"
			;;
		*)
		echo "Invalid selection"
		;;
	esac
}





}
