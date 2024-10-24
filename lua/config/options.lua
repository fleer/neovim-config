-- ============================================================================ "
-- ===                            General Config                            === "
-- ============================================================================ "

vim.opt.encoding = "UTF-8"
vim.opt.fileformat = "unix"
-- Highlight current cursor line
vim.opt.cursorline = true
-- Yank and paste with the system clipboard
vim.opt.clipboard = "unnamedplus"
-- Hides buffers instead of closing them
vim.opt.hidden = true
-- Mouse Support
vim.opt.mouse = "a"
-- === TAB/Space settings ===
-- Insert spaces when TAB is pressed.
vim.opt.expandtab = true
-- Change number of spaces that a <Tab> counts for during editing ops
vim.opt.softtabstop = 2
-- Indentation amount for < and > commands.
vim.opt.shiftwidth = 2
-- See 8 lines at anytime above and below curser
vim.opt.scrolloff = 8
-- Set scrollback size
vim.opt.scrollback = 100000
-- Set number of characters per line to 80
vim.opt.textwidth = 80
-- do not wrap long lines by default
vim.opt.wrap = true
-- Don't highlight current cursor line
--vim.opt.nocursorline
-- Autovim.opt.to current directory
--vim.opt.autochdir
-- Better display for messages
vim.opt.cmdheight = 1
-- Incremental (“live”) :substitute function
vim.opt.inccommand = "split"
-- ignore case when searching
-- vim.opt.ignorecase = true
-- if the search string has an upper case letter in it, the search will be case sensitive
-- vim.opt.smartcase = true
-- Automatically re-read file if a change was detected outside of vim
vim.opt.autoread = true
-- No swap file
vim.opt.swapfile = false

-- Treesitter based folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Use nvim-ufo
-- vim.o.foldcolumn = '1' -- '0' is not bad
-- vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = -1
-- vim.o.foldenable = true

-- ============================================================================ "
-- ===                               Development                            === "
-- ============================================================================ "

-- Ignore folders and files when searching via vimgrep
vim.opt.wildignore = "*/node_modules/**,*/.git/**,*/dist/**,*/build/**,*.venv/**"

-- JoosepAlviste/nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

-- ============================================================================ "
-- ===                                UI                                    === "
-- ============================================================================ "
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative numbers

-- Enable true color support
vim.opt.termguicolors = true -- True color support

-- Set floating window to be slightly transparent
vim.opt.winbl = 10

-- === Set local leader ===
vim.g.maplocalleader = ","

-- Don't display ~ at the beginning of empty lines
vim.opt.fillchars = "eob: "

package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
