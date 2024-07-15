#!/bin/bash

# directories
directories=(
	"cava"
	"gtk-3.0"
	"gtk-4.0"
	"hypr"
	"nvim"
	"rofi"
	"swappy"
	"swaync"
	"wal"
	"waybar"
)

_symlinkDirs() {
	for dir; do
		if [ -h ~/.config/"${dir}" ]; then
			continue
		fi
		if [ -d ~/.config/"${dir}"/ ]; then
			echo "Deleting existing directory ${dir}"
			rm -rf ~/.config/"${dir}"/
		fi
		ln -s ~/dotfiles/"${dir}"/ ~/.config/
	done
}

_symlinkDirs "${directories[@]}"
