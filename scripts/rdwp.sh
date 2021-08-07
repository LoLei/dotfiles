#!/bin/sh
filename=~/Pictures/unsplash/$(date -I)-$RANDOM.jpg
wget https://source.unsplash.com/random/3840x2160 -O $filename
feh --bg-fill $filename
