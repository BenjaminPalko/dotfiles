#!/bin/sh
CONFIG_FILES="$HOME/dotfiles/ags"
while true; do
	sleep 1.6
	ags run --gtk4 -d "$CONFIG_FILES" &
	inotifywait -e create,modify -r "$CONFIG_FILES"
	killall gjs
done
