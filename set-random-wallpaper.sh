#!/bin/bash

# TODO: Pull input from arguments

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).
number=$RANDOM
let "number %= 7"

echo $number

# Predefine images
image0="/home/lo/Pictures/wallpapers/wallmod-memovaslg/Glassius.png"
image1="/home/lo/Pictures/wallpapers/wallmod-memovaslg/Atrittion.png"
image2="/home/lo/Pictures/wallpapers/wallmod-memovaslg/Hard piont.jpg"
image3="/home/lo/Pictures/wallpapers/wallmod-memovaslg/Carbine.jpg"
image4="/home/lo/Pictures/wallpapers/wallmod-memovaslg/pearl.JPG"
image5="/home/lo/Pictures/wallpapers/wallmod-memovaslg/Respawn.png"
image6="/home/lo/Pictures/wallpapers/wallmod-memovaslg/mod extra.png"

# "Switch" statement, execute feh with image selected by RNG
case "$number" in
0)  echo "$image0"
    feh --bg-scale "$image0"
    ;;
1)  echo  "$image1"
    feh --bg-scale "$image1"
    ;;
2)  echo  "$image2"
    feh --bg-scale "$image2"
    ;;
3)  echo  "$image3"
    feh --bg-scale "$image3"
    ;;
4)  echo  "$image4"
    feh --bg-scale "$image4"
    ;;
5)  echo  "$image5"
    feh --bg-scale "$image5"
    ;;
6)  echo  "$image6"
    feh --bg-scale "$image6"
    ;;
esac
