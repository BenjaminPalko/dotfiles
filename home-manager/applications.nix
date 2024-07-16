{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    discord
    betterdiscordctl
    caprine-bin
  ];

  xdg.configFile.Caprine = {
    source = ../caprine;
    recursive = true;
  };
}
