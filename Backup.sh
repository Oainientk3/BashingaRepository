#!/bin/bash

#####Important chcek if the directorys are correct####

ManualBackup()
{
#Below makes a mnaual backup
	read -p "What would you like to call this backup" backupname
 	makdir $dirname

 	cp -r ./ ./Backups/$dirname
}
