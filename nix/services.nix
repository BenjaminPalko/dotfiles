{ config, lib, pkgs, ... }:
{
  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  # Hyrland Idle
  services.hypridle.enable = true;
  # SSH
  services.openssh.enable = true;
}
