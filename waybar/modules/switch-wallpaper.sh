# -n tells `wal` to skip setting the wallpaper.
wal -i ~/Wallpapers/ -n

# Using feh to tile the wallpaper now.
# We grab the wallpaper location from wal's cache so 
# that this works even when a directory is passed.
swww img "$(< "${HOME}/.cache/wal/wal")" --transition-type wipe --transition-angle 45

notify-send "Changing Wallpaper"

