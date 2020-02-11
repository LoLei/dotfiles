#!/bin/sh
# Change user and group to own user
FILE=/usr/lib/systemd/system/plexmediaserver.service
sudo sed -e 's/User=plex/User='"$USER"'/' -e 's/Group=plex/Group='"$USER"'/' -i $FILE
sudo chown -R $USER:$USER /var/lib/plex
sudo systemctl daemon-reload
sudo systemctl start plexmediaserver.service
