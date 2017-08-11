#!/bin/bash
#------------------------------------------------------------------------------
fileToDelete="/var/db/MDM_CKSupportRequestsFromDaemon"
#------------------------------------------------------------------------------

echo "Attempting to delete the following file: /var/db/MDM_CKSupportRequestsFromDaemon"

if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then

	echo "/var/db/MDM_CKSupportRequestsFromDaemon exists."
	echo "Attempting to delete..."

	#If file exists then delete it
	rm -f /var/db/MDM_CKSupportRequestsFromDaemon

	#Verify that file was deleted
	if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
		echo "/var/db/MDM_CKSupportRequestsFromDaemon was not deleted."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "/var/db/MDM_CKSupportRequestsFromDaemon was deleted successfully."
		echo "Quitting."
		exit 0
	fi

else

	#If file doesn't exist then do nothing
	echo "/var/db/MDM_CKSupportRequestsFromDaemon doesn't exists."
	exit 0

fi
