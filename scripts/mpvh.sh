#!/bin/sh

# This script symlinks via mpv opened files to a directory for easier access
# later. (No more navigating into deep hierarchies)
# 
# It also handles the case if the mpv plugin nextfile.lua is used, which plays 
# the next file in a directory, but it doesn't start a new process, it simply
# replaces the loaded file in the existing mpv process.
#
# How to use: Simply use this as a wrapper for mpv. E.g. mpvh <video_file>.
#
# Requirements: Needs to be used from the same directory as the files, or else
# readlink fails. Simply add the script to your $PATH
#
# Combination: Works with ranger, if either mpv is replaced globally with mpvh,
# or the mime type in rifle.conf is adapted

get_current_mpv_file_name() {
  file_name=$(echo '{ "command": ["get_property_string", "filename"] }' | \
    socat - /tmp/mpvsocket | jq .data | tr '"' ' ' | \
    sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
}

symlink_mru_and_save_history() {
  readlink -f "$1" >> $HOME/.logs/mpv-history.log
  ln -s "$(readlink -f "$1")" $HOME/Videos/mru/
}

main() {
  mpv "$1" --input-ipc-server=/tmp/mpvsocket &

  # Save PID for later
  pid=$(echo $!)

  # Symlink first opened file (via new mpv process) to mru
  symlink_mru_and_save_history "$1"

  # Handle if next file has been loaded via nextfile.lua
  last_video="placeholer"
  while :
  do
    get_current_mpv_file_name
    current_video=$file_name
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
  symlink_mru_and_save_history "$last_video"
}

main "$1"
