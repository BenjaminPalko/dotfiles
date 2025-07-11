#!/bin/bash

# files
files=(
	".bashrc"
	".gitconfig"
	".zshrc"
)

_symlinkFiles() {
	for file; do
		if [ -h ~/${file} ]; then
			continue
		fi
		if [ -f ~/${file} ]; then
			rm ~/${file}
		fi
		ln -s ~/dotfiles/${file} ~/${file}
	done
}

# directories
directories=(
	"cava"
	"hypr"
	"kitty"
	"mise"
	"neofetch"
	"nvim"
	"quickshell"
	"rofi"
	"swappy"
	"swaync"
	"wal"
	"waybar"
)

_symlinkDirs() {
	for dir; do
		if [ -h ~/.config/${dir} ]; then
			continue
		fi
		if [ -d ~/.config/${dir}/ ]; then
			echo "Deleting existing directory ${dir}"
			rm -rf ~/.config/${dir}/
		fi
		ln -s ~/dotfiles/${dir}/ ~/.config/
	done
}

_symlinkFiles "${files[@]}"
_symlinkDirs "${directories[@]}"
