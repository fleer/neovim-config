return {
  {
    "benlubas/molten-nvim",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    ft = { "python" },
    init = function()
      -- this guide will be using image.nvim
      -- Don't forget to setup and install the plugin if you want to view image outputs
      vim.g.molten_image_provider = "image.nvim"

      vim.g.molten_auto_image_popup = false
      vim.g.molten_auto_open_output = true
      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_max_lines = 20

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true
      -- these are examples, not defaults. Please see the readme
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
  },
}
