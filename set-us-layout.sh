#!/bin/bash

if lsusb | grep -q Razer; then
    echo Found Razer peripherals, setting keyboard layout to US
    setxkbmap -layout us
    setxkbmap -option compose:ralt
else
    echo Did not find Razer peripherals
fi
