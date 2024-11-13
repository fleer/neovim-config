---- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
---- ━━━━━━━━━━━━━━━━━❰ Editing ❱━━━━━━━━━━━━━━━━━━━━━ --
return {
  {
    --[[
      Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more.
      The plugin provides mappings to easily delete, change and add such surroundings in pairs.
      It's easiest to explain with examples. Press cs"' inside
       Hello world!"
      to change it to
       'Hello world!'
      Now press cs'<q> to change it to
       <q>Hello world!</q>
      ]]
    --
    "tpope/vim-surround",
    event = "InsertEnter",
  },
  {
    -- Vim plugin that provides additional text objects
    -- To change the text in the next pair of parentheses, the cin) command
    "wellle/targets.vim",
    event = "CursorMoved",
  },
  -- Extend f, F, t, T to work on multiple lines.
  -- Repeat jump by pressing f, F, t, T again. It is reset when cursor moved as a result of not jumping or timeout after idle time (duration customizable).
  -- Highlight (after customizable delay) all possible target characters and stop it after some (customizable) idle time.
  -- Normal, Visual, and Operator-pending (with full dot-repeat) modes are supported.
  {
    "echasnovski/mini.jump",
    version = "*",
    event = "BufReadPre",
    config = function()
      require("mini.jump").setup()
    end,
  },
  {
    -- Quick navigation through quickfix list
    "tpope/vim-unimpaired",
  },
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "VeryLazy",
    config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      -- { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      -- { "<leader>xtt", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo Trouble" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "Todo Telescope" },
    },
  },
}
