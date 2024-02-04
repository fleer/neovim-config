return {
  -- ============================================================================ "
  -- ===                                 Markdown.                              === "
  -- ============================================================================ "
  --
  -- Add Headlines to markdown files
  -- {
  --    'lukas-reineke/headlines.nvim',
  --    dependencies = "nvim-treesitter/nvim-treesitter",
  --    config = true, -- or `opts = {}`
  --  },
  --
  {
    -- Markdown Mode
    "preservim/vim-markdown",
    dependencies = "godlygeek/tabular",
    branch = 'master',
    -- event = "VeryLazy",
    ft = { "markdown", "pandoc.markdown" },
  },
  {
    -- Table autocomplete
    'dhruvasagar/vim-table-mode',
    ft = { "markdown", "pandoc.markdown" },
  },
  -- {
  --   "vim-pandoc/vim-pandoc",
  --   dependencies = {
  --     "vim-pandoc/vim-pandoc-syntax",
  --   },
  --   event = "BufReadPre",
  --   config = function()
  --     -- Command for creating reveal.js slides
  --     -- If you want your lists to display incrementally (one item at a time), use the -i option."
  --     -- With all HTML slide formats, the --self-contained option can be used to produce a single file that contains all of the data necessary to display the slide show, including linked scripts, stylesheets, images, and videos.

  --     vim.cmd [[
  --       let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
  --       let g:pandoc#filetypes#pandoc_markdown = 0
  --       :command! CreateSlides Pandoc revealjs -s --mathjax -V theme=white -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/
  --       :command! CreateSlidesProd Pandoc revealjs -s --mathjax --self-contained -V theme=white -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/
  --       ":command CreateSlides Pandoc slidy -s --mathjax
  --     ]]
  --   end,
  -- },
  -- Fenced Markdown code-blocks
  { "AckslD/nvim-FeMaco.lua", ft = { "markdown" }, opts = {} },
  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,

  },
}
