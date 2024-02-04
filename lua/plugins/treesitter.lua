return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      { "windwp/nvim-ts-autotag",                      event = "InsertEnter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
      { "p00f/nvim-ts-rainbow",                        event = "BufReadPre" },
      { "RRethy/nvim-treesitter-textsubjects",         event = "BufReadPre" },
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
          require("hlargs").setup({
            color = "#ef9062",
            use_colorpalette = false,
            -- highlight = { "TSParameter" },
            colorpalette = {
              { fg = "#ef9062" },
              { fg = "#3AC6BE" },
              { fg = "#35D27F" },
              { fg = "#EB75D6" },
              { fg = "#E5D180" },
              { fg = "#8997F5" },
              { fg = "#D49DA5" },
              { fg = "#7FEC35" },
              { fg = "#F6B223" },
              { fg = "#F67C1B" },
              { fg = "#DE9A4E" },
              { fg = "#BBEA87" },
              { fg = "#EEF06D" },
              { fg = "#8FB272" },
            },
            excluded_filetypes = {
              "lua",
              "rust",
              "typescript",
              "typescriptreact",
              "javascript",
              "javascriptreact",
            },
          })
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

      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
          enable = true,
          -- additional_vim_regex_highlighting = { "markdown" },
        },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
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
      })
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
}
