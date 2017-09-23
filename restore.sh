#!/bin/bash
set -x # echo on

# Usage:
#  $ ./restore.sh

kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- 0.69999999999999996
