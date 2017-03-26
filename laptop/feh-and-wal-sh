#!/bin/bash
echo Using $1
wal -i $1 2> out.txt
echo Output:
cat out.txt

OUTPUT="$(cat out.txt | sed -n 's/grep_img: //p')"
echo "${OUTPUT}"

feh --bg-fill ${OUTPUT}
