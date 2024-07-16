{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cava
    spotify
  ];
  programs.cava = {
    enable = true;
  };
}
