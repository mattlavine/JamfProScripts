#!/bin/bash
#------------------------------------------------------------------------------
fileToCreate="/var/db/MDM_CKSupportRequestsFromDaemon"
#------------------------------------------------------------------------------

echo "Attempting to create the following file: $fileToCreate"

if [ ! -f $fileToCreate ]; then

	echo "$fileToCreate does not exist."
	echo "Attempting to create..."

	#If file doesn't exist then create it
	touch $fileToCreate

	#Verify that file was created
	if [ ! -f $fileToCreate ]; then
		echo "File was not created."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "File was created successfully."
		echo "Quitting."
		exit 0
	fi

else

	#If file exists then do nothing
	echo "File already exists."
	exit 0

fi
