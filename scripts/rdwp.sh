#!/bin/sh
filename=~/Pictures/unsplash/$(date -I)-$RANDOM.jpg
wget https://source.unsplash.com/random/2560x1080 -O $filename
feh --bg-fill $filename
