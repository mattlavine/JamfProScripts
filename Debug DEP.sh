#!/bin/bash

defaults write /Library/Preferences/com.apple.MCXDebug debugOutput -2
defaults write /Library/Preferences/com.apple.MCXDebug collateLogs 1
touch /var/db/MDM_EnableDebug
touch /var/db/MDM_CKSupportRequestsFromDaemon