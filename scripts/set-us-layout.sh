#!/bin/bash

DETECT=$1

if [ -z "$DETECT" ]
then
    echo Setting keyboard layout to US.
    setxkbmap -layout us
    setxkbmap -option compose:ralt
else
    echo "Using detection:"
    if lsusb | grep -q Razer; then
        echo Found Razer peripherals, setting keyboard layout to US.
        setxkbmap -layout us
        setxkbmap -option compose:ralt
    else
        echo Did not find Razer peripherals, leaving layout as is.
    fi
fi
