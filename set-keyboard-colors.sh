#!/bin/bash

# Get current primary color used by pywal
RGB="$(xrdb -query | grep "*color1:" | awk -F '#' '{print $2}')"

echo "Xresrouces color1: "
# Split by RGB
R=${RGB:0:2}
echo R: $R
G=${RGB:2:2}
echo G: $G
B=${RGB:4:2}
echo B: $B

# Go to device drive directory 
# https://github.com/openrazer/openrazer/wiki/Using-the-keyboard-driver
cd /sys/bus/hid/drivers/razerkbd/0003:1532:021A.0008

# Write color values into driver file
echo -n -e "\xFF\xFF\xFF" > matrix_effect_static
