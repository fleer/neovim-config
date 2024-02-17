return {
  {
    "Vigemus/iron.nvim",
    cmd = "IronRepl",
    branch = "master",
    -- event = "VeryLazy",
    -- version = "v3.0",
    config = function()
      require("iron.core").setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              command = { "zsh" },
            },
            python = require("iron.fts.python").ipython,
            typescript = {
              command = { "ts-node" },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").split.vertical "40%",
          -- repl_open_cmd = require('iron.view').bottom(40),
          -- repl_open_cmd = require("iron.view").split.vertical.botleft("40%"),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          -- send_motion = "<m/c-cr>",
          visual_send = "<leader>rr",
          send_file = "<leader>rf",
          -- send_line = "<s-cr>",
          send_line = "<leader>rr",
          -- send_mark = "<leader>sm",
          -- mark_motion = "<leader>mc",
          -- mark_visual = "<leader>mc",
          -- remove_mark = "<leader>md",
          -- cr = "<leader>s<cr>",
          -- interrupt = "<leader>s<space>",
          exit = "<leader>rq",
          clear = "<leader>rc",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }
    end,
  },
}
