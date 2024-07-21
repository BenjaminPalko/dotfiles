{ config, pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "catpuccin-mocha-light-cursors";
    size = 24;
  };

  xdg.configFile = {
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
  };
}
