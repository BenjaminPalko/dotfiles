{ config, pkgs, ... }:
{
  imports = [ ./gtk.nix ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    name = "volantes_cursors";
    package = pkgs.volantes-cursors;
    size = 24;
  };

  home.packages = with pkgs; [
    rofi-wayland
    swaynotificationcenter
    volantes-cursors
    pywal
    (pkgs.writeShellScriptBin "pywal" ''
      # -n tells `wal` to skip setting the wallpaper.
      wal -i ~/Wallpapers/ -n

      # Using feh to tile the wallpaper now.
      # We grab the wallpaper location from wal's cache so
      # that this works even when a directory is passed.
      swww img "$(<"${config.home.homeDirectory}/.cache/wal/wal")" --transition-type wipe --transition-angle 45 --transition-fps 90

      # Copy cava and update config
      cp ~/.cache/wal/cava-config ~/.config/cava/config && pkill -USR2 cava
    '')
  ];

  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    hypr = {
      source = config.lib.file.mkOutOfStoreSymlink ../../hypr;
      recursive = true;
    };
    rofi = {
      source = config.lib.file.mkOutOfStoreSymlink ../../rofi;
      recursive = true;
    };
    swaync = {
      source = config.lib.file.mkOutOfStoreSymlink ../../swaync;
      recursive = true;
    };
    wal = {
      source = config.lib.file.mkOutOfStoreSymlink ../../wal;
      recursive = true;
    };
    waybar = {
      source = config.lib.file.mkOutOfStoreSymlink ../../waybar;
      recursive = true;
    };
    xfce4 = {
      source = config.lib.file.mkOutOfStoreSymlink ../../xfce4;
      recursive = true;
    };
  };
}
