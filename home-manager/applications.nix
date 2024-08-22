{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # browser
    firefox
    vivaldi
    # messaging
    discord
    caprine-bin
    # game-dev
    godot_4
    aseprite
    # organization
    obsidian
  ];

  xdg.configFile.Caprine = {
    source = config.lib.file.mkOutOfStoreSymlink ../caprine;
    recursive = true;
  };
}
