#!/bin/sh
# Video: H.264
# Audio: AAC 
ffmpeg -i "$1" -acodec aac -vcodec libx264 "$1-conv.mp4"

echo "Done. Check for correct codecs below.\n"

ffprobe -v error -show_format -show_streams "$1-conv.mp4" \
  | grep codec_name -A 3 -B 2
