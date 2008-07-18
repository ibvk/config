#!/bin/bash

echo 1  > /sys/devices/platform/applesmc*/fan1_manual
echo $1 > /sys/devices/platform/applesmc*/fan1_output

