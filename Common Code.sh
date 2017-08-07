#!/bin/sh

# Apple approved method for determining current logged in user
# See: https://macmule.com/2014/11/19/how-to-get-the-currently-logged-in-user-in-a-more-apple-approved-way/
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
