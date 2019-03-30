#!/bin/zsh

DIR=$1
wal -i $DIR
sleep 1
~/git/razer-x-color/razer-x-color.py -a
