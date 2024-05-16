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
  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
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
  {
    "ntpeters/vim-better-whitespace",
    cmd = "StripWhitespace",
    keys = {
      { "<leader>y", "<cmd>:StripWhitespace<cr>", desc = "Strip Whitespaces", remap = true },
    },
    config = function()
      -- <leader>y - Automatically remove trailing whitespace
      vim.cmd [[
          let g:better_whitespace_filetypes_blacklist=['startify', 'packer', 'toggleterm', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', 'ranger', '']
          let g:better_whitespace_operator=''
        ]]
    end,
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
