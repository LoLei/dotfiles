#!/bin/bash

# Get old brightness
current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
echo "Old brightness:" $current_brightness

# If dim is specified
new_brightness=$(($current_brightness+$1))
echo "New brightness:" $new_brightness
tee /sys/class/backlight/intel_backlight/brightness <<< $new_brightness

