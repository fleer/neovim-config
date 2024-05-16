local M = {}

local servers = {
  -- gopls = {
  --   hints = {
  --     assignVariableTypes = true,
  --     compositeLiteralFields = true,
  --     compositeLiteralTypes = true,
  --     constantValues = true,
  --     functionTypeParameters = true,
  --     parameterNames = true,
  --     rangeVariableTypes = true,
  --   },
  -- },
  -- html
  html = {
    filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx", "typescriptreact", "typescript.tsx" },
  },
  -- Emmet
  emmet_ls = {
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    },
  },
  -- CSS
  cssls = {},
  -- arduino_language_server = {},
  marksman = {}, -- Markdown
  r_language_server = {},
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          url = "https://www.schemastore.org/api/json/catalog.json",
          enable = true,
        },
        schemas = {
          ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/master-standalone-strict/all.json"] = "*-k8s.yaml",
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "/Workflow/*",
          ["https://azuremlschemas.azureedge.net/latest/MLTable.schema.json"] = "MLTable",
        },
        schemaDownload = { enable = true },
        validate = true,
      },
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
  ruff_lsp = {},
  dockerls = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
        hint = {
          enable = false,
        },
      },
    },
  },
  eslint = {},
  -- handled via typescript-tools
  tsserver = {
    disable_formatting = true,
    settings = {
      javascript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        },
      },
    },
  },
  angularls = {},
  vimls = {},
  julials = {},
  taplo = {},
}

local function on_attach(client, bufnr)
  local caps = client.server_capabilities

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Used for barbecue.nvim
  if caps["documentSymbolProvider"] then
    -- Handled via tsserver
    if client.name ~= "typescript-tools" then
      require("nvim-navic").attach(client, bufnr)
    end
  end

  if client.name == "eslint" then
    -- caps.document_formatting = true
    -- Eslint AutoFormat
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "silent! EslintFixAll",
      group = vim.api.nvim_create_augroup("MyAutocmdsJavaScripFormatting", {}),
    })
  end

  if client.name == "julials" then
    -- disable virtual text (recommended for julia)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      underline = false,
      signs = true,
      update_in_insert = false,
    })
  end

  if client.name ~= "null-ls" then
    -- Enable inlay hints
    if caps.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr })
    end
    -- semantic highlighting
    if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
      local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
      vim.api.nvim_create_autocmd("TextChanged", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.semantic_tokens_full()
        end,
      })
      -- fire it first time on load as well
      vim.lsp.buf.semantic_tokens_full()
    end
  end
end

local function lsp_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, bufnr)
    end,
  })
end

local function lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  -- Needed for UFO
  local present, ufo = pcall(require, "ufo")
  if present then
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
  end
  return capabilities
end

local options = {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
-- -- Setup LSP handlers
require("plugins.lsp.handlers").setup()

function M.setup()
  lsp_attach(function(client, bufnr)
    -- Configure key mappings
    require("plugins.lsp.keymaps").on_attach(client, bufnr)

    -- Configure formatting
    require("plugins.lsp.format").on_attach(client, bufnr)
  end)

  require("plugins.lsp.null-ls").setup(options)

  -- require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
  require("mason-lspconfig").setup()
  require("mason-lspconfig").setup_handlers {
    function(server)
      local opts = servers[server] or {}
      opts.capabilities = lsp_capabilities()
      opts.on_attach = on_attach
      require("lspconfig")[server].setup(opts)
    end,
  }
end

return M
