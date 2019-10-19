#!/bin/bash



createArchive() 
{
	read -p "What would you like to call this archive? " dirname
	mkdir $dirname

	# copy files into this dir, excluding surface level hidden files, mainly to avoid getting the .git folders in git repos
	cp -r ./* $dirname

	#create archive of the file and removes directory the archive is made from
	tar --remove-files -zcf $dirname.tar $dirname

	#delete original
	#obsolete code
	#rm -r $dirname
}


openArchive()
{
	read -p "What tar file would you like to extract? (dont add .tar) " tarfile

	#if the tar file exists
	if [ -f $tarfile.tar ]
	then
		tar -xvf $tarfile.tar
	else
		echo "There is no tar file with that name."
	fi
}

#test
#createArchive 

#test
#openArchive

#zip menu added for better user functionality and clarity in startMenu function
#added during testing phase by Lucas

zipMenu(){
	echo "Would you like to create an archive, open an existing archive, or quit?"
	select action in "Create archive" "Open archive" "Quit"
	do
		case ${action} in
			"Create archive" )
				createArchive
				echo "returning to archiving menu"
				echo "1 - Create archive, 2 - Open archive, 3 - Quit"
				;;
			"Open archive")
				openArchive
				echo "returning to archiving menu"
				echo "1 - Create archive, 2 - Open archive, 3 - Quit"
				;;
			"Quit")
				break
				;;
			*)
				echo "invalid input"
				echo "returning to archiving menu"
				echo "1 - Create archive, 2 - Open archive, 3 - Quit"
				;;
		esac
	done
}