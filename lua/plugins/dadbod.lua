---- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
---- ━━━━━━━━━━━━━━━━━❰ Database Management ❱━━━━━━━━━━━━━━━━━━━━━━ --
return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      -- For autocompletion
      -- https://alpha2phi.medium.com/neovim-lsp-enhanced-a3d313abee65
      "kristijanhusak/vim-dadbod-completion",
    },
    keys = {
      { "<leader>du", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
      { "<leader>df", "<cmd>DBUIFindBuffer<CR>", desc = "Find Buffer" },
      { "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", desc = "Rename Buffer" },
      { "<leader>dl", "<cmd>DBUILastQueryInfo<CR>", desc = "Last Query Info" },
    },
    event = "VeryLazy",
    config = function()
      vim.cmd [[
    let g:db_ui_save_location = '~/.config/db_ui'
    ]]
      -- autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
    end,
  },
}
