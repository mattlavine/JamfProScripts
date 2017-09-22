#!/bin/bash

# Enable Automatic OS and App Updates
/usr/bin/defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool TRUE
/usr/bin/defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool TRUE

# Set Time Zone to Automatic
/usr/bin/defaults write /Library/Preferences/com.apple.timezone.auto Active -bool TRUE

# Hide /opt folder created by Cisco AnyConnect
#if [ -d "/opt" ]; then
#	chflags hidden /opt
#fi
	
