#!/bin/bash
#TODO: Use CPU power to lower cpu usage
cd /sys/class/power_supply/BAT0

# Check if AC or battery
CHARGING="$(cat uevent | grep STATUS | grep -q Charging)"
echo $CHARGING
if cat uevent | grep STATUS | grep -q Charging; then
  echo "AC"
  xbacklight -set 100
  ~/git/dotfiles/laptop/fast-cpu
else
  echo "Draining"
  # Check battery level
  PERCENTAGE="$(cat uevent | grep "CAPACITY=" | grep -Eo '[0-9]{1,4}')"
  echo $PERCENTAGE
  xbacklight -set 50
  ~/git/dotfiles/laptop/slow-cpu
  if [ $PERCENTAGE -lt 25 ]; then
    xbacklight -set 25
  fi
fi

