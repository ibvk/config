#!/bin/bash

#
# OS specific xsession customizations
#
OS=`uname -s`
if [ -f $HOME/config/$OS.xsession ]; then
    sh $HOME/config/$OS.xsession
fi

#
# Hostname specific xsession customizations
#
HOST=`hostname -s`

if [ -f $HOME/config/$HOST.xsession ]; then
    sh $HOME/config/$HOST.xsession
fi

