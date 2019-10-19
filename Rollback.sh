#!/bin/bash

#####Important chcek if the directorys are correct####

Rollback()
{
#This allows the user to rollback to a previous version.
	ls -d -- Backups/
	read -p "Which version/file would you like to Rollback " choice

	cp -r -a $choice/ ./Maindirectory
}