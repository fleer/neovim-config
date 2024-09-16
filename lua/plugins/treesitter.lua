return {
  {
    "nvim-treesitter/nvim-treesitter",
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
            use_colorpalette = true,
            -- highlight = { "TSParameter" },
            -- For Light Themes
            colorpalette = {
              { fg = "#5c6370" }, -- Dark gray
              { fg = "#e06c75" }, -- Light red
              { fg = "#98c379" }, -- Light green
              { fg = "#c678dd" }, -- Light purple
              { fg = "#e5c07b" }, -- Light yellow
              { fg = "#61afef" }, -- Light blue
              { fg = "#d19a66" }, -- Light orange
              { fg = "#56b6c2" }, -- Light cyan
              { fg = "#abb2bf" }, -- Light gray
              { fg = "#d7ba7d" }, -- Light brown
              { fg = "#be5046" }, -- Light red-brown
              { fg = "#b3b9c5" }, -- Light gray-blue
              { fg = "#c8ccd4" }, -- Light gray-green
              { fg = "#7d8799" }, -- Medium gray
            },
            -- For Dark Themes
            -- colorpalette = {
            --   { fg = "#ef9062" },
            --   { fg = "#3AC6BE" },
            --   { fg = "#35D27F" },
            --   { fg = "#EB75D6" },
            --   { fg = "#E5D180" },
            --   { fg = "#8997F5" },
            --   { fg = "#D49DA5" },
            --   { fg = "#7FEC35" },
            --   { fg = "#F6B223" },
            --   { fg = "#F67C1B" },
            --   { fg = "#DE9A4E" },
            --   { fg = "#BBEA87" },
            --   { fg = "#EEF06D" },
            --   { fg = "#8FB272" },
            -- },
            -- excluded_filetypes = {
            --   "lua",
            --   "rust",
            --   "typescript",
            --   "typescriptreact",
            --   "javascript",
            --   "javascriptreact",
            -- },
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
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["[M"] = "@function.outer",
              ["[{"] = "@class.outer",
            },
            goto_next_end = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["]M"] = "@function.outer",
              ["]}"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = swap_next,
            swap_previous = swap_prev,
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
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = true,
  },
}
