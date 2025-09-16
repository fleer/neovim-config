return {
  {
    "nvim-mini/mini.ai",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup {
        custom_textobjects = {
          L = function(ai_type)
            local line_num = vim.fn.line "."
            local line = vim.fn.getline(line_num)
            -- Select `\n` past the line for `a` to delete it whole
            local from_col, to_col = 1, line:len() + 1
            if ai_type == "i" then
              if line:len() == 0 then
                -- Don't remove empty line
                from_col, to_col = 0, 0
              else
                -- Ignore indentation for `i` textobject and don't remove `\n` past the line
                from_col = line:match "^%s*()"
                to_col = line:len()
              end
            end
            return { from = { line = line_num, col = from_col }, to = { line = line_num, col = to_col } }
          end,
          B = function(ai_type)
            local n_lines = vim.fn.line "$"
            local start_line, end_line = 1, n_lines
            if ai_type == "i" then
              -- Skip first and last blank lines for `i` textobject
              local first_nonblank, last_nonblank = vim.fn.nextnonblank(1), vim.fn.prevnonblank(n_lines)
              start_line = first_nonblank == 0 and 1 or first_nonblank
              end_line = last_nonblank == 0 and n_lines or last_nonblank
            end

            local to_col = math.max(vim.fn.getline(end_line):len(), 1)
            return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
          end,
          -- created a new text object C that represents a notebook cell in the .py represetation, so that I can use all verbs with the iC (without header) and aC (with header) objects
          C = function(ai_type)
            local line_num = vim.fn.line "."
            local first_line = 1
            local last_line = vim.fn.line "$"
            local line = vim.fn.getline(line_num)
            local cond = function(l)
              if l:len() > 3 then
                if l:sub(1, 4) == "# %%" then
                  return true
                end
              end
              return false
            end
            local found_up = true

            -- Find first line in cell
            while not cond(line) do
              line_num = line_num - 1
              line = vim.fn.getline(line_num)
              if line_num == 1 then
                found_up = false
                break
              end
            end

            if not found_up then
              local cur_pos = vim.api.nvim_win_get_cursor(0)
              return {
                from = { line = cur_pos[1], col = cur_pos[2] + 1 },
              }
            end

            -- If inside, not include cell delimiter
            if ai_type == "i" then
              first_line = line_num + 1
            else
              first_line = line_num
            end

            -- Find last line in cell
            line_num = vim.fn.line "."
            line = vim.fn.getline(line_num)
            local found_down = true
            while not cond(line) do
              if line_num == last_line then
                found_down = false
                break
              end
              line_num = line_num + 1
              line = vim.fn.getline(line_num)
            end
            local last_col = line:len()
            if found_down then
              last_line = line_num - 1
              line = vim.fn.getline(last_line)
              last_col = math.max(line:len(), 1)
            else
              last_col = math.max(last_col, 1)
            end
            return { from = { line = first_line, col = 1 }, to = { line = last_line, col = last_col } }
          end,
        },
      }
    end,
  },
}
