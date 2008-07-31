#!/bin/bash

if [ ! -e $HOME/.pipe ]; then
    mkfifo $HOME/.pipe
fi

# This 'cat' keeps the xsession alive until killed
cat $HOME/.pipe & export XSESSION=$!

HOST=`hostname -s`

xsetroot -solid '#3f3f3f'
xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.xmodmaprc

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

xmonad &
sudo sh ${HOME}/config/scripts/dzen2.sh &

# Wait for xsession kill request
wait $XSESSION

