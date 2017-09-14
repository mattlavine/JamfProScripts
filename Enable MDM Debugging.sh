#!/bin/bash

# MDM Logging
defaults write /Library/Preferences/com.apple.MCXDebug debugOutput -2
defaults write /Library/Preferences/com.apple.MCXDebug collateLogs 1
touch /var/db/MDM_EnableDebug
touch /var/db/MDM_CKSupportRequestsFromDaemon

# Enable APNS Logging
defaults write /Library/Preferences/com.apple.apsd APSWriteLogs -bool TRUE
defaults write /Library/Preferences/com.apple.apsd APSLogLevel -int 7
killall apsd

# Disable APNS Logging
#defaults write /Library/Preferences/com.apple.apsd APSWriteLogs -bool FALSE
#defaults delete /Library/Preferences/com.apple.apsd APSLogLevel
#killall apsd