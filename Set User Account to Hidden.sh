#!/bin/bash

#---------------------------------------------------------------------------
# See here for more information: https://support.apple.com/en-us/HT203998
#--------------------------------------------------------------------------- 
#---------------------------------------------------
#Variables
#---------------------------------------------------
#--------------------
# REQUIRED VARIABLES
#--------------------
# Username of the user the script is running against
# Must be in Quotes
username="";

# 0 = Not Hidden; 1 = Hidden;
# setIsHidden = 1; Hide the user account
# setIsHidden = 0; Don't hide the user account
# setIsHidden = Anything Else; Invalid
# Must be in Quotes
setIsHidden="";

# 0 = Do Not Move User's Home Folder; 1 = Move User's Home Folder
# Must be in Quotes
moveUserFolder="";

#--------------------
# OPTIONAL VARIABLES
#--------------------
# MUST BE SET IF 'moveUserFolder' = '1'.
# Folder to move the user's home folder to
# Must be in Quotes
newUserHomePathFolder="";
#---------------------------------------------------

#------------------------------------------------------------------------------------------------------
# DO NOT MODIFY BELOW LINE
#------------------------------------------------------------------------------------------------------

#---------------------------------------------------
# USER-INPUT VARIABLE SAFEGUARD CHECKS
#---------------------------------------------------
echo "----------------------------------------------------"
echo "--------USER-INPUT VARIABLE SAFEGUARD CHECKS--------"
echo "----------------------------------------------------"
#--------------------------
# $username
#--------------------------

echo "'username' is set to '$username'."

# Safeguard against running without specifying a user to run against
if [ "$username" = "" ]; then
  echo "Error: 'username' must have a value." 
  echo "Exiting..."
  exit 1
fi

# Check that username is valid
if !(dscl . -read /Users/"$username" >/dev/null 2>&1); then
  echo "Error: User with username of '$username' doesn't exist."
  echo "Exiting..."
  exit 1
fi

#--------------------------

#--------------------------
# $setIsHidden
#--------------------------

echo "'setIsHidden' is set to '$setIsHidden'."
if [ "$setIsHidden" = "" ]; then
  echo "'setIsHidden' was left blank. Treating as '0'."
  setIsHidden="0"
fi

# Check that setIsHidden is set and is valid
if [ "$setIsHidden" != "0" -a "$setIsHidden" != "1" ]; then
  echo "Error: 'setIsHidden' must be set to either '0' or '1'." 
  echo "Exiting..."
  exit 1
fi

#--------------------------

#--------------------------
# $moveUserFolder
#--------------------------

echo "'moveUserFolder' is set to '$moveUserFolder'."

if [ "$moveUserFolder" = "" ]; then
  echo "'moveUserFolder' was left blank. Treating as '0'."
  moveUserFolder="0"
fi

# Verify that 'moveUserFolder' is set to either '0' or '1'.
if [ "$moveUserFolder" != "0" -a "$moveUserFolder" != "1" ]; then
  echo "Error: 'moveUserFolder' must be set to either '0' or '1'." 
  echo "Exiting..."
  exit 1
fi

#--------------------------

#--------------------------
# $newUserHomePathFolder
#--------------------------

# If 'moveUserFolder' is equal to anything but "1" then 'newUserHomePathFolder' doesn't matter.
if [ "$moveUserFolder" = "1" ]; then
  # Make sure that '$newUserHomePathFolder' is not blank
  echo "'newUserHomePathFolder' is set to '$newUserHomePathFolder'."
  if [ "$newUserHomePathFolder" = "" ]; then
    echo "Error: newUserHomePathFolder must have a value." 
    echo "Exiting..."
    exit 1
  fi

  #Make sure that $newUserHomePathFolder is valid and exists.
  if [ ! -d "$newUserHomePathFolder" ]; then
    echo "Error: $newUserHomePathFolder does not exist."
    echo "Exiting..."
    exit 1
  fi
else
  echo "'newUserHomePathFolder' doesn't matter because 'moveUserFolder' is not equal to '1'."
fi

#--------------------------
echo "----------------------------------------------------"
echo ""
#---------------------------------------------------

#---------------------------------------------------
# SCRIPT VARIABLES
#---------------------------------------------------
echo "----------------------------------------------------"
echo "------------------SCRIPT VARIABLES------------------"
echo "----------------------------------------------------"
#--------------------------
# queryUserHomePath
#--------------------------
# '$queryUserHomePath' is  used to query dscl for data on 'username'.
queryUserHomePath="/Users/$username"
echo "'$queryUserHomePath' is being used to query dscl for data on '$username'."

#--------------------------
# currentHomePath
#--------------------------
# Pointless if 'moveUserFolder is not '1'.
if [ "$moveUserFolder" = "1" ]; then
  # Get the home path for the desired user
  currentHomePath=`dscl . -read $queryUserHomePath NFSHomeDirectory | cut -d' ' -f2`
  echo "Home Path of '$username' is currently set to '$currentHomePath'."
fi

#--------------------------
# newHomePath
#--------------------------
# Pointless if 'moveUserFolder is not '1'.
if [ "$moveUserFolder" = "1" ]; then
  # Ensure that $newUserHomePathFolder is a legitimate folder path in case variable is missing an ending '/' character in folder path
  # Add a '/' to the end of 'newUserHomePathFolder' if needed so that it concatenates with 'username' properly to form a valid directory
  folderSlashCheckCharacter="${newUserHomePathFolder: -1}"
  tempNewUserHomePathFolder=$newUserHomePathFolder
  if [ "$folderSlashCheckCharacter" != "/" ]; then
    echo "Last character is of 'newUserHomePathFolder' is not '/'. Correcting..."
    # Add the '/' to the folder path if it was not given
    newUserHomePathFolder=$newUserHomePathFolder"/"
    echo "Corrected '$tempNewUserHomePathFolder' to '$newUserHomePathFolder'"
  fi

  # Concatenate 'newHomePath' into a valid directory
  newHomePath="$newUserHomePathFolder""$username"

  # Check if directories are the same
  if [ -d "$newHomePath" ]; then
    echo "Error: '$newHomePath' already exists. Folder will not be moved."
    moveUserFolder="0"
  fi
  
  #echo "Home Path of '$username' will be changed from '$currentHomePath' to '$newHomePath' if needed."
fi
#--------------------------
# updateIsHidden
#--------------------------
if [ "$setIsHidden" = "0" ]; then
  #Set IsHidden to 0; Not Hidden
  echo "IsHidden will be set to '0' for '$username'. '$username' will not be hidden."
  
elif [ "$setIsHidden" = "1" ]; then
  #Set IsHidden to 1; Hidden
  echo "IsHidden will be set to '1' for '$username'. '$username' will be hidden."
else 
  #IsHidden Not Set; Not Hidden
  echo "Error: Something went wrong with setIsHidden."
  echo "Exiting..."
  exit 1
fi

#Check if IsHidden user attribute has already been set and echo the value
currentIsHidden=`dscl . -read $queryUserHomePath IsHidden | cut -d' ' -f2`
echo "The current value of 'IsHidden' is '$isHidden'."

if [ "$currentIsHidden" = "" ]; then
  echo "User does not have the 'IsHidden' attribute set. Treating as '0'."
  currentIsHidden="0"
fi

if [ "$setIsHidden" != "$currentIsHidden" ]; then
  updateIsHidden="1"
elif [ "$setIsHidden" = "$currentIsHidden" ]; then 
  #Both values are the same; Do nothing
  updateIsHidden="0"
else
  echo "Error: Something went wrong with 'updateIsHidden'."
  echo "Exiting..."
  exit 1
fi

#--------------------------

#--------------------------
# moveUserFolder
#--------------------------
if [ "$moveUserFolder" = "1" ]; then
  #Check if user's home folder is already in "$newUserHomePathFolder"
  if [ "$currentHomePath" = "$newHomePath" ]; then
    echo "'currentHomePath' and 'newHomePath' are the same so nothing will be moved."
    moveUserFolder="0"
  fi
fi
#--------------------------
# userSharePoint
#--------------------------

#userRealName=`dscl . -read $queryUserHomePath RealName | sed 's/RealName://g' | tr '\n' ' ' | sed 's/^ *//;s/ *$//'`
#echo "Real Name of '$username' is '$userRealName'."
#userSharePoint="/SharePoints/$userRealName's Public Folder"
#echo $userSharePoint

echo "----------------------------------------------------"
echo ""
#---------------------------------------------------

#------------------------------------------------------------------------------------------------------
# THE ACTUAL WORK
#------------------------------------------------------------------------------------------------------
echo "----------------------------------------------------"
echo "------------------THE ACTUAL WORK-------------------"
echo "----------------------------------------------------"

if [ "$updateIsHidden" = "1" ]; then
  # Set specified user account to be Hidden
  echo "Attempting to set 'IsHidden' key for '$username' to hide the user account."
  echo $(dscl . create $queryUserHomePath IsHidden $setIsHidden)
else
    echo "'updateIsHidden' is equal to 0. Doing nothing..."
fi

if [ "$moveUserFolder" = "1" ]; then
  #This command moves the home directory of "$username" to $newUserHomePathFolder:
  echo "Attempting to move home folder of '$username' from '$currentHomePath' to '$newHomePath'."
  echo $(mv $currentHomePath $newHomePath)

  #This command updates the user record of "$username" with the new home directory path in $newUserHomePathFolder:
  echo "Attempting to update the user record of '$username' with the new home directory path of '$newHomePath'."
  echo $(dscl . -create $queryUserHomePath NFSHomeDirectory $newHomePath)
  
else
  echo "'moveUserFolder' is equal to 0. Doing nothing..."
  echo "Skipping Update Record"
fi

#echo "Attempting to remove the Public Folder share point for the user with the long name '$userRealName'"
#echo $(dscl . -delete $userSharePoint)

echo "----------------------------------------------------"
echo ""

