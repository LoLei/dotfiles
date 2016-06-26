#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ "$1" == "--help" ]; then
echo "cw 0.1"
echo "changes your wallpaper every x seconds"
echo ""          
echo "Use: cw /path/of/wallpapers/directory seconds"
echo "Example: cw /home/charlie/wallpapers 120"
exit
fi

if ! [ -e "$1" ]; then
echo "El directorio $1 no existe"
exit
fi

cd $1

function comprobar() {
num=1
for x in *;
do
       let num=$num+1

done
}

while [ 1 ]; do
        comprobar
	var_ran=$(($RANDOM%$num))
        var_aum=1
	for y in *; do
		if [ "$var_ran" -eq "$var_aum" ]; then
			feh --bg-scale $y
			sleep $2
			break
		fi		
		
		let var_aum=$var_aum+1
	done
done
