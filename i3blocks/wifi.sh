#!/bin/bash
INTERFACE="wlo1"

SSID=$(iw dev $INTERFACE link | grep 'SSID' | awk -F: '/SSID/ { print $NF }')

QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

echo "$SSID ($QUALITY%)" # full text
echo "$SSID ($QUALITY%)" # short text

# color
if [[ $QUALITY -ge 80 ]]; then
    echo "#00FF00"
elif [[ $QUALITY -lt 80 ]]; then
    echo "#FFF600"
elif [[ $QUALITY -lt 60 ]]; then
    echo "#FFAE00"
elif [[ $QUALITY -lt 40 ]]; then
    echo "#FF0000"
fi
