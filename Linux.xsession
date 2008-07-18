#!/bin/bash

if [ ! -e $HOME/.p ]; then
    mkfifo $HOME/.p
fi

# This 'cat' keeps the xsession alive until killed
cat $HOME/.p & export XSESSION=$!

HOST=`hostname -s`

xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.xmodmaprc

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

xmonad &
sudo sh ${HOME}/config/scripts/dzen2.sh &

# Wait for xsession kill request
wait $XSESSION

