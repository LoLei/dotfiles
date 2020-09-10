#!/bin/sh
cd "$HOME/git/dotfiles/themes"
shuf -n 1 themes-list.txt | awk '{print $1;}'
