vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("", "<Space>", "<Nop>")

map("n", "<Leader>w", "<Cmd>w<CR>", {desc = 'save file'})
map("n", "<Leader>q", "<Cmd>q<CR>", {desc = 'quit'})
map("n", "<Leader>x", "<Cmd>x<CR>", {desc = 'save and quit'})
map("n", "<Leader>!q", "<Cmd>q!<CR>", {desc = 'force quit'})

map("", "H", "^", {remap = true, desc = 'move to home'})
map("", "L", "$", {remap = true, desc = 'move to end'})

map("n", "Y", "y$", {desc = 'yank to end'})

map("n", "U", "<C-r>", {desc = 'redo'})

map("n", "'", "`")
map("n", "`", "'")

map("n", "m<Space>", "<Cmd>delmarks!<CR>", {desc = 'delete all marks'})

map('n', '<Esc>', '<Cmd>noh<CR>', {desc = 'Clear highlights'})

map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "g*", "g*zz")

map("n", "<C-u>", "10k", {desc = 'move to top 10'})
map("n", "<C-d>", "10j", {desc = 'move to bottom 10'})
map('i', '<C-v>', '<Esc>"+pa', {desc = 'paste in insert mode'})
map('v', '<C-c>', '"+y', {desc = 'copy in selected mode'})

map("v", "<", "<gv", {desc = 'indent to left'})
map("v", ">", ">gv", {desc = 'indent to right'})

-- 上下移动选中文本  (不能用 <Cmd> 来代替 : )
map("v", "K", ":move '<-2<CR>gv-gv", {desc = 'Move selected text to top'})
map("v", "J", ":move '>+1<CR>gv-gv", {desc = 'Move selected text to bottom'})

map("n", "<C-h>", "<C-w>h", {desc = 'Window left'})
map("n", "<C-j>", "<C-w>j", {desc = 'Window down'})
map("n", "<C-k>", "<C-w>k", {desc = 'Window up'})
map("n", "<C-l>", "<C-w>l", {desc = 'Window right'})
