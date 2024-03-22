#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/ $HOME/.cache/wal/"

trap "killall waybar" EXIT

while true; do
	sleep 0.4
	waybar &
	inotifywait -e create,modify -r $CONFIG_FILES
	killall waybar
done
