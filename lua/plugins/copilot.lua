return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      { "MeanderingProgrammer/markdown.nvim" },
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup {
        -- debug = true, -- Enable debug logging
        -- You might also want to disable default header highlighting for copilot chat
        -- when enabling render markdown integration
        highlight_headers = false,
        separator = "---",
        error_header = "> [!ERROR] Error",
        answer_header = ">  ",
        question_header = ">  ",
        ---
        window = {
          layout = "float",
          relative = "editor",
          width = 0.8,
          height = 0.8,
        },
        prompts = {
          Docs = {
            prompt = "> /COPILOT_GENERATE\n\nPlease add documentation comment for the selection and respect the following restrictions:\n- The lines of the comment should not exceed 80 characters.\n- No line numbers should be displayed.\n- If the code is written in python, follow the google docstring style.",
          },
        },
      }
    end,
    event = "VeryLazy",
  },
}
