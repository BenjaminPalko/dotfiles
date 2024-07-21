{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    hyprcursor
    # Notifications
    inotify-tools
    # Wallpaper
    swww
    # Emoji
    emote
    # Screenshots
    grim
    slurp
    swappy
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
