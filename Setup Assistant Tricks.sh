#!/bin/bash

# Run Setup Assistant in user's session for debugging
# MUST BE RUN AS ROOT
/System/Library/CoreServices/Setup\ Assistant.app/Contents/MacOS/Setup\ Assistant -MBDebug

# Needs to be tested:
/var/db/.AppleDebugServerConfig
/var/db/.AppleDebugServerConfig.plist
/var/db/.MBFakeComplexRecovery
/var/db/.MBSkipWiFiSetupIfPossible
/var/db/.MBFakeComplexRecovery
/var/db/.AppleCustomMac
/var/db/.AppleSetupDone
/var/db/.AppleSetupDebugInitialization
.AppleSetupDebugUser
-MBDebug
-MiniBuddyYes
-MigrationBuddyYes
-EOSBuddyYes
-ResumeBuddyYes
