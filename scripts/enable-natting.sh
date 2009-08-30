#!/bin/sh
INTIF="eth0"
EXTIF="wlan0"
EXTIP="`/sbin/ifconfig $EXTIF | grep 'inet addr' | awk '{print $2}' | sed -e 's/.*://'`"
/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe nf_conntrack
/sbin/modprobe nf_conntrack_ftp
/sbin/modprobe nf_conntrack_irc
/sbin/modprobe iptable_nat
/sbin/modprobe nf_nat_ftp
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
iptables -P INPUT ACCEPT
iptables -F INPUT 
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT 
iptables -P FORWARD DROP
iptables -F FORWARD 
iptables -t nat -F
iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
