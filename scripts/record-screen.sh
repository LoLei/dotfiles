#!/bin/sh
# https://www.reddit.com/r/linux/comments/8n3ylp/screen_recording_in_x11_with_ffmpeg/
# TODO: Dynamic position and size, mic opt-in
resolution="1280x1080"

# With mic/audio
# ffmpeg -y \
# -video_size $resolution \
# -framerate 30 -f x11grab -i :0.0 \
# -f pulse -ac 2 -i default \
# /tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.mp4 \
# &> /tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.log

# Without sound
ffmpeg -y \
-video_size $resolution \
-framerate 30 -f x11grab -i :0.0 \
/tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.mp4 \
&> /tmp/screen1_recording_`date '+%Y-%m-%d_%H-%M-%S'`.log
