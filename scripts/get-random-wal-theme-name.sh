#!/bin/sh
cd "$HOME/git/dotfiles/themes"

# If there's an argument, output only the theme name,
# else output everything (including optional color)

if [ -z "$1" ]
then
  shuf -n 1 themes-list.txt
  echo "No argument supplied"
else
  shuf -n 1 themes-list.txt | awk '{print $1;}'
fi
