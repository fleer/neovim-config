return {
  {
    "nvim-neorg/neorg",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
    -- ft = { "norg" },
    cmd = { "Neorg" },
    build = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
              name = "[Neorg]",
            },
          },                  -- Completion support
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = vim.env.HOME .. "/norg-projects/",
                dev = vim.env.HOME .. "/dev-notes/",
              },
              default_workspace = "notes",
            },
          },
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
          ["core.summary"] = {},
          ["core.integrations.telescope"] = {},
        },
      }
      local neorg_callbacks = require "neorg.core.callbacks"
      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            { "<C-s>",           "core.integrations.telescope.find_linkable" },
            { "<leader><space>", "core.norg.qol.todo_items.todo.task_cycle" },
          },
          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
  },
}
