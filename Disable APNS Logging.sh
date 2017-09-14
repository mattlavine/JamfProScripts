#!/bin/bash

defaults write /Library/Preferences/com.apple.apsd APSWriteLogs -bool FALSE

defaults delete /Library/Preferences/com.apple.apsd APSLogLevel

killall apsd