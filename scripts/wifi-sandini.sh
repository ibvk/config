#!/bin/bash

IFACE=wlan0
ESSID=sandini
MODE=Managed
KEY="D1B6-8B34-B1"

iwconfig $IFACE essid $ESSID mode $MODE key restricted $KEY && sleep 1

dhclient $IFACE
