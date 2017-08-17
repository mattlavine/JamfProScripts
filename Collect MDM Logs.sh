#!/bin/bash

#-------------------------------------------------------------------------------
# The purpose of this script is to collect logs from debugging MDM.
#
# This script does the following:
#	
#	(1) Creates a folder in /var/tmp for all the logs
#	(2) Copies the following files/folders:
#		(a) /var/log/jamf.log
#		(b) /Library/Logs/ManagedClient
#		(c) Log Files from Past 2 Days
#
#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Utility Variables
#----------------------------
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
currentDay=`date +%m-%d-%Y`
currentTime=`date +%H-%M-%S`
#----------------------------

#----------------------------
# Log Locations
#----------------------------
jamfLog="/var/log/jamf.log"
managedClientLogs="/Library/Logs/ManagedClient"
#----------------------------

#----------------------------
# MDM Log Folder Locations
#----------------------------
mdmLogFolderDate="/var/tmp/MDM-Logs-$loggedInUser-$currentDay-$currentTime"
#mdmLogFolderTime="$mdmLogFolderDate/$currentTime"
#----------------------------
echo $mdmLogFolderDate
#----------------------------
# PROGRAM STARTS HERE
#----------------------------

# Create the MDM Log folder that we wil copy all the logs to
#if [ ! -d "$mdmLogFolderDate" ]; then
#
#	mkdir "$mdmLogFolderDate"
#	mkdir "$mdmLogFolderTime"
#
#else
#
#	mkdir "$mdmLogFolderTime"
#
#fi
	
mkdir "$mdmLogFolderDate"

#Copy /Library/Logs/ManagedClient to folder
cp -R $managedClientLogs $mdmLogFolderDate

# Collect System Logs and Copy them
log collect --output $mdmLogFolderDate --last 7d --size 10000m

#sysdiagnose -b -d -q -f $mdmLogFolderDate


#rm -rf "$mdmLogFolderDate"
