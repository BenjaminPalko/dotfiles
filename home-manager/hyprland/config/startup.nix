{
  exec-once = [
    ''
      bash ${builtins.getEnv "PWD"}/dotfiles/home-manager/hyprland/config/scripts/start-swaync.sh
    ''
    "hypridle"
    "swww-daemon"
    ''
      bash ${builtins.getEnv "PWD"}/dotfiles/home-manager/hyprland/config/scripts/start-waybar.sh
    ''
    "emote"
  ];
}
