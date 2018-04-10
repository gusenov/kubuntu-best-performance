#!/bin/bash
set -x # echo on

# Usage:
#  $ ./restore.sh

kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- 0.69999999999999996

kwriteconfig --file ~/.config/akonadi/akonadiserverrc --group QMYSQL --key StartServer -- true

sudo sed -i 's/APT::Periodic::Update-Package-Lists "0";/APT::Periodic::Update-Package-Lists "1";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
sudo sed -i 's/APT::Periodic::Unattended-Upgrade "0";/APT::Periodic::Unattended-Upgrade "1";/g' "/etc/apt/apt.conf.d/20auto-upgrades"

sudo chmod a+x /etc/cron.weekly/apt-xapian-index
#sudo chmod 755 /etc/cron.weekly/apt-xapian-index
# $ stat /etc/cron.weekly/apt-xapian-index
# Access: (0755/-rwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
# $ ls -la /etc/cron.weekly/
# -rwxr-xr-x   1 root root   730 Apr 14  2016 apt-xapian-index
