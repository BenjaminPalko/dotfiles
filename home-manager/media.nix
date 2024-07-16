{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    mplayer
  ];
  programs.cava = {
    enable = true;
  };
}
