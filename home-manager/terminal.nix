{ config, pkgs, ... }:
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
    initExtra = ''
      neofetch --ascii ~/dotfiles/aperture.txt
    '';

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      clean = "nix-store --gc";
      dotfiles = "cd ~/dotfiles/";
      nv = "nvim";
      pywal = "bash ~/dotfiles/.scripts/switch-wallpaper.sh";
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
      path = "${config.xdg.dataHome}/zsh/history";
      size = 10000;
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.btop = {
    enable = true;
    settings = {
      theme = "system";
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    neofetch
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
