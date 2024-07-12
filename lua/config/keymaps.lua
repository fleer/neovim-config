local keymap = vim.keymap.set

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste over currently selected text without yanking it
-- keymap("v", "p", '"_dp')

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Resize window using <shift> arrow keys
keymap("n", "<S-Up>", "<cmd>resize +2<CR>")
keymap("n", "<S-Down>", "<cmd>resize -2<CR>")
keymap("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
keymap("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- === Search shorcuts === "
--   <leader>h - Find and replace
--   <leader>/ - Clear highlighted search terms while preserving history
-- keymap("n", "<leader>h", ":%s###<left><left>")
-- keymap("n", "<leader>/", ":nohlsearch<CR>")

-- Clear Quickfix list
-- keymap("n", "<leader>q", "<cmd>call setqflist([])<cr>")

-- Macro recording
-- Use recording in q and go to next line
keymap("n", "Q", "@qj")
-- Apply macro to visual selection
keymap("x", "Q", ":norm @q<CR>")

-- Improved Iron.nvim by send and go to next line
keymap("n", "<C-cr>", "<cmd>lua require('iron').core.send_line()<CR>j")
keymap("v", "<C-cr>", "<cmd>lua require('iron').core.visual_send()<CR>j")
