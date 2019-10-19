#!/bin/bash

. ./logmaker.sh
. ./showrepo.sh

#tests if a file (sorted position of which is referred to by the first parameter) is of wanted file type (second parameter)
testfiletype(){
	if [ $(ls -lq | head -$[$1+1] | tail -1 | head -c 1) = "$2" ]
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
	while [ $i -lt $[$(ls -1q | wc -l)+1] ]
	do
		if [ $(testfiletype $i -) -eq "1" ]
		then
			echo -n $i") "; ls -1q | head -$i | tail -1
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
			ls -1q | head -$choice | tail -1
			logoutstatus[$choice]="1" 
			log "$choice"
			;;
		"1")
			echo -n "You have logged out of "
			ls -1q | head -$choice | tail -1 
			logoutstatus[$choice]="0"
			log "$choice"
			;;
		*)
			echo "logout status of that item is unknown"
			;;
	esac
}



#STARTING MENU

#use select for top menu choices!!

fileMenu(){
	echo "Hello," $USER "what action would you like to perform?"
	select action in "Add file" "Edit file" "View project log" "Quit from current menu"
	do 
		case ${action} in
			"Add file")
				echo "You have chose to add a file." 
				read -p "What is the name of the file you want to create? " filetocreate
				touch $filetocreate
				echo $filetocreate "has been created"
				echo "returning to file menu"
				echo "Enter 1 to add a file, 2 to edit a file, 3 to view the project log, and 4 to quit the current menu"
				;;
			"Edit file")
				echo "You have chose to edit a file."
				filedisplay
				logFileOut
				echo "returning to file menu"
				echo "Enter 1 to add a file, 2 to edit a file, 3 to view the project log, and 4 to quit the current menu"
				;;
			"View project log")
				echo "You have chosen to view the project log"
				cat log.txt
				echo "returning to file menu"
				echo "Enter 1 to add a file, 2 to edit a file, 3 to view the project log, and 4 to quit the current menu"
				;;
			"Quit from current menu")
				break
				;;
			*)
				echo "That is not a valid action choice."
				echo "returning to top menu"
				echo "Enter 1 to add a file, 2 to edit a file, 3 to view the project log, and 4 to quit the current menu"
				;;
		esac
	done
}

startMenu(){
	echo "Would you like to change your working repository (currently $repo_location) or manage files?"
	select action in "Change repo" "Manage files" "Quit"
	do
		case ${action} in
			"Change repo")
				changeRepo
				echo "returning to start menu"
				echo "1 - Change repo, 2 - Manage files, 3 - Quit"
				;;
			"Manage files")
				fileMenu
				echo "returning to start menu"
				echo "1 - Change repo, 2 - Manage files, 3 - Quit"
				;;
			"Quit")
				break
				;;
			*)
				echo "That is not a valid option"
				echo "1 - Change repo, 2 - Manage files, 3 - Quit"
				;;
		esac
	done
}

startMenu