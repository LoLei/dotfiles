#!/bin/sh
mpv "$1" && readlink -f "$1" >> ~/.logs/mpv-history.log
