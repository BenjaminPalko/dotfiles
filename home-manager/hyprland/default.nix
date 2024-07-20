{ pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "catpuccin-mocha-light-cursors";
    size = 24;
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };

  xdg.configFile = {
    hypr = {
      source = ../../hypr;
      recursive = true;
    };
    rofi = {
      source = ../../rofi;
      recursive = true;
    };
    swaync = {
      source = ../../swaync;
      recursive = true;
    };
    wal = {
      source = ../../wal;
      recursive = true;
    };
    waybar = {
      source = ../../waybar;
      recursive = true;
    };
  };
}
