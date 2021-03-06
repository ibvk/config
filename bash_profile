#
# Extensions to $PATH
#
PATH=$PATH:/usr/local/bin

if [ -d $HOME/bin ]; then
    PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/tools ]; then
    PATH=$HOME/tools:$PATH
fi

export PATH

HOST=`hostname -s`

#
# Load bashrc 
#
if [ -f $HOME/config/$HOST.bashrc ]; then
    . $HOME/config/$HOST.bashrc
fi

