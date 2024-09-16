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

      { "<leader>cc", group = "+Copilot", icon = "" },
      -- Quick chat with Copilot
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      -- Show help actions with telescope
      {
        "<leader>cch",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ccp",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ccd",
        "<cmd>'<,'>CopilotChatDocs<cr>",
        mode = { "n", "v" },
        desc = "CopilotChat - Add Docs for the selection",
      },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    }
  end,
}
