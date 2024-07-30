{ ... }:
{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
  };
  services.playerctld.enable = true;
  services.plex = {
    enable = true;
    openFirewall = true;
  };
}
