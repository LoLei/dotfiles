#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession

# I3
exec i3

# Gnome
# export XDG_SESSION_TYPE=x11
# export GDK_BACKEND=x11
# exec gnome-session
