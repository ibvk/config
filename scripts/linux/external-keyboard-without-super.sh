#!/bin/bash

DIR=$HOME/config/xmodmap

xmodmap $DIR/clear-all-mods
xmodmap $DIR/remove-meta-from-super
xmodmap $DIR/remove-meta-from-alt
xmodmap $DIR/super-as-mod4
xmodmap $DIR/alt-as-mod1
xmodmap $DIR/add-meta-to-alt

xmodmap $DIR/clear-lock
xmodmap $DIR/clear-control
xmodmap $DIR/caps-as-control
xmodmap $DIR/ctrl-as-mod4
