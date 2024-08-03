{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Languages
    lua
    (python3.withPackages (
      p: with p; [
        pygobject3
        gst-python
      ]
    ))
    clang
    clang-tools
    nodejs
    bun
    rustc
    go
    cargo
    # Extensions
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
