{ ... }:
{
  xdg.configFile = {
    "gtk-3.0" = {
      source = ../gtk-3.0;
      recursive = true;
    };
    "gtk-4.0" = {
      source = ../gtk-4.0;
      recursive = true;
    };
    hypr = {
      source = ../hypr;
      recursive = true;
    };
    rofi = {
      source = ../rofi;
      recursive = true;
    };
    swaync = {
      source = ../swaync;
      recursive = true;
    };
    wal = {
      source = ../wal;
      recursive = true;
    };
    waybar = {
      source = ../waybar;
      recursive = true;
    };
  };
}
