#!/bin/bash

declare -a FILES=(".Xresources"
		 ".inputrc"
	         ".bin"
		 ".config/i3"
		 ".xlock")

set -e
set -x

# ensure user is not root
if [ "$EUID" -eq 0 ]; then
	echo "Please don't run as root"
	exit
fi

for i in "${FILES[@]}"
do
	cp -r ./home/$i ~/
done

