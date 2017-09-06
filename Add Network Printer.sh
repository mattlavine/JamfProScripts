#!/bin/bash

# --------------------
# Variable Definitions:
# --------------------
# $4 = Printer Name (No Spaces)
# $5 = Location of Printer
# $6 = Printing Protocol (LPD if Not Specified)
# $7 = IP Address of Printer
# $8 = Path to PPD File (With Spaces)
# --------------------

# --------------------
# Setting Variables:
# --------------------
  NAME=$4
  LOCATION=$5
  PROTOCOL=$6
  IP_ADDRESS=$7
  PPD=$8
# --------------------

# --------------------
# Default Protocol Check:
# --------------------
#Use LPD if no Print Protocol is specified
[[ -z "$PROTOCOL" ]] && PROTOCOL="lpd" 
# --------------------

echo "Printer Name: $NAME"
echo "Location:     $LOCATION"
echo "Protocol:     $PROTOCOL"
echo "IP Address:   $IP_ADDRESS"
echo "Path to PPD:  $PPD"
echo "Full Command: /usr/sbin/lpadmin -p $NAME -L "$LOCATION" -E -v $PROTOCOL://$IP_ADDRESS -P "$PPD" -o printer-is-shared=false"


/usr/sbin/lpadmin -p $NAME -L "$LOCATION" -E -v $PROTOCOL://$IP_ADDRESS -P "$PPD" -o printer-is-shared=false


