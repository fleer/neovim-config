-- Go to last location when opening a buffer
local last_loc = vim.api.nvim_create_augroup("last_loc", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  -- group = augroup "last_loc",
  group = last_loc,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto Indent the Current Empty Line
-- See https://alpha2phi.medium.com/modern-neovim-configuration-hacks-93b13283969f
vim.keymap.set("n", "i", function()
  if #vim.fn.getline "." == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })

-- Auto Create Intermediary Directories
local auto_create_dir = vim.api.nvim_create_augroup("last_loc", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = auto_create_dir,
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- === Set/Unset Relative Number ===
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  callback = function()
    vim.cmd [[if &nu && mode() != "i" | set rnu   | endif]]
  end,
  group = numbertoggle,
  pattern = "*",
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  callback = function()
    vim.cmd [[if &nu                  | set nornu | endif]]
  end,
  group = numbertoggle,
  pattern = "*",
})

-- Check if we need to reload the file when it changed
-- vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Go to last loc when opening a buffer
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "<buffer>",
--       once = true,
--       callback = function()
--         vim.cmd(
--           [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]]
--         )
--       end,
--     })
--   end,
-- })

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "OverseerForm",
    "OverseerList",
    "floggraph",
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-summary",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "toggleterm",
    "tsplayground",
    "vim",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- ============================================================================ "
-- ===                                 MISC.                                === "
-- ============================================================================ "

-- Create nice PDF from Markdown using eisvogel template
-- https://github.com/Wandmalfarbe/pandoc-latex-template
vim.api.nvim_command ":command Md2pdf !pandoc % -o %:r.pdf --from markdown --template eisvogel --listings --pdf-engine=xelatex"
