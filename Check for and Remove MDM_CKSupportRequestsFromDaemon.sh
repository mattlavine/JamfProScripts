#!/bin/bash

if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
	echo "File exists."
	echo "Attempting to delete file..."
	rm -f /var/db/MDM_CKSupportRequestsFromDaemon
	if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
		echo "File was not deleted."
		echo "Quitting with Error 1"
		exit 1
	else
		echo "File was deleted."
		echo "Quitting."
		exit 0
	fi
else
	echo "File doesn't exist."
	echo "Quitting."
	exit 0
fi
