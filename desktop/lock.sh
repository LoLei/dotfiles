#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -filter Gaussian -blur 0x5 /tmp/screen.png
[[ -f $HOME/git/dotfiles/images/nsa-dual.png ]] && convert /tmp/screen.png $HOME/git/dotfiles/images/nsa-dual.png -gravity center -composite -matte /tmp/screen.png
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i /tmp/screen.png
