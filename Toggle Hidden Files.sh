#!/bin/sh
# This script toggles whether the Finder shows hidden files.

USERNAME=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

if [[ $(su $USERNAME -c 'defaults read com.apple.finder AppleShowAllFiles') = "NO" ]]; then
	su $USERNAME -c 'defaults write com.apple.finder AppleShowAllFiles YES'
	echo "Hidden files are now shown."
else
	su $USERNAME -c 'defaults write com.apple.finder AppleShowAllFiles NO'
	echo "Hidden files are now hidden."
fi

killall Finder
#killall Dock

exit 0
