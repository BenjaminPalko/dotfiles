#!/bin/sh

CONFIG_FILES="$HOME/.config/waybar/ $HOME/.cache/wal/"

trap "killall .waybar-wrapped" EXIT

while true; do
	sleep 1.6
	waybar &
	inotifywait -e create,modify -r $CONFIG_FILES
	killall .waybar-wrapped
done
