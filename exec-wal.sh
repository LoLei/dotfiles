#!/bin/zsh

## colors-source [hardcoded-colors] [-l]

echo "Arg: $1"

if [[ -d "$1" ]]
then
  echo Directory supplied
  wal $3 -i $1 -o /home/me/git/dotfiles/.config/wal/done.sh &&
elif [[ -f "$1" ]] && ([[ $1 == *.jpg ]] || [[ $1 == *.png ]])
then
  echo Image supplied
  wal $3 -i $1 -o /home/me/git/dotfiles/.config/wal/done.sh &&
else
  echo Theme supplied
  cd /home/me/git/dotfiles/themes || exit
  wal $3 --theme $1 -o /home/me/git/dotfiles/.config/wal/done.sh &&
fi

# Set keyboard colors
if ! [ -z "$2" ]
then
  razer-cli -c $2
  hsetroot -solid "#$2"
else
  # razer-cli -a
  razer-cli -e multicolor,xpalette
fi

# Set GTK and icon theme
# /home/me/git/dotfiles/change-gtk-theme.sh

# Update Firefox
# pywalfox update

# Update spotify via spoomox (user rights-adapted script)
# Supply argument to stop spotify from starting
# spoomox 0xdeadbeef
