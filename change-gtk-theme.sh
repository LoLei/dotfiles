#!/bin/bash
# Exec pywal first
# Done in exec-wal.sh

# Generate GTK3 theme
oomox-cli /opt/oomox/scripted_colors/xresources/xresources2

# Generate icon theme
/opt/oomox/plugins/icons_gnomecolors/gnome-colors-icon-theme/change_color.sh /opt/oomox/scripted_colors/xresources/xresources2
