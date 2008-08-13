#!/bin/sh

while true
do
    DATE=`date +'%a %b %d %H:%M'`

    HDDTEMP=`hddtemp /dev/sda | cut -d' ' -f3 | sed -e 's/[^0-9\.]//g'`

    FAN=`cat /sys/devices/platform/applesmc*/fan1_input`

    TEMP=`sensors | cut -s -d\+ -f2 | sort | tail -n 1 | sed -e 's/[^0-9\.]//g'`

    ETH0=`/sbin/ifconfig eth0|grep 'addr:[0-9]'|sed 's/^.*addr\:\([^ ]*\).*$/\1/'`

    echo ETH0 $ETH0 FAN $FAN HDD ${HDDTEMP}C CPU ${TEMP}C $DATE ' '

    sleep 5
done | dzen2 -fn fixed -bg '#3f3f3f' -fg '#dcdcdc' -ta r
