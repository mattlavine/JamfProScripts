#!/bin/bash

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

if test -e /Users/$loggedInUser/Library/Keychains/????????-????-????-????-????????????; then
    echo "Local Items Keychain was Found."
    echo "Removing Local Items Keychain..."
    sudo -u $loggedInUser rm -rf /Users/$loggedInUser/Library/Keychains/????????-????-????-????-????????????
    if test -e /Users/$loggedInUser/Library/Keychains/????????-????-????-????-????????????; then
        echo "Local Items Keychain was successfully removed."
        echo "Exiting..."
        exit 0
    else
        echo "Local Items keychain was not removed."
        echo "Exiting..."
        exit 1
    fi
else
    echo "Local Items Keychain was not found."
    echo "Exiting..."
    exit 0
fi
