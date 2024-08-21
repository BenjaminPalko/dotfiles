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
  ];

  programs.pywal.enable = true;
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
