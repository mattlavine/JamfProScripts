#!/bin/bash

if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
	echo "File exists."
	echo "Deleting file."
	rm -f /var/db/MDM_CKSupportRequestsFromDaemon
	if [ -f /var/db/MDM_CKSupportRequestsFromDaemon ]; then
		echo "File was not deleted..."
	else
		echo "File was deleted..."
	fi
else
	echo "File doesn't exist."
fi