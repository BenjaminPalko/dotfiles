{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    nodejs
    bun
    rustc
    go
    cargo
    ripgrep
    xclip
    fzf
    nixfmt-rfc-style
    lazygit
  ];

  xdg.configFile.nvim = {
    source = ../nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
