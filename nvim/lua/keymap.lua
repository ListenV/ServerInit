vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("", "<Space>", "<Nop>")

map("n", "<Leader>w", "<Cmd>w<CR>", {desc = 'save file'})
map("n", "<Leader>q", "<Cmd>q<CR>", {desc = 'quit'})
map("n", "<Leader>x", "<Cmd>x<CR>", {desc = 'save and quit'})
-- 退出
map("n", "<Leader>!q", "<Cmd>q!<CR>", {desc = 'force quit'})

-- 行首、行尾光标移动按键映射；H和L原本功能是将光标移动到当前屏幕的顶、底端，用的较少，而^和$不好按，遂换之
map("", "H", "^", {remap = true, desc = 'move to home'})
map("", "L", "$", {remap = true, desc = 'move to end'})

-- 复制到行尾
map("n", "Y", "y$", {desc = 'yank to end'})

-- 取消撤销操作（也叫重做）
map("n", "U", "<C-r>", {desc = 'redo'})

-- 位置标记与跳转
map("n", "'", "`")
map("n", "`", "'")

-- 删除m标记
map("n", "m<Space>", "<Cmd>delmarks!<CR>", {desc = 'delete all marks'})

-- 取消 Vim 查找高亮显示
map('n', '<Esc>', '<Cmd>noh<CR>', {desc = 'Clear highlights'})

-- 搜索结果居中展示
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "*", "*zz")
map("n", "#", "#zz")
map("n", "g*", "g*zz")

map("n", "<C-u>", "10k", {desc = 'move to top 10'})
map("n", "<C-d>", "10j", {desc = 'move to bottom 10'})
map('i', '<C-v>', '<Esc>"+pa', {desc = 'paste in insert mode'})
map('v', '<C-c>', '"+y', {desc = 'copy in selected mode'})

-- visual模式下缩进代码
map("v", "<", "<gv", {desc = 'indent to left'})
map("v", ">", ">gv", {desc = 'indent to right'})

-- 上下移动选中文本  (不能用 <Cmd> 来代替 : )
map("v", "K", ":move '<-2<CR>gv-gv", {desc = 'Move selected text to top'})
map("v", "J", ":move '>+1<CR>gv-gv", {desc = 'Move selected text to bottom'})


-- ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", {desc = 'Window left'})
map("n", "<C-j>", "<C-w>j", {desc = 'Window down'})
map("n", "<C-k>", "<C-w>k", {desc = 'Window up'})
map("n", "<C-l>", "<C-w>l", {desc = 'Window right'})
