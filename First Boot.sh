#!/bin/bash

# Define variables
ln="/bin/ln"
rm="/bin/rm"

#####################################################
# \# \# Baseline initial System Setup \#
# \#
#####################################################

# Make a shortcut links to Network Utility, Directory Utility, Screen Sharing, Raid Utility, and Archive Utility under "Utilities" Folder
ln -s /System/Library/CoreServices/Applications/Network\ Utility.app /Applications/Utilities/Network\ Utility.app
ln -s /System/Library/CoreServices/Applications/Directory\ Utility.app /Applications/Utilities/Directory\ Utility.app
ln -s /System/Library/CoreServices/Applications/Screen\ Sharing.app /Applications/Utilities/Screen\ Sharing.app
ln -s /System/Library/CoreServices/Applications/RAID\ Utility.app /Applications/Utilities/RAID\ Utility.app
ln -s /System/Library/CoreServices/Applications/Archive\ Utility.app /Applications/Utilities/Archive\ Utility.app
ln -s /System/Library/CoreServices/Applications/About\ This\ Mac.app /Applications/Utilities/About\ This\ Mac.app
ln -s /System/Library/CoreServices/Applications/Storage\ Management.app /Applications/Utilities/Storage\ Management.app
ln -s /System/Library/CoreServices/Software\ Update.app /Applications/Utilities/Software\ Update.app
ln -s /System/Library/CoreServices/Ticket\ Viewer.app /Applications/Utilities/Ticket\ Viewer.app
ln -s /System/Library/CoreServices/Siri.app /Applications/Utilities/Siri.app
ln -s /System/Library/CoreServices/Certificate\ Assistant.app /Applications/Utilities/Certificate\ Assistant.app
ln -s /System/Library/CoreServices/Applications/System\ Image\ Utility.app /Applications/Utilities/System\ Image\ Utility.app
