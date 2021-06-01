#!/bin/zsh

## colors-source [hardcoded-colors] [-l]


if [[ -f "$1" ]] || [[ -d "$1" ]]
then
  # Directory or image supplied
  # Generate colors and set terminal theme
  wal $3 -i $1 -o /home/me/git/dotfiles/.config/wal/done.sh &&
else
  # Theme name supplied
  cd /home/me/git/dotfiles || exit
  wal $3 --theme $1 -o /home/me/git/dotfiles/.config/wal/done.sh &&
fi

# Set keyboard colors
if ! [ -z "$2" ]
then
  razer-cli -c $2
  hsetroot -solid "#$2"
else
  razer-cli -a
fi

# Set GTK and icon theme
# /home/me/git/dotfiles/change-gtk-theme.sh

# Update Firefox
# pywalfox update

# Update spotify via spoomox (user rights-adapted script)
# Supply argument to stop spotify from starting
# spoomox 0xdeadbeef
