{ ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        blur_passes = 4;
        blur_size = 2;
        noise = 1.17e-2;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
    };
  };
}
