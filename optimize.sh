#!/bin/bash
set -x # echo on

# Usage:
#  $ ./optimize.sh

# http://shitohichiumaya.blogspot.com/2017/01/how-to-workaround-frequently-crash.html
kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- -1
