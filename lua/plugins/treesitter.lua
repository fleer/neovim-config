return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "BufReadPre" },
      { "windwp/nvim-ts-autotag", event = "InsertEnter" },
      { "HiPhish/rainbow-delimiters.nvim", event = "BufReadPre" },
      { "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
      -- End wise
      {
        "RRethy/nvim-treesitter-endwise",
        event = "InsertEnter",
      },
      -- Enable semantic highlight to highlight arguments definitions and usages,
      -- asynchronously, using Treesitter
      {
        "m-demare/hlargs.nvim",
        event = "BufReadPre",
        config = function()
          require("hlargs").setup {
            color = "#ef9062",
            excluded_filetypes = {
              "lua",
              "rust",
              "typescript",
              "typescriptreact",
              "javascript",
              "javascriptreact",
            },
          }
        end,
      },
    },
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      local swap_next, swap_prev = (function()
        local swap_objects = {
          p = "@parameter.inner",
          f = "@function.outer",
          c = "@class.outer",
        }

        local n, p = {}, {}
        for key, obj in pairs(swap_objects) do
          n[string.format("<leader>cx%s", key)] = obj
          p[string.format("<leader>cX%s", key)] = obj
        end

        return n, p
      end)()

      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {
          enable = true,
          -- additional_vim_regex_highlighting = { "markdown" },
        },
        rainbow = {
          enable = true,
        },
        -- endwise
        endwise = {
          enable = true,
        },

        -- autotag
        autotag = {
          enable = true,
        },
        -- context_commentstring
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        -- For molten.nvim and quarto
        textobjects = {
          move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
              ["]b"] = { query = "@block.inner", desc = "next code block" },
              -- The @class.inner queries also catch on markdown headings. @block.inner does not
              -- ["]b"] = { query = "@class.inner", desc = "next block" },
            },
            goto_previous_start = {
              ["[b"] = { query = "@block.inner", desc = "previous code block" },
              -- ["[b"] = { query = "@class.inner", desc = "previous block" },
            },
          },
        },

        indent = { enable = true, disable = { "python" } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require "nvim-autopairs"
      npairs.setup {
        check_ts = true,
      }
    end,
  },
  -- {
  --   "folke/ts-comments.nvim",
  --   opts = {},
  --   event = "VeryLazy",
  --   enabled = true,
  -- },
}
