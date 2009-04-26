#!/bin/bash

HOST=`hostname -s`

xsetroot -solid '#3f3f3f'
xrdb -merge ${HOME}/config/Xresources
xmodmap ${HOME}/config/xmodmap/${HOST}.xmodmaprc

PATH=$PATH:/usr/local/bin:$HOME/bin
export PATH

# xmonad & WM=$!
# awesome & WM=$!
sawfish & WM=$!

while true
do
    M=`sudo sh $HOME/config/scripts/status.sh`
    echo $M
    sleep 5
done | dzen2 -fn fixed -bg '#3f3f3f' &

xterm -g 140x55 &

wait $WM
pkill dzen2

