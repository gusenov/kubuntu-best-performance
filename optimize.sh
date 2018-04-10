#!/bin/bash
set -x # echo on

# Usage:
#  $ ./optimize.sh

# http://shitohichiumaya.blogspot.com/2017/01/how-to-workaround-frequently-crash.html
kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- -1

# https://askubuntu.com/questions/798989/heavy-load-by-apt-unattended-upgrade
# https://help.ubuntu.com/community/AutomaticSecurityUpdates
sudo sed -i 's/APT::Periodic::Update-Package-Lists "1";/APT::Periodic::Update-Package-Lists "0";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
sudo sed -i 's/APT::Periodic::Unattended-Upgrade "1";/APT::Periodic::Unattended-Upgrade "0";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
