#!/bin/bash

USERNAME=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

source /Users/$USERNAME/.bash_profile