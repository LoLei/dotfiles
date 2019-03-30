#!/bin/zsh

DIR=$1
wal -i $DIR
sleep 1
~/git/razer-cli/razer-cli.py -a
