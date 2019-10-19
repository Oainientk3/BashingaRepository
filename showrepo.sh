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
	echo "Would you like to select a directory within the one you are currently in ($PWD), navigate to a different directory, or make and enter a directory within the one you are in currently?"
	select action in "Navigate current location" "Navigate from a different directory" "Make a new directory" "Quit from current menu"
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
				echo "returning to repo location menu"
				echo "1 - Navigate current location, 2 - Navigate to a different directory, 3 - Make a new directory in your current location, 4 - Quit current menu"
				;;
			"Navigate from a different directory")
				read -p "please input the full path location to the directory you want to work in:" newlocation
				cd .
				cd $newlocation
				echo "You have changed the working directory to" $newlocation
				echo "returning to repo location menu"
				echo "1 - Navigate current location, 2 - Navigate to a different directory, 3 - Make a new directory in your current location, 4 - Quit current menu"
				;;
			"Make a new directory")
				read -p "What would you like the directory to be called? " newrepo
				mkdir $newrepo
				cd $newrepo
				echo "You are now in $PWD"
				echo "returning to repo location menu"
				echo "1 - Navigate current location, 2 - Navigate to a different directory, 3 - Make a new directory in your current location, 4 - Quit current menu"
				;;
			"Quit from current menu")
				break
				;;
			*)
				echo "That is an invalid input"
				echo "returning to repo location menu"
				echo "1 - Navigate current location, 2 - Navigate to a different directory, 3 - Make a new directory in your current location, 4 - Quit current menu"
				;;
		esac
	done
}