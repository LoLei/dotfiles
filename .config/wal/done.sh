#!/bin/sh
# https://github.com/GloverDonovan/dotfiles/blob/eff7623a9a2e9c7ccedb2c95a1730ac4d523ed9c/wal/.config/wal/done.sh#L16-L36

# =================================================
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: dunst
# =================================================

mkdir -p "${HOME}/.config/dunst"
ln -sf "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"

# ===================
# ====== dunst ======
# ===================

# Restart dunst with the new color scheme
pkill dunst
dunst &
