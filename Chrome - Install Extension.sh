#!/bin/bash

extenalExtensions="/Library/Application Support/Google/Chrome/External Extensions/"

if [ -d "$extenalExtensions" ] ; then
	
	#Runs if the External Extensions folder exists
	cd "$extenalExtensions"

	cat <<EOF >$4.json
	{
	"external_update_url": "https://clients2.google.com/service/update2/crx"
	}
EOF
	
else

	#Runs if the External Extension doesn't exist
	mkdir -p "$extenalExtensions"
	chown -R root:admin "/Library/Application Support/Google/"
	chmod -R 555 "/Library/Application Support/Google/"
	
	if [ -d "$extenalExtensions" ] ; then
	    
	    cd "$extenalExtensions"

		cat <<EOF >$4.json
		{
		"external_update_url": "https://clients2.google.com/service/update2/crx"
		}
EOF

	else    
	    echo "Policy could not be completed."
	fi
fi