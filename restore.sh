#!/bin/bash
set -x # echo on

# Usage:
#  $ ./restore.sh

kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- 0.69999999999999996

sudo sed -i 's/APT::Periodic::Update-Package-Lists "0";/APT::Periodic::Update-Package-Lists "1";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
sudo sed -i 's/APT::Periodic::Unattended-Upgrade "0";/APT::Periodic::Unattended-Upgrade "1";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
