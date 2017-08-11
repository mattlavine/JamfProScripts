#!/bin/bash
#------------------------------------------------------------------------------
# This script is for deleting the files created by enabling MDM debugging.
#
# The following files are to be deleted:
#
#    /Library/Preferences/com.apple.MCXDebug
#    /var/db/MDM_EnableDebug
#    /var/db/MDM_CKSupportRequestsFromDaemon
#------------------------------------------------------------------------------

filesToDelete=(/Library/Preferences/com.apple.MCXDebug /var/db/MDM_EnableDebug /var/db/MDM_CKSupportRequestsFromDaemon)

for file in ${filesToDelete[@]}; do
  echo "Attempting to delete the following file: $file"

  if [ -f $file ]; then

  	echo "$file exists."
  	echo "Attempting to delete..."

  	#If file exists then delete it
  	rm -f $file

  	#Verify that file was deleted
  	if [ -f $file ]; then
  		echo "$file was not deleted."
  		echo "Quitting with Error 1"
  		exit 1
  	else
  		echo "$file was deleted successfully."
  		echo "Quitting."
  		exit 0
  	fi

  else

  	#If file doesn't exist then do nothing
  	echo "$file doesn't exist."
  	exit 0

  fi
done
