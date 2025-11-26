return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.setup {
      show_help = false,
      plugins = { spelling = true },
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "a", mode = { "n", "v" } },
      },
    }
    wk.add {
      { "<leader>h", ":%s###<left><left>", desc = "Find and replace" },
      { "<leader>/", ":nohlsearch<CR>", desc = "Clear highlighted terms" },
      { "<leader>q", "<cmd>call setqflist([])<cr>", desc = "Clear Quickfix list" },
      { "<leader>d", group = "+Database" },
      { "<leader>f", group = "+File" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>n", group = "+Jupytext cell" },
      { "<leader>nc", mode = { "n" }, "o# %%<CR>", desc = "Create a new python cell" },
      { "<leader>nm", mode = { "n" }, "o# %% [markdown]<CR># ", desc = "Create a new markdown cell" },
      { "<leader>g", group = "+Git" },
      {
        "<leader>gc",
        function()
          require("utils.term").git_commit_toggle()
        end,
        desc = "Conventional Commits",
      },
      { "<leader>gs", "<cmd>Git<CR>", desc = "Status" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Push" },
      { "<leader>gu", "<cmd>Git pull<CR>", desc = "Pull" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Blame" },
      { "<leader>gh", "<cmd>0Gclog<cr>", desc = "File History" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Diffview" },
      {
        "<leader>gg",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
      {
        "<leader>gl",
        function()
          require("utils.term").git_client_toggle()
        end,
        desc = "Lazygit",
      },
      { "<leader>l", group = "+LSP" },
      { "<leader>r", group = "+REPL" },
      { "<leader>c", group = "+Code" },
      { "<leader>s", group = "+Search" },
      {
        "<leader>ss",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<leader>sS",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      -- {
      --   "<leader>sc",
      --   function()
      --     require("utils.term").cht()
      --   end,
      --   desc = "cht.sh",
      -- },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("utils.term").so()
      --   end,
      --   desc = "Stack Overflow",
      -- },
      { "<leader>z", group = "+System" },
      {
        "<leader>zc",
        function()
          require("telescope.builtin").colorscheme { enable_preview = true }
        end,
        desc = "Colorscheme",
      },

      { "<leader>cc", group = "+Copilot", icon = " " },
      {
        "<leader>ccc",
        function()
          require("sidekick.cli").toggle { name = "copilot", focus = true }
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ccd",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>cct",
        function()
          require("sidekick.cli").send { msg = "{this}" }
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>ccf",
        function()
          require("sidekick.cli").send { msg = "{file}" }
        end,
        desc = "Send File",
      },
      {
        "<leader>ccv",
        function()
          require("sidekick.cli").send { msg = "{selection}" }
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ccp",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      { "<leader>t", group = "+Test", icon = "" },
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run the nearest test",
      },
      {
        "<leader>tt",
        function()
          -- require("neotest").run.run(vim.fn.getcwd())
          require("neotest").run.run { suite = true }
        end,
        desc = "Run all tests",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "Run the current file",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.watch()
        end,
        desc = "Watch file",
      },
      { "<leader>ta", "<cmd>w|lua require('neotest').run.attach()<cr>", desc = "Attach" },
      { "<leader>tl", "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = "Last" },
      { "<leader>tn", "<cmd>w|lua require('neotest').run.run()<cr>", desc = "Nearest" },
      { "<leader>to", "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
      { "<leader>ts", "<cmd>w|lua require('neotest').run.stop()<cr>", desc = "Stop" },
      { "<leader>tS", "<cmd>w|lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
      -- Quarto
      -- { "<leader>q", group = "[q]uarto" },
      -- {
      --   "<leader>qE",
      --   function()
      --     require("otter").export(true)
      --   end,
      --   desc = "[E]xport with overwrite",
      -- },
      -- { "<leader>qa", ":QuartoActivate<cr>", desc = "[a]ctivate" },
      -- { "<leader>qe", require("otter").export, desc = "[e]xport" },
      -- { "<leader>qh", ":QuartoHelp ", desc = "[h]elp" },
      -- { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "[p]review" },
      -- { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "[q]uiet preview" },
      -- { "<leader>qr", group = "[r]un" },
      -- { "<leader>qra", ":QuartoSendAll<cr>", desc = "run [a]ll" },
      -- { "<leader>qrb", ":QuartoSendBelow<cr>", desc = "run [b]elow" },
      -- { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "to cu[r]sor" },
    }
  end,
}
