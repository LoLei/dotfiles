#!/bin/zsh

if [[ -f "$1" ]] || [[ -d "$1" ]]
then
  # Directory or image supplied
  # Generate colors and set terminal theme
  wal -i $1 -o ~/git/dotfiles/.config/wal/done.sh &&
else
  # Theme name supplied
  wal --theme $1 -o ~/git/dotfiles/.config/wal/done.sh &&
fi

# Set keyboard colors
razer-cli -a

# Set GTK and icon theme
~/git/dotfiles/change-gtk-theme.sh

# Update Firefox
~/git/Pywalfox/daemon/pywalfox.py update
