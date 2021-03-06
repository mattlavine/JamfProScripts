#!/bin/bash

# $4 = DOWNLOAD_URL="https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
# $5 = DMG_PATH="/tmp/Google Chrome.dmg"
# $6 = DMG_VOLUME_PATH="/Volumes/Google Chrome/"
# $7 = APP_NAME="Google Chrome.app"
# $8 = APP_PROCESS_NAME="Google Chrome"


DOWNLOAD_URL="$4"
DMG_PATH="$5"
DMG_VOLUME_PATH="$6"
APP_NAME="$7"
APP_PATH="/Applications/$APP_NAME"
APP_PROCESS_NAME="$8"
APP_INFO_PLIST="Contents/Info.plist"
APP_VERSION_KEY="CFBundleShortVersionString"
APP_PERMISSION_USER="root"
APP_PERMISSION_GROUP="wheel"

if pgrep "$APP_PROCESS_NAME" &>/dev/null; then
  printf "Error - %s is currently running!" "$APP_PROCESS_NAME"
else
  if [ -d "$APP_PATH" ]; then
    rm -rf "$APP_PATH"
  fi
  curl --retry 3 -L "$DOWNLOAD_URL" -o "$DMG_PATH"
  hdiutil attach -nobrowse -quiet "$DMG_PATH"
  version=$(defaults read "$DMG_VOLUME_PATH/$APP_NAME/$APP_INFO_PLIST" "$APP_VERSION_KEY")
  printf "Installing $APP_PROCESS_NAME version %s" "$version"
  ditto -rsrc "$DMG_VOLUME_PATH/$APP_NAME" "$APP_PATH"
  chown -R "$APP_PERMISSION_USER":"$APP_PERMISSION_GROUP" "$APP_PATH"
  hdiutil detach -quiet "$DMG_PATH"
  rm "$DMG_PATH"
fi
