#!/bin/sh
# Git Ignore Large Files

# Find files larger than $filesize and append them to gitignore
find . -size +100M | sed 's|^\./||g' | cat >> .gitignore

# Remove ".git" entries
sed -i '/^\.git/d' .gitignore

# Remove duplicate entries but keep empty lines
awk '!NF || !seen[$0]++' .gitignore > tmpgitignore
mv tmpgitignore .gitignore
