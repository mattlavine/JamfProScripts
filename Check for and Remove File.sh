#!/bin/bash
#------------------------------------------------------------------------------
fileToDelete="$4"
#------------------------------------------------------------------------------

echo "Attempting to delete the following file: $fileToDelete"

if [ -f $fileToDelete ]; then

	echo "$fileToDelete exists."
	echo "Attempting to delete..."

	#If file exists then delete it
	rm -f $fileToDelete

	#Verify that file was deleted
	if [ -f $fileToDelete ]; then
		echo "$fileToDelete was not deleted."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "$fileToDelete was deleted successfully."
		echo "Quitting."
		exit 0
	fi

else

	#If file doesn't exist then do nothing
	echo "$fileToDelete doesn't exists."
	exit 0

fi
