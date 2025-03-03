return {
  {
    "3rd/image.nvim",
    version = "1.3.0",
    -- lazy = false,
    ft = { "markdown", "qarto" },
    opts = {
      backend = "kitty",
      -- backend = "ueberzug",
      processor = "magick_rock", -- or "magick_cli"
      integrations = {
        markdown = {
          enabled = true,
          -- resolve_image_path = function(document_path, image_path, fallback)
          --   -- document_path is the path to the file that contains the image
          --   -- image_path is the potentially relative path to the image. for
          --   -- markdown it's `![](this text)`
          --
          --   -- you can call the fallback function to get the default behavior
          --   return fallback(document_path, image_path)
          -- end,

          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          floating_windows = false, -- if true, images will be rendered in floating markdown windows
          filetypes = { "markdown", "quarto" }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = false,
          filetypes = { "norg" },
        },
        typst = {
          enabled = false,
          filetypes = { "typst" },
        },
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      },
      max_width = 100,
      max_height = 20,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign", "" },
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
      tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
    },
  },
}
