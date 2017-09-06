#!/bin/bash

# STEPS FOR SCRIPT
# 1) 
# 2)
# 3)
# 4)
# 5)

# See here for more information: https://support.apple.com/en-us/HT203998



user="macadmin"
homePath=`eval echo "~$user"`
newHomePath="/private/var/$user"
userRealName=`dscl . -read $homePath dsAttrTypeStandard:RealName | sed 's/RealName://g' | tr '\n' ' ' | sed 's/^ *//;s/ *$//'`
userSharePoint="/SharePoints/$userRealName's Public Folder"

# Get Home Directory path of User

echo "Home Path of '$user' is '$homePath'"


#Check if user is in /Users/ folder


#Check if IsHidden has already been set
dscl . -read `eval echo "~$user"` IsHidden

# Set specified User account to be Hidden
#dscl . create $homePath IsHidden 1

#

# Move user's home folder
#This command moves the home directory of "$user" to /private/var, a hidden directory:
#	mv /Users/$user /private/var/$user
echo "Attempting to move home folder of '$user' from '$homePath' to '$newHomePath'"

#mv $homePath $newHomePath

#This command updates the user record of "$user" with the new home directory path in /private/var:
#sudo dscl . -create /Users/$user NFSHomeDirectory /private/var/$user

echo "Attempting to update the user record of '$user' with the new home directory path in '$newHomePath'"
#dscl . -create $homePath NFSHomeDirectory $newHomePath

# 
echo "Attempting to remove the Public Folder share point for the user with the long name '$userRealName'"
#dscl . -delete $userSharePoint

