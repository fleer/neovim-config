return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    wk.setup {
      show_help = false,
      plugins = { spelling = true },
      -- key_labels = { ["<leader>"] = "SPC" },
      triggers = "auto",
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
        "<leader>gl",
        function()
          require("utils.term").git_client_toggle()
        end,
        desc = "Lazy Git",
      },
      { "<leader>l", group = "+LSP" },
      { "<leader>r", group = "+REPL" },
      { "<leader>c", group = "+Code" },
      { "<leader>g", group = "Generate Docstring" },
      { "<leader>ga", desc = "Annotation" },
      { "<leader>gf", desc = "Function" },
      { "<leader>gp", desc = "Parameter" },
      { "<leader>gc", desc = "Class" },
      { "<leader>s", group = "+Search" },
      {
        "<leader>sc",
        function()
          require("utils.term").cht()
        end,
        desc = "cht.sh",
      },
      {
        "<leader>ss",
        function()
          require("utils.term").so()
        end,
        desc = "Stack Overflow",
      },
      { "<leader>z", group = "+System" },
      {
        "<leader>zc",
        function()
          require("telescope.builtin").colorscheme { enable_preview = true }
        end,
        desc = "Colorscheme",
      },
    }
  end,
}
