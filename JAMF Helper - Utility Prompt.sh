#!/bin/bash

jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
title="$4"
description="$5"
icon="$6"
button1="$7"



"$jamfHelper" -windowType utility -title "$title" -description "$description" -icon "$icon" -button1 "$button1" -defaultButton 1