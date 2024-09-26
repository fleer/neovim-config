return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          -- markdown = true, -- overrides default
          -- python = true,
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
              -- disable for .env files
              return false
            end
            return true
          end,
        },
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup {
        -- debug = true, -- Enable debug logging
        window = {
          layout = "float",
          relative = "editor",
          width = 0.8,
          height = 0.8,
        },
        prompts = {
          Docs = {
            prompt = [[/COPILOT_GENERATE Please add documentation comment for the selection and respect the following restrictions: 
              - The lines of the comment should not exceed 80 characters. 
              - No line numbers should be displayed.
              - If the code is written in python, follow the google docstring style. 
            ]],
          },
        },
      }
    end,
    event = "VeryLazy",
  },
}
