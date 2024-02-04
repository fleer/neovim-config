-- statusline
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      -- Color table for highlights
      local colors = {
        bg = "#202328",
        fg = "#bbc2cf",
        yellow = "#ECBE7B",
        cyan = "#008080",
        darkblue = "#081633",
        green = "#98be65",
        orange = "#FF8800",
        violet = "#a9a1e1",
        magenta = "#c678dd",
        blue = "#51afef",
        red = "#ec5f67",
      }

      local function lsp_client(msg)
        msg = msg or ""
        local buf_clients = vim.lsp.get_active_clients()
        if next(buf_clients) == nil then
          if type(msg) == "boolean" or #msg == 0 then
            return ""
          end
          return msg
        end

        local buf_ft = vim.bo.filetype
        local buf_client_names = {}

        -- add client
        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
          end
        end

        -- add formatter
        local formatters = require("plugins.lsp.format")
        local supported_formatters = formatters.list_registered(buf_ft)
        vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        local linters = require("plugins.lsp.null-ls.linters")
        local supported_linters = linters.list_registered(buf_ft)
        vim.list_extend(buf_client_names, supported_linters)

        -- add hover
        local hovers = require("plugins.lsp.null-ls.hovers")
        local supported_hovers = hovers.list_registered(buf_ft)
        vim.list_extend(buf_client_names, supported_hovers)

        -- Remove duplicates as some clients are formatter and linter
        local hash = {}
        local res_buf_client_names = {}

        for _, v in ipairs(buf_client_names) do
          if not hash[v] then
            res_buf_client_names[#res_buf_client_names + 1] =
                v -- you could print here instead of saving to result table if you wanted
            hash[v] = true
          end
        end
        return "[" .. table.concat(res_buf_client_names, ", ") .. "]"
      end

      local icons = require("config.icons")

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warning,
                info = icons.diagnostics.Information,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {
            {
              lsp_client,
              icon = "",
              -- color = { fg = colors.violet, gui = "bold" },
              -- color = fg("Constant"),
            },
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant"),
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = fg("Special"),
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = "",                   padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "nvim-tree" },
      }
    end,
  },

  -- lsp symbol navigation for lualine
  -- {
  --   "SmiteshP/nvim-navic",
  --   init = function()
  --     vim.g.navic_silence = true
  --     require("lazyvim.util").on_attach(function(client, buffer)
  --       if client.server_capabilities.documentSymbolProvider then
  --         require("nvim-navic").attach(client, buffer)
  --       end
  --     end)
  --   end,
  --   opts = { separator = " ", highlight = true, depth_limit = 5 },
  -- },
}
