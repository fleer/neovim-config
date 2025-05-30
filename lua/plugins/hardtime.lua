return {
  {
    "m4xshen/hardtime.nvim",
    event = "BufReadPre",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      -- Add "oil" to the disabled_filetypes
      disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
        "fugitive",
        "dbui",
        "dbout",
        "noice",
        "toggleterm",
        "terminal",
        "copilot-chat",
        "",
      },
    },
  },
}
