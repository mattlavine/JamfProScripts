#!/bin/bash

DOWNLOAD_URL="https://download.mozilla.org/?product=firefox-latest&os=osx&lang=en-US"
DMG_PATH="/tmp/Firefox.dmg"
DMG_VOLUME_PATH="/Volumes/Firefox/"
APP_NAME="Firefox.app"
APP_PATH="/Applications/$APP_NAME"
APP_PROCESS_NAME="Firefox"
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
