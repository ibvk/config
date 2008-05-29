#!/bin/bash

HOST=`hostname -s`

xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.xmodmaprc

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

xmonad
