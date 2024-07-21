{ pkgs, ... }:
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
