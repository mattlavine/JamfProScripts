#!/bin/bash

jamf policy -trigger dockutil -verbose

cat > /tmp/dock <<EOF
#!/bin/bash

/usr/local/bin/dockutil --remove all --no-restart

#---------------------------------------------------------------------------------------------------------------------------------
/usr/local/bin/dockutil --add '/Applications/Launchpad.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Safari.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Mail.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Contacts.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Calendar.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Notes.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Reminders.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Maps.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Photos.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/Messages.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/FaceTime.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/iTunes.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/iBooks.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/App Store.app' --no-restart
/usr/local/bin/dockutil --add '/Applications/System Preferences.app' --no-restart

/usr/local/bin/dockutil --add '~/Downloads' --display folder --sort dateadded
#---------------------------------------------------------------------------------------------------------------------------------
EOF

chmod +x /tmp/dock

sudo -u $3 /tmp/dock

rm /tmp/dock



