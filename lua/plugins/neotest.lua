---- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
---- ━━━━━━━━━━━━━━━━━❰ testing ❱━━━━━━━━━━━━━━━━━━━━━━ --
return {
  {
    "vim-test/vim-test",
    -- keys = {
    --   { "<leader>tc", "<cmd>w|TestClass<cr>",   desc = "Class" },
    --   { "<leader>tf", "<cmd>w|TestFile<cr>",    desc = "File" },
    --   { "<leader>tl", "<cmd>w|TestLast<cr>",    desc = "Last" },
    --   { "<leader>tn", "<cmd>w|TestNearest<cr>", desc = "Nearest" },
    --   { "<leader>ts", "<cmd>w|TestSuite<cr>",   desc = "Suite" },
    --   { "<leader>tv", "<cmd>w|TestVisit<cr>",   desc = "Visit" },
    -- },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "belowright"
      vim.g["test#neovim#preserve_screen"] = 1

      vim.g["test#python#runner"] = "pytest"
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "rouge8/neotest-rust",
    },
    module = { "neotest", "neotest.async" },
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- dap = { justMyCode = false },
            runnter = "pytest",
          }),
          require("neotest-jest"),
          require("neotest-go"),
          require("neotest-plenary"),
          require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
          }),
          require("neotest-rust"),
        },
        icons = { passed = "", failed = "", skipped = "󱐋", running = "󰔟", unknown = "" },
        -- overseer.nvim
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
        overseer = {
          enabled = true,
          force_default = true,
        },
      })
    end,
  },
}
