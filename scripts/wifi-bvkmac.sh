#!/bin/bash

ifconfig eth0 down && \
wlanconfig ath0 destroy && \
wlanconfig ath create wlandev wifi0 wlanmode adhoc && \
iwconfig ath0 essid "bvkmac" channel 2 && sleep 5 && \
ifconfig ath0 inet 10.11.12.4 netmask 255.255.255.0 up && \
route add default gw 10.11.12.2 && \
echo 'nameserver 192.168.1.254' > /etc/resolv.conf
