#!/bin/bash

KERNEL=`uname -s`

if [ "$KERNEL" = "Linux" ]
then
    sh $HOME/config/xsession.linux

elif [ "$KERNEL" = "Darwin" ]
then
    sh $HOME/config/xsession.darwin
fi
