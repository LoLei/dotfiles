#!/bin/sh
~/git/oomoxify/oomoxify.sh /home/me/.cache/wal/colors-oomox -s /home/me/.opt/spotify/Apps

if [ -z "$1" ]
then
  spotify &
fi
