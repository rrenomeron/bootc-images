#!/usr/bin/bash

echo "Adding Logo Menu to default enabled extensions" 
tee /etc/dconf/db/distro.d/10-tr-enabled-extensions << EOF
[org/gnome/shell]
enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com','dash-to-dock@micxgx.gmail.com','blur-my-shell@aunetx','system-monitor-next@paradoxxx.zero.gmail.com', 'accent-directories@taiwbi.com']
EOF 

echo "Done"