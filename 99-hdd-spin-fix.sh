#!/bin/sh
hdparm -B 255 /dev/sda
hdparm -S 0 /dev/sda

