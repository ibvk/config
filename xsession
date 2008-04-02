#!/bin/bash

KERNEL=`uname -s`

if [ "$KERNEL" = "Linux" ]
then
    source $HOME/config/xsession.linux

elif [ "$KERNEL" = "Darwin" ]
then
    source $HOME/config/xsession.darwin
fi
