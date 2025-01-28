return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require "tokyonight"
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      local catppuccin = require "catppuccin"
      catppuccin.setup { flavour = "latte" }
      -- catppuccin.load()
    end,
    priority = 1000,
  },
  {
    "mhartington/oceanic-next",
    lazy = false,
    priority = 1000,
  },
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    priority = 1000,
  },
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
  },
  {
    --[[   "arcticicestudio/nord-vim" ]]
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
  },
}
