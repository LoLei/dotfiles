#!/bin/sh
if [ -z "$1" ]
  then
    mvdir=$(pwd)
  else
    mvdir=$1
fi
dldir=$HOME/Downloads
mv $dldir/$(ls -t1 $dldir |  head -n 1) $mvdir
