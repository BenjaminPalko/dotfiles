{ pkgs, ... }:
{
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

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "Whitesur-dark";
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "Whitesur-Dark";
    };
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
