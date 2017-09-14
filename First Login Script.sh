#!/bin/bash

# Get the logged in user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Show Bluetooth in menu bar
sudo -u "$loggedInUser" open "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# Show battery percentage
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.menuextra.battery ShowPercent "YES"

# Desktop Settings
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool TRUE
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowHardDrivesOnDesktop -bool TRUE
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowMountedServersOnDesktop -bool TRUE
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool TRUE

# Finder Window Settings
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowPathbar -bool TRUE
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowSidebar -bool TRUE
sudo -u "$loggedInUser" /usr/bin/defaults write com.apple.finder ShowStatusBar -bool TRUE

# Restart Menu Bar to Show Battery Percent
sudo -u "$loggedInUser" killall SystemUIServer
