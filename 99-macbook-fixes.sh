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
        modprobe -r ide_cd_mod
    fi
}

function enable_powertop_suggestions
{
    mount -o remount,noatime /
    echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
}

function do_resume
{
    echo "macbook-fixes: executing resume steps"
    fix_hdd_load_cycles
    increase_fan_speed
    disable_cdrom
    enable_powertop_suggestions
}

function do_bootup
{
    echo "macbook-fixes: executing bootup steps"
    fix_hdd_load_cycles
    increase_fan_speed
    disable_cdrom
    enable_powertop_suggestions
}

if test "$1" == "resume"; then
    do_resume
elif test "$1" == "bootup"; then
    do_bootup
else
    echo "macbook-fixes: ignoring action $1"
fi
