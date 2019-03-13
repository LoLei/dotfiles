#!/bin/zsh

DIR=$1
wal -i $DIR
sleep 1
python ~/git/razer-x-color/razer-x-color.py
