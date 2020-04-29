#!/bin/sh
# Call example: ./record-screen.sh 800x600 1
resolution=$1
enable_mic=0

if [ -n "$2" ]
then
  enable_mic=$2
  echo $enable_mic
fi

mic_str=""
if [ "$enable_mic" -eq 1 ]
then
  mic_str="-f pulse -ac 2 -i default"
  echo $mic_str
fi

ffmpeg -y \
-video_size $resolution \
-framerate 30 -f x11grab -i :0.0 \
$mic_str \
/tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.mp4 \
&> /tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.log
