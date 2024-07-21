{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    lua
    (python3.withPackages (
      p: with p; [
        pygobject3
        gst-python
      ]
    ))
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
    source = config.lib.file.mkOutOfStoreSymlink ../nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
