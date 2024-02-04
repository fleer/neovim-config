local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
--[[ local refurb = require "config.lsp.null-ls.diagnostics.refurb" ]]
local b = nls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

-- TODO: create own file in ./diagnostics/ for all sources
local sources = {
  --[[ b.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }), ]]
  b.formatting.shfmt,
  b.formatting.fixjson,
  b.formatting.ruff_format,
  b.formatting.taplo, -- Formatting .toml files
  -- b.formatting.ngnix_beautifier,
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.write_good.with({ filetypes = { "md", "markdown", "markdown.pandoc", "vimwiki" } }),
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.ruff, -- Handled by ruff-lsp
  -- TODO: Test if can be replaced
  b.diagnostics.eslint_d.with({
    condition = function(utils)
      return utils.root_has_file(".eslintrc.js")
    end,
  }),
  -- with_root_file(b.diagnostics.selene, "selene.toml"),
  -- with_diagnostics_code(b.diagnostics.shellcheck),
  b.diagnostics.shellcheck.with({ filetypes = { "sh", "zsh" } }),
  function()
    local utils = nls_utils.make_conditional_utils()

    if utils.root_has_file(".eslintrc.js") then
      return b.formatting.eslint_d
    else
      return b.formatting.prettier
    end
  end,

  -- code actions
  -- b.code_actions.gitsigns,
  -- b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
  -- Python 10 refurb
  --[[ refurb, ]]
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = true,
    sources = sources,
    on_attach = opts.on_attach,
    -- on_attach = function(client)
    --     if client.server_capabilities.document_formatting then
    --         vim.cmd([[
    --         augroup LspFormatting
    --             autocmd! * <buffer>
    --             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    --         augroup END
    --         ]])
    --     end
    -- end,
    -- root_dir = nls_utils.root_pattern(".null-ls-root",".git"),
  }
end

return M
