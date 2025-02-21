#!/usr/bin/env bash

paths=("/home/nick/.config/nvim/lua/keybinds.lua" "/home/nick/.vimrc" "/home/nick/.bashrc")

for path in ${paths[*]}
do
	filename="${path/*\//}"
	echo "Checking $filename"
	#echo "	diff  $path $filename -N"
	temp=$(diff "$path" "$filename" -N)
	if [[ -n "$temp" ]]; then
		cp "$path" "./$filename"
		echo "	Copying $filename"
	fi
done


cp -uvrf ~/scripts .
cp -uvrf ~/.config/i3 ./.config
