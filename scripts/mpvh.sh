#!/bin/sh
mpv "$1" --input-ipc-server=/tmp/mpvsocket &

# Save PID for later
pid=$(echo $!)

# Symlink first opened file (via new mpv process) to mru
readlink -f "$1" >> ~/.logs/mpv-history.log
ln -s "$(readlink -f "$1")" $HOME/Videos/mru/

# Handle if next file has been loaded via nextfile.lua
# (This doesn't restart the mpv process, but simply replaces the previous file
# in the existing mpv process)
last_video="placeholer"
while :
do
  # See mpvinfo.sh
  current_video=$(mpvinfo)
  if [[ $current_video != "" ]]; then
    last_video=$current_video
  fi

  # Check if process has exited
  if ! kill -s 0 $pid; then
      # Symlink last played file to mru
      break
  fi
  sleep 1
done

# Symlink last played video
readlink -f "$last_video" >> ~/.logs/mpv-history.log
ln -s "$(readlink -f "$last_video")" $HOME/Videos/mru/
