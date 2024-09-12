return {
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000, 
    opts = { flavour = "mocha", 
    --transparent_background = true, 
    }, 
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
