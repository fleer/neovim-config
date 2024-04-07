return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = { "CodeSnap", "CodeSnapSave" },
    config = function()
      require("codesnap").setup {
        save_path = "~/Pictures",
        mac_window_bar = true,
        title = "CodeSnap.nvim",
        code_font_family = "CaskaydiaCove Nerd Font",
        watermark_font_family = "Pacifico",
        watermark = "",
        bg_theme = "grape",
        breadcrumbs_separator = "/",
        has_breadcrumbs = false,
      }
    end,
  },
}
