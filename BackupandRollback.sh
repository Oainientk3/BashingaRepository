#!/bin/bash


ManualBackup()
{
#Below makes a mnaual backup
	read -p "What would you like to call this backup" backupname
 	makdir $dirname

 	cp -r ./Backups/$dirname
}



Rollback()
{
#This allows the user to rollback to a previous version.
	echo -p "Which version/file would you like to Rollback " choice
	for file in ../
	do
		if [[ -f $file ]]; then
			#statements
		fi



}