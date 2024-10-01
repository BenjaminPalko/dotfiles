wal -i ~/Wallpapers/ -n
gsettings set org.gnome.desktop.background picture-uri-dark "file://$(cat ~/.cache/wal/wal)"
cp ~/.cache/wal/cava-config ~/dotfiles/cava/config && pkill -USR2 cava
