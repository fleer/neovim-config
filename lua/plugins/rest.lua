return {
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    event = "VeryLazy",
    keys = {
      -- Run command under cursor
      { "<localleader>rr", "<cmd>Rest run<cr>", desc = "Run request under cursor" },
      { "<localleader>rl", "<cmd>Rest run last<cr>", desc = "Re-Run last request" },
      {
        "<localleader>fe",
        function()
          -- first load extension
          require("telescope").load_extension "rest"
          -- then use it, you can also use the `:Telescope rest select_env` command
          require("telescope").extensions.rest.select_env()
        end,
        desc = "REST Environment Variables",
      },
    },
  },
}
