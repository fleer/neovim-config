return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    version = false,
    dependencies = {
      -- { "folke/neoconf.nvim",      cmd = "Neoconf", config = true },
      {
        "folke/neodev.nvim",
        config = true,
        opts = {
          library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
        },
      },
      { "smjonas/inc-rename.nvim", config = true },
      "b0o/schemastore.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/typescript.nvim",
      "rust-lang/rust.vim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      {
        "simrat39/inlay-hints.nvim",
        config = true,
      },
      -- Support for semantic tokens for Neovim is still under development.
      {
        "theHamsta/nvim-semantic-tokens",
        config = function()
          require("nvim-semantic-tokens").setup {
            preset = "default",
            -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or
            -- function with the signature: highlight_token(ctx, token, highlight) where
            --        ctx (as defined in :h lsp-handler)
            --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
            --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
            highlighters = { require "nvim-semantic-tokens.table-highlighter" },
          }
        end,

        enabled = true,
      },
    },
    config = function(plugin)
      require("plugins.lsp.servers").setup(plugin)
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    config = function(plugin)
      local icons = require "config.icons"
      require("mason").setup {
        providers = {
          "mason.providers.registry-api",
          "mason.providers.client",
        },
        ui = {
          icons = {
            package_installed = icons.server_installed,
            package_pending = icons.server_pending,
            package_uninstalled = icons.server_uninstalled,
          },
        },
      }
      -- local mr = require("mason-registry")
      -- for _, tool in ipairs(plugin.ensure_installed) do
      -- 	local p = mr.get_package(tool)
      -- 	if not p:is_installed() then
      -- 		p:install()
      -- 	end
      -- end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "codelldb",
          "stylua",
          "shfmt",
          "pyright",
          "julia-lsp",
          "json-lsp",
          "eslint-lsp",
          "ruff_lsp",
          "prettier",
        },
        auto_update = false,
        run_on_start = true,
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    -- config = function()
    -- 	local nls = require "null-ls"
    -- 	nls.setup {
    -- 	  sources = {
    -- 	    nls.builtins.formatting.stylua,
    -- 	    nls.builtins.diagnostics.ruff.with { extra_args = { "--max-line-length=180" } },
    -- 	  },
    -- 	}
    -- end,
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
}
