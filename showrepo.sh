#!/bin/bash
repo_location=./

#functions similarly to the displayfile function in menu.sh
#numbers and displays all repositories in the current directory
displayRepo(){
	j="1"
	while [[ $j -lt $[$(ls -pq | grep / | wc -l)+1] ]]; do
		echo -n $j") "
		ls -pq | grep / | head -$i | tail -1
		j=$[$j+1]
	done
}

#menu for changing working repo

changeRepo(){
	echo "Would you like to select a directory within the one you are currently in ($repo_location), or navigate to a different directory?"
	select action in "Navigate current location" "Navigate from a different directory" "Quit from current menu"
	do
		case $action in
			"Navigate current location" )
				echo "these are the directories within the current directory"
				displayRepo
				read -p "Which directory would you like to navigate to? " choicerepo
				#check the validity of user input
				if [[ "$choicerepo" -gt "0" && "$choicerepo" -lt "$j" ]]; then
					cd $(ls -pq | grep / | head -$choicerepo | tail -1)
					echo "You have changed the working directory to" $(ls -pq | grep / | head -$choicerepo | tail -1)
				else
					echo "That is an invalid input"
				fi
				echo "1 - navigate current location, 2 - navigate to a different directory, 3 - quit current menu"
				;;
			"Navigate from a different directory")
				read -p "please input the full path location to the directory you want to work in:" newlocation
				$repo_location=$newlocation
				cd .
				cd $repo_location
				echo "You have changed the working directory to" $repo_location
				echo "returning to repo location menu"
				echo "1 - navigate current location, 2 - navigate to a different directory, 3 - quit current menu"
				;;
			"Quit from current menu")
				break
				;;
			*)
				echo "That is an invalid input"\n"please select a valid option"\n"1 - navigate current location"\n"2 - navigate to a different directory"\n"3 - quit current menu"
				;;
		esac
	done
}