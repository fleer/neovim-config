return {
  -- library used by other plugins
  "nvim-lua/plenary.nvim",
  -- icons
  {
    "nvim-tree/nvim-web-devicons",
    -- dependencies = { "DaikyXendo/nvim-material-icon" },
    -- config = function()
    --   require("nvim-web-devicons").setup {
    --     override = require("nvim-material-icon").get_icons(),
    --   }
    -- end,
  },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },
}
