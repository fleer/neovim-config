return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "normal",
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
    -- config = function()
    --   local catppuccin = require "catppuccin"
    --   catppuccin.setup { flavour = "frappe" }
    --   catppuccin.load()
    -- end,
  },
  {
    "mhartington/oceanic-next",
    lazy = false,
  },
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
  },
  {
    "Mofiqul/dracula.nvim",
  },
  {
    "sainnhe/everforest",
    lazy = false,
  },
  {
    --[[   "arcticicestudio/nord-vim" ]]
    "shaunsingh/nord.nvim",
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
  },
}
