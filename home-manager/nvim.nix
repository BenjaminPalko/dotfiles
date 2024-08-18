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
    # C++
    meson
    mesonlsp
    pkg-config
    ninja
    cmake
    gnumake
    clang
    clang-tools
    # OpenGL
    glslls
    fmt
    fmt.dev
    glfw-wayland
    libGL
    libGL.dev
    # Other
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
    VCPKG_ROOT = "${pkgs.vcpkg.outPath}/share/vcpkg";
  };
}
