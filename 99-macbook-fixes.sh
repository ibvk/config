#!/bin/bash

#
# Fixes for my macbook
#
# Link this file into /etc/pm/sleep.d.  You MUST change its owner as root.
# Also, invoke this file from /etc/rc.local with "bootup" as the argument.
#

function fix_hdd_load_cycles
{
    hdparm -B 254 /dev/sda
}

function fix_fn_key_behavior
{
    echo -n 0x02 > /sys/module/hid_apple/parameters/fnmode
}

function increase_fan_speed
{
    lsmod|grep applesmc
    if test $? -ne 0
    then
        modprobe applesmc
    fi

    FANMIN='/sys/devices/platform/applesmc.768/fan1_min'
    if test -f "$FANMIN"
    then
        echo 3000 > $FANMIN
    fi
}

function disable_cdrom
{
    lsmod|grep ide_cd_mod
    if test $? -ne 0
    then
        modprobe -r ide_cd_mod cdrom
    fi
}

function enable_powertop_suggestions
{
    mount -o remount,noatime /
    echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
}

function unload_uvcvideo_module
{
    modprobe -r uvcvideo
}

function load_uvcvideo_module
{
    modprobe uvcvideo
}

function load_isight_firmware
{
    INFO=`lsusb -d 05ac:8300`
    BUSID=`echo $INFO|cut -f2 -d' '`
    DEVID=`echo $INFO|cut -f4 -d' '|sed 's/://'`
    if [ -n "$BUSID" -a -n "$DEVID" ]
    then
	/home/bvk/config/bin/ift-load -f /home/bvk/config/bin/isight.fw -b $BUSID -d $DEVID
    fi
}

function stop_wifi
{
    echo ifdown wlan0
    ifdown wlan0
}

function start_wifi
{
    echo ifup wlan0
    ifup wlan0
}

function do_suspend
{
    unload_uvcvideo_module
    stop_wifi
}

function do_resume
{
    echo "macbook-fixes: executing resume steps"
    fix_hdd_load_cycles
    increase_fan_speed
    disable_cdrom
    enable_powertop_suggestions
    load_isight_firmware
    load_uvcvideo_module
    start_wifi
}

function do_bootup
{
    echo "macbook-fixes: executing bootup steps"
    fix_fn_key_behavior
    fix_hdd_load_cycles
    increase_fan_speed
    disable_cdrom
    enable_powertop_suggestions
    load_isight_firmware
}

if test "$1" == "resume"; then
    do_resume
elif test "$1" == "bootup"; then
    do_bootup
elif test "$1" == "suspend"; then
    do_suspend
else
    echo "macbook-fixes: ignoring action $1"
fi
