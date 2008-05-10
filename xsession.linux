#!/bin/bash

HOST=`hostname -s`

xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.internal

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

xmonad
