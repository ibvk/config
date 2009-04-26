#!/bin/sh

STATUS=
# CELCIUS="\0342\0204\0203"
APPLESMC=`echo /sys/devices/platform/applesmc.???`

DATE=`date +'%A %b %d %l:%M'`
test -n "$DATE" && STATUS="$DATE "

HDDTEMP=`hddtemp /dev/sda | cut -d' ' -f3 | sed -e 's/[^0-9\.]//g'`
test -n "$HDDTEMP" && STATUS="HDD: $HDDTEMP$CELCIUS - $STATUS"

TEMP=`cat $APPLESMC/temp* | sort | tail -n 1 | cut -b1,2`
test -n "$TEMP" && STATUS="CPU: $TEMP$CELCIUS - $STATUS"

FAN=`cat $APPLESMC/fan1_input`
test -n "$FAN" && STATUS="FAN: $FAN - $STATUS"

ETH0=`/sbin/ifconfig eth0|grep 'addr:[0-9]'|sed 's/^.*addr\:\([^ ]*\).*$/\1/'`
test -n "$ETH0" && STATUS="ETH0: $ETH0 - $STATUS"

WLAN0=`/sbin/ifconfig wlan0|grep 'addr:[0-9]'|sed 's/^.*addr\:\([^ ]*\).*$/\1/'`
test -n "$WLAN0" && STATUS="WLAN0: $WLAN0 - $STATUS"

BATT=`acpi -b | cut -d, -f2`
test -n "$BATT" && STATUS="Battery:$BATT - $STATUS"

POWR=`acpi -a | cut -d: -f2 | cut -d- -f1 | tr [:lower:] [:upper:]`
test -n "$POWR" && STATUS="Power:$POWR - $STATUS"

echo -e "$STATUS"

