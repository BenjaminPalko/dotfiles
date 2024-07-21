{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    discord
    betterdiscordctl
    caprine-bin
  ];

  xdg.configFile.Caprine = {
    source = config.lib.file.mkOutOfStoreSymlink ../caprine;
    recursive = true;
  };
}
