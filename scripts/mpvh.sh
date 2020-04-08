#!/bin/sh
mpv "$1" --input-ipc-server=/tmp/mpvsocket &

# Save PID for later
pid=$(echo $!)

# Symlink opened file to mru
readlink -f "$1" >> ~/.logs/mpv-history.log
ln -s "$(readlink -f "$1")" $HOME/Videos/mru/

# Symlink if next file has been loaded via nextfile.lua
# (This doesn't restart the mpv process, but simply replaces the previous file
# in the existing mpv process)
while :
do
  # See mpvinfo.sh
  current_video=$(mpvinfo)

  # Kill poll check is not accurate, so mpvinfo will run after exit and empty
  # variable saved - CBA'd to check for that
  # So save it somwhere else (Append)
  echo "$current_video" >> /tmp/mpv_cur_vid

  # Check if process has exited
  if ! kill -s 0 $pid; then
      # Symlink last played file to mru
      break
  fi
  sleep 5
done

last_video=$(awk '/./{line=$0} END{print line}' /tmp/mpv_cur_vid)
readlink -f "$last_video" >> ~/.logs/mpv-history.log
ln -s "$(readlink -f "$last_video")" $HOME/Videos/mru/
