return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    version = false,
    dependencies = {
      { "smjonas/inc-rename.nvim", config = true },
      "b0o/schemastore.nvim",
      "rust-lang/rust.vim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- TypeScript
      {
        "pmizio/typescript-tools.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          "nvim-lua/plenary.nvim",
        },
        ft = {
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
        },
        opts = {
          -- spawn additional tsserver instance to calculate diagnostics on it
          separate_diagnostic_server = true,
          -- "change"|"insert_leave" determine when the client asks the server about diagnostic
          publish_diagnostic_on = "insert_leave",
          -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
          -- "remove_unused_imports"|"organize_imports") -- or string "all"
          -- to include all supported code actions
          -- specify commands exposed as code_actions
          expose_as_code_action = {},
          -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
          -- not exists then standard path resolution strategy is applied
          tsserver_path = nil,
          -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
          -- (see 💅 `styled-components` support section)
          tsserver_plugins = {},
          -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
          -- memory limit in megabytes or "auto"(basically no limit)
          tsserver_max_memory = "auto",
          -- described below
          tsserver_format_options = {
            insertSpaceAfterCommaDelimiter = true,
            insertSpaceAfterConstructor = false,
            insertSpaceAfterSemicolonInForStatements = true,
            insertSpaceBeforeAndAfterBinaryOperators = true,
            insertSpaceAfterKeywordsInControlFlowStatements = true,
            insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
            insertSpaceBeforeFunctionParenthesis = false,
            insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
            insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
            insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
            insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
            insertSpaceAfterTypeAssertion = false,
            placeOpenBraceOnNewLineForFunctions = false,
            placeOpenBraceOnNewLineForControlBlocks = false,
            semicolons = "insert",
            indentSwitchCase = true,
          },
          tsserver_file_preferences = {},
          -- locale of all tsserver messages, supported locales you can find here:
          -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
          tsserver_locale = "en",
          -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
          complete_function_calls = false,
          include_completions_with_insert_text = true,
          -- CodeLens
          -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
          -- possible values: ("off"|"all"|"implementations_only"|"references_only")
          code_lens = "all",
          -- by default code lenses are displayed on all referencable values and for some of you it can
          -- be too much this option reduce count of them by removing member references from lenses
          disable_member_code_lens = true,
          -- JSXCloseTag
          -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
          -- that maybe have a conflict if enable this feature. )
          jsx_close_tag = {
            enable = false,
            filetypes = { "javascriptreact", "typescriptreact" },
          },
        },
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
          "typescript-language-server",
          "ruff",
          "sqlfluff",
          "prettier",
          "write-good",
          "yaml-language-server",
          "r-languageserver",
          "dockerfile-language-server",
          "docker-compose-language-service",
          "texlab",
          "jinja-lsp",
          "latexindent",
          "taplo",
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
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup {
        attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
      }
    end,
  },
}
