#!/bin/bash

CONFIG_FILES="$HOME/.config/swaync/ $HOME/.cache/wal/"

trap "killall swaync" EXIT
swaync &

while true; do
	inotifywait -e create,modify -r $CONFIG_FILES
	swaync-client -R & swaync-client -rs
done
