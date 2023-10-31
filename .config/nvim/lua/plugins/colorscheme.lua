return {
  -- add githbub_dark
  { "projekt0n/github-nvim-theme" },

  -- add catppuccin
  { "catppuccin/nvim", as = "catppuccin" },

  -- Configure LazyVim to load
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark",
    },
  },
}
