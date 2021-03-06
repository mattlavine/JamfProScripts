#!/bin/bash
#------------------------------------------------------------------------------
fileToCreate="$4"
#------------------------------------------------------------------------------

echo "Attempting to create the following file: $fileToCreate"

if [ ! -f $fileToCreate ]; then

	echo "$fileToCreate does not exist."
	echo "Attempting to create..."

	#If file doesn't exist then create it
	touch $fileToCreate

	#Verify that file was created
	if [ ! -f $fileToCreate ]; then
		echo "$fileToCreate was not created."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "$fileToCreate was created successfully."
		echo "Quitting."
		exit 0
	fi

else

	#If file exists then do nothing
	echo "$fileToCreate already exists."
	exit 0

fi
