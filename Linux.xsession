#!/bin/bash

HOST=`hostname -s`

xsetroot -solid '#3f3f3f'
xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.xmodmaprc

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

xmonad & WM=$!

#
# Status bar pipe keeps the xsession alive
#
if [ ! -e $HOME/.status ]; then
    mkfifo $HOME/.status
fi

sudo sh $HOME/config/scripts/status.sh | dzen2 -fn fixed -bg '#3f3f3f' -fg '#dcdcdc' &

wait $WM
pkill dzen2

