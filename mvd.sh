#!/bin/sh
dldir=$HOME/Downloads
mv $dldir/$(ls -t1 $dldir |  head -n 1) $(pwd)
