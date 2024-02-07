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
    wk.register({
      w = { "<cmd>update!<CR>", "Save" },
      q = { "<cmd>lua require('util').smart_quit()<CR>", "Quit" },
      d = { name = "+Database" },
      f = { name = "+File" },
      g = {
        name = "+Git",
        c = { "<cmd>lua require('utils.term').git_commit_toggle()<CR>", "Conventional Commits" },
        s = { "<cmd>Git<CR>", "Status" },
        p = { "<cmd>Git push<CR>", "Push" },
        b = { "<cmd>Git blame<CR>", "Blame" },
        h = { "<cmd>0Gclog<cr>", "File History" },
        d = { "<cmd>Gvdiffsplit<cr>", "Diffview" },
        l = { "<cmd>lua require('utils.term').git_client_toggle()<CR>", "Lazy Git" },
      },
      l = {
        name = "+LSP",
      },
      r = {
        name = "REPL",
      },
      c = {
        name = "+Code",
        x = {
          name = "Swap Next",
          f = "Function",
          p = "Parameter",
          c = "Class",
        },
        X = {
          name = "Swap Previous",
          f = "Function",
          p = "Parameter",
          c = "Class",
        },
        g = {
          name = "Generate Docstring",
          a = "Annotation",
          f = "Function",
          p = "Parameter",
          c = "Class",
        },
      },
      s = {
        name = "+Search",
        c = { [[ <Esc><Cmd>lua require('utils.term').cht()<CR>]], "cht.sh" },
        s = { [[ <Esc><Cmd>lua require('utils.term').so()<CR>]], "Stack Overflow" },
      },
      t = {
        name = "+Test",
        -- a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
        f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
        w = { "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>", "Watch File" },
        -- F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
        l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
        -- L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
        n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
        -- N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
        -- N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
        o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
        -- S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
        s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
        -- p = { "<Plug>PlenaryTestFile", "PlenaryTestFile" },
        v = { "<cmd>TestVisit<cr>", "Visit" },
        x = { "<cmd>TestSuite<cr>", "Suite" },
      },
      z = { name = "+System" },
    }, { prefix = "<leader>" })
  end,
}
