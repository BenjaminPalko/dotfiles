return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "glsl" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        glsl_analyzer = {
          -- mason = false,
        },
      },
    },
  },
}
