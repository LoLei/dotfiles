#!/bin/zsh

DIR=$1
wal -i $DIR
sleep 1
python ~/git/dotfiles/set-keyboard-colors.py
