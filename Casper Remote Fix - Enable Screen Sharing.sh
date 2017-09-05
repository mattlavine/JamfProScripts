#!/bin/bash

#See for more info: https://jamfnation.jamfsoftware.com/featureRequest.html?id=3585

defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool false
launchctl enable system/com.apple.screensharing.plist

#One Line Version:
#defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool false; launchctl enable system/com.apple.screensharing.plist