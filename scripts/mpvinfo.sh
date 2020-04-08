#!/bin/sh
# https://github.com/mpv-player/mpv/blob/master/DOCS/man/ipc.rst#id7
FILENAME=$(echo '{ "command": ["get_property_string", "filename"] }' | socat - /tmp/mpvsocket | jq .data | tr '"' ' ')

echo $FILENAME
