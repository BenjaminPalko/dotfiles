{ pkgs, ... }:
{

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono NF";
      size = 11;
    };
    settings = {
      enable_audio_bell = "no";
      window_margin_width = 10;
      background_opacity = "0.5";
      confirm_os_window_close = 0;
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = "neofetch --ascii ~/dotfiles/aperture.txt";

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      dotfiles = "cd ~/dotfiles/";
      nv = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "gh"
        "bun"
      ];
      theme = "robbyrussell";
    };

    history = {
      path = "~/.histfile";
      size = 10000;
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
}
