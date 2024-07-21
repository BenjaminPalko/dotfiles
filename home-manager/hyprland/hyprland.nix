{ lib, ... }:
let
  configs = [
    ./config/input.nix
    ./config/keybinds.nix
    ./config/look.nix
    ./config/nvidia.nix
    ./config/rules.nix
    ./config/startup.nix
  ];
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = lib.mkMerge (
      [
        {
          monitor = "DP-1,preferred,auto,auto";
          "$terminal" = "kitty";
          "$fileManager" = "Thunar";
          "$menu" = "rofi -show drun";
          "$lockScreen" = "hyprlock";

          "$mainMod" = "SUPER";
          source = "${../../../.cache/wal/colors-hyprland.conf}";
        }
      ]
      ++ (lib.forEach configs (config: import config))
    );
  };
}
