return {
  {
    "ptdewey/pendulum-nvim",
    config = function()
      require("pendulum").setup {
        log_file = vim.fn.expand "$HOME/Documents/nvim_log.csv",
        timeout_len = 180,
        timer_len = 120,
        gen_reports = true, -- Enable report generation (requires Go)
        top_n = 10, -- Include top 10 entries in the report
      }
    end,
    cmd = { "Pendulum", "PendulumRebuild" },
  },
}
