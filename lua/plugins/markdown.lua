return {
  -- ============================================================================ "
  -- ===                                 Markdown.                              === "
  -- ============================================================================ "
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    ft = { "markdown", "pandoc.markdown" },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  -- Markdown Preview
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   ft = { "markdown" },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  -- },
}
