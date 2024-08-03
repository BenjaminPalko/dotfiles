{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # browser
    firefox
    vivaldi
    # messaging
    webcord
    caprine-bin
    # game-dev
    godot_4
    aseprite
    # organization
    logseq
    opentabletdriver
  ];

  xdg.configFile.Caprine = {
    source = config.lib.file.mkOutOfStoreSymlink ../caprine;
    recursive = true;
  };
}
