#!/bin/bash

# TODO: Pull input from arguments

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).
number=$RANDOM
let "number %= 10"

echo $number

# Predefine images
image0="/home/lo/pictures/wallpapers/wallpaper-slideshow/Glassius.png"
image1="/home/lo/pictures/wallpapers/wallpaper-slideshow/Atrittion.png"
image2="/home/lo/pictures/wallpapers/wallpaper-slideshow/Hard piont.jpg"
image3="/home/lo/pictures/wallpapers/wallpaper-slideshow/Carbine.jpg"
image4="/home/lo/pictures/wallpapers/wallpaper-slideshow/pearl.JPG"
image5="/home/lo/pictures/wallpapers/wallpaper-slideshow/Atrittion.png"
image6="/home/lo/pictures/wallpapers/wallpaper-slideshow/mod extra.png"
image7="/home/lo/pictures/wallpapers/wallpaper-slideshow/gray-mountains.jpg"
image8="/home/lo/pictures/wallpapers/wallpaper-slideshow/cloudsrise.jpg"
image9="/home/lo/pictures/wallpapers/wallpaper-slideshow/dans-les-nuages.jpg"

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
7)  echo  "$image7"
    feh --bg-scale "$image7"
    ;;
8)  echo  "$image8"
    feh --bg-scale "$image8"
    ;;
9)  echo  "$image9"
    feh --bg-scale "$image9"
    ;;
esac
