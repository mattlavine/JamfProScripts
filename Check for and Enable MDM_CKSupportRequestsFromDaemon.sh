#!/bin/bash
#------------------------------------------------------------------------------
fileToCreate="/var/db/MDM_CKSupportRequestsFromDaemon"
#------------------------------------------------------------------------------

echo "Attempting to create the following file: /var/db/MDM_CKSupportRequestsFromDaemon"

if [ ! -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then

	echo "/var/db/MDM_CKSupportRequestsFromDaemon does not exist."
	echo "Attempting to create..."

	#If file doesn't exist then create it
	touch /var/db/MDM_CKSupportRequestsFromDaemon

	#Verify that file was created
	if [ ! -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
		echo "/var/db/MDM_CKSupportRequestsFromDaemon was not created."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "/var/db/MDM_CKSupportRequestsFromDaemon was created successfully."
		echo "Quitting."
		exit 0
	fi

else

	#If file exists then do nothing
	echo "/var/db/MDM_CKSupportRequestsFromDaemon already exists."
	exit 0

fi
