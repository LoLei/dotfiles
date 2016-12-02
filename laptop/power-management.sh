#!/bin/bash
echo "Checking battery status..."

cd /sys/class/power_supply/BAT0

# Check if AC or battery
CHARGING="$(cat uevent | grep STATUS | grep -q Charging)"
echo $CHARGING
if cat uevent | grep STATUS | grep -q Charging; then
  echo "Computer is on AC"
  echo "Setting backlight to 100%..."
  xbacklight -set 100
  echo "Increasing CPU usage..."
  ~/git/dotfiles/laptop/fast-cpu
else
  echo "Computer battery is draining"
  # Check battery level
  PERCENTAGE="$(cat uevent | grep "CAPACITY=" | grep -Eo '[0-9]{1,4}')"
  echo "Battery percentage:" $PERCENTAGE"%"
  echo "Setting backlight to 50%..."
  xbacklight -set 50
  echo "Decreasing CPU usage..."
  ~/git/dotfiles/laptop/slow-cpu
  if [ $PERCENTAGE -lt 25 ]; then
  echo "Setting backlight to 25%..."
    xbacklight -set 25
  fi
fi

sleep 2
