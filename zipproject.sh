#!/bin/bash



createArchive() 
{
	read -p "What would you like to call this archive? " dirname
	mkdir $dirname

	# copy files into this dir
	cp -r ./ ../$dirname/ 

	#create archive of the file
	tar -zcvf $dirname.tar $dirname

	#delete original
	rm -r $dirname
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
createArchive 

#test
openArchive
