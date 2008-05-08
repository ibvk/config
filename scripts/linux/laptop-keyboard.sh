#!/bin/bash

DIR=$HOME/config/xmodmap

xmodmap $DIR/clear-all-mods
xmodmap $DIR/remove-meta-from-super
xmodmap $DIR/remove-meta-from-alt
xmodmap $DIR/alt-as-mod4
xmodmap $DIR/super-as-mod1
xmodmap $DIR/add-meta-to-super

xmodmap $DIR/clear-lock
xmodmap $DIR/clear-control
xmodmap $DIR/caps-as-control

