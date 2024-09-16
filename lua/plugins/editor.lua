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
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    -- keys = {
    --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    -- },
  },
  {
    -- Quick navigation through quickfix list
    "tpope/vim-unimpaired",
    event = "BufReadPre",
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
