{ pkgs, ... }:
{
  programs.xwayland = {
    enable = true;
    package = pkgs.xwayland;
  };
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
    xarchiver
    xwayland
    xwaylandvideobridge
    egl-wayland
    # Clipboard
    wl-clipboard
    cliphist
    # Cursor
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
