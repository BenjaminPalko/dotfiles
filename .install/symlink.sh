#!/bin/bash

# files
files=(
  ".zshrc"
  ".tool-versions"
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
  done;
}

# directories
directories=(
  "cava"
  "gtk-3.0"
  "hypr"
  "kitty"
  "neofetch"
  "nvim"
  "pipewire"
  "swappy"
  "swaync"
  "wal"
  "waybar"
  "wofi"
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
  done;
}

_symlinkFiles "${files[@]}"
_symlinkDirs "${directories[@]}"

