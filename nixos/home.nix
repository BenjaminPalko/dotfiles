{ config, ... }:
{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    warn-dirty = false;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
