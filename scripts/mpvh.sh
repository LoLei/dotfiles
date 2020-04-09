#!/bin/sh

get_current_mpv_file_name() {
  file_name=$(echo '{ "command": ["get_property_string", "filename"] }' | \
    socat - /tmp/mpvsocket | jq .data | tr '"' ' ')
}

symlink_mru_and_save_history() {
  readlink -f "$1" >> ~/.logs/mpv-history.log
  ln -s "$(readlink -f "$1")" $HOME/Videos/mru/
}

main() {
  mpv "$1" --input-ipc-server=/tmp/mpvsocket &

  # Save PID for later
  pid=$(echo $!)

  # Symlink first opened file (via new mpv process) to mru
  symlink_mru_and_save_history $1

  # Handle if next file has been loaded via nextfile.lua
  # (This doesn't restart the mpv process, but simply replaces the previous file
  # in the existing mpv process)
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
  symlink_mru_and_save_history $last_video
}

main $1
