#!/bin/zsh

DIR=$1
# Generate colors and set terminal theme
wal -i $DIR &&

# Set GTK and icon theme
~/git/dotfiles/change-gtk-theme.sh &&

sleep 1
razer-cli -a
