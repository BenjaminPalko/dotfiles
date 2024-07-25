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
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        colorVariants = [ "Dark" ];
        opacityVariants = [ "normal" ];
        darkerColor = true;
      };
    };
    cursorTheme = {
      name = "Volantes_cursors";
      package = pkgs.volantes-cursors;
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme.override { themeVariants = [ "default" ]; };
    };
  };
  home.sessionVariables.GTK_THEME = "WhiteSur-Dark";
}
