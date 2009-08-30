#!/bin/sh

#
# This script is to provide internet access to wired network (eth0)
# through my wifi interface (wlan0)
#
# It setups IP, ARP forwarding and DHCP request relays so that devices
# connected through wired network (eth0) would appear in the same
# subnet as the wifi (wlan0).
#
# Use "aptitude install dhcp3-relay parprouted" to install necessary
# packages.
#

EXTIF=wlan0
SERVER=192.168.1.1 # dhcp server ip

INTIF=eth0
INTIP=192.168.1.100 # ip that is not in dhcp range

function enable()
{
    # enable internal interface with /32 mask
    ifconfig $INTIF inet $INTIP netmask 255.255.255.255 up

    # enable ip, arp forwarding
    sysctl net.ipv4.conf.$EXTIF.proxy_arp=1
    sysctl net.ipv4.conf.$INTIF.proxy_arp=1
    sysctl net.ipv4.ip_forward=1

    # start parprouted daemon
    parprouted $EXTIF $INTIF

    # start dhcp relay
    dhcrelay3 -i $INTIF -i $EXTIF $SERVER
}

function disable()
{
    pkill dhcrelay3
    pkill parprouted
    sysctl net.ipv4.ip_forward=0
    sysctl net.ipv4.conf.$INTIF.proxy_arp=0
    sysctl net.ipv4.conf.$EXTIF.proxy_arp=0
    ifconfig $INTIF down
}

enable
