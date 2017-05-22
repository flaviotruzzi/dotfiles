#!/bin/bash

## Files/directories to backup
declare -a FILES=(".Xresources" ".inputrc" ".bin")

set -e
set -x

# ensure user is not root
if [ "$EUID" -eq 0 ]; then
	echo "Please don't run as root"
	exit
fi


# back up i3 config related
if [[ "$PWD" = */dotfiles/* ]]; then 
	rm -irf ./home/.config/i3
	cp -r ~/.config/i3 ./home/.config/i3
	rm -irf ./home/.xlock
fi

## Back up files
for i in "${arr[@]}" do
	cp -r ~/"$i" ./home/ 
done

