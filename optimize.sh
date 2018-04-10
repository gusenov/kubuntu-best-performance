#!/bin/bash
set -x # echo on

# Usage:
#  $ ./optimize.sh

# http://shitohichiumaya.blogspot.com/2017/01/how-to-workaround-frequently-crash.html
kwriteconfig --file ~/.config/plasmarc --group PlasmaToolTips --key Delay -- -1

# https://ubuntuforums.org/showthread.php?t=1764048&s=b7420bf8119f62ca810b3a658cccc284&p=10881947#post10881947
# https://askubuntu.com/questions/453422/removing-nepomuk-and-akonadi
kwriteconfig --file ~/.config/akonadi/akonadiserverrc --group QMYSQL --key StartServer -- false

# https://askubuntu.com/questions/798989/heavy-load-by-apt-unattended-upgrade
# https://help.ubuntu.com/community/AutomaticSecurityUpdates
sudo sed -i 's/APT::Periodic::Update-Package-Lists "1";/APT::Periodic::Update-Package-Lists "0";/g' "/etc/apt/apt.conf.d/20auto-upgrades"
sudo sed -i 's/APT::Periodic::Unattended-Upgrade "1";/APT::Periodic::Unattended-Upgrade "0";/g' "/etc/apt/apt.conf.d/20auto-upgrades"

# https://askubuntu.com/questions/79481/is-100-cpu-usage-harmful-while-update-apt-xapi-runs
# https://ubuntuforums.org/showthread.php?t=1062688
# http://forum.ubuntu.ru/index.php?topic=100553.0
# http://forum.ubuntu.ru/index.php?topic=257553.0
sudo chmod a-x /etc/cron.weekly/apt-xapian-index
#sudo chmod 644 /etc/cron.weekly/apt-xapian-index
# $ stat /etc/cron.weekly/apt-xapian-index
# Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
# $ ls -la /etc/cron.weekly/
# -rw-r--r--   1 root root   730 Apr 14  2016 apt-xapian-index
