#!/bin/sh

while true
do
    STATUS=

    DATE=`date +'%A %b %d %H:%M'`
    test -n "$DATE" && STATUS="$DATE $STATUS"

    HDDTEMP=`hddtemp /dev/sda | cut -d' ' -f3 | sed -e 's/[^0-9\.]//g'`
    test -n "$HDDTEMP" && STATUS="HDD $HDDTEMP $STATUS"

    FAN=`cat /sys/devices/platform/applesmc*/fan1_input`
    test -n "$FAN" && STATUS="FAN $FAN $STATUS"

    TEMP=`sensors | cut -s -d\+ -f2 | sort | tail -n 1 | sed -e 's/[^0-9\.]//g'`
    test -n "$TEMP" && STATUS="BOARD $TEMP $STATUS"

    ETH0=`/sbin/ifconfig eth0|grep 'addr:[0-9]'|sed 's/^.*addr\:\([^ ]*\).*$/\1/'`
    test -n "$ETH0" && STATUS="ETH $ETH0 $STATUS"

    WLAN0=`/sbin/ifconfig wlan0|grep 'addr:[0-9]'|sed 's/^.*addr\:\([^ ]*\).*$/\1/'`
    test -n "$WLAN0" && STATUS="WLAN $WLAN0 $STATUS"

    echo "$STATUS"
    sleep 5
done
