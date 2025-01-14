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
    "haishanh/night-owl.vim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Other config options...
      -- darker
      -- deep
      -- deeper
      -- warm
      -- warmer
      style = "dark",
      transparent = false,
      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "bold",
        strings = "none",
        variables = "none",
      },
      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
    config = function(_, opts)
      local onedark = require "onedark"
      onedark.setup(opts)
      -- onedark.load()
    end,
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
