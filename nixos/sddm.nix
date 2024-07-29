{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ sddm-chili-theme ];
  # services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    theme = "chili";
    # package = pkgs.kdePackages.sddm;
    package = pkgs.libsForQt5.sddm;
    wayland.enable = true;
  };
}
