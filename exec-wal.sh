#!/bin/zsh

DIR=$1
# Generate colors and set terminal theme
wal -i $DIR &&

# Set keyboard colors
razer-cli -a

# Set GTK and icon theme
~/git/dotfiles/change-gtk-theme.sh

# Update Firefox
~/git/Pywalfox/daemon/pywalfox.py update
