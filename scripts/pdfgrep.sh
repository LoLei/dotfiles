#!/bin/sh
find . -name '*.pdf' -exec sh -c 'pdftotext "{}" - | grep -i --with-filename --label="{}" --color "'"$1"'"' \;
