{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "Whitesur-dark";
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "Whitesur-Dark";
    };
  };
}
