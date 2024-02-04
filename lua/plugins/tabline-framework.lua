return {
  {
    "rafcamlet/tabline-framework.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      local render = function(f)
        -- f.add { '   ', fg = "#bb0000" }

        f.make_tabs(function(info)
          -- With the help of kyazdani42/nvim-web-devicons we can fetch color
          -- associated with the filetype
          local icon_color = f.icon_color(info.filename)

          -- If this is the current tab then highlight it
          if info.current then
            -- We can use set_fg to change default fg color
            -- so you won't need to specify it every time
            f.set_fg(icon_color)
          end

          -- f.add(' ' .. info.index .. ' ')

          if info.filename then
            f.add(info.modified and '+')
            f.add(info.filename)

            -- The icon function returns a filetype icon based on the filename
            f.add(' ' .. f.icon(info.filename))
          else
            f.add(info.modified and '[+]' or '[-]')
          end
          f.add ' '
        end)
      end
      require('tabline_framework').setup { render = render }
    end
  }
}
