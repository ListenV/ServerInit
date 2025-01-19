-- Modes
--   '': Normal, Visual, Select, Operator-pending
--   n: Normal
--   v: Visual and Select 
--   s: Select
--   x: Visual
--   i: Insert
--   o: Operator-pending (dc)
--   '!': Insert and Command-line
--   l: Insert, Command-line, Lang-Arg
--   t: Terminal
--   c: Command-line

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- 第一个参数：（n, i, v, c）代表vim所处的四种模式 Normal、Insert、Visual、Command
-- 第二个参数：代表要设置的快捷键
-- 第三个参数：代表实际的按键
-- 第四个参数：opts 可选参数
-- 参考：https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings

------------------------------------------------------------------------------
-- 基础按键映射
------------------------------------------------------------------------------
-- 让空格在Normal模式下失去原本作用 因为他是现在leader键
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

-- fix :set wrap
--vim.keymap.set("n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下滚动浏览
-- map({'n', 'v'}, "<C-j>", "5j")
-- map({"n", 'v'}, "<C-k>", "5k")
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
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

-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I")
-- map("i", "<C-l>", "<ESC>A")

------------------------------------------------------------------
-- window 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
--map("n", "s", "", opt)
--map("n", "sv", ":vsp<CR>", opt)
--map("n", "sh", ":sp<CR>", opt)
---- 关闭当前
--map("n", "sc", "<C-w>c", opt)
---- 关闭其他
--map("n", "so", "<C-w>o", opt) -- close others
-- ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", {desc = 'Window left'})
map("n", "<C-j>", "<C-w>j", {desc = 'Window down'})
map("n", "<C-k>", "<C-w>k", {desc = 'Window up'})
map("n", "<C-l>", "<C-w>l", {desc = 'Window right'})

-- 左右比例控制
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>")
-- 上下比例
map("n", "<C-Down>", "<Cmd>resize +2<CR>")
map("n", "<C-Up>", "<Cmd>resize -2<CR>")
-- 相等比例
--map("n", "s=", "<C-w>=")

------------------------------------------------------------------------------
-- Command 模式命令相关
------------------------------------------------------------------------------

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>")
map("c", "<C-k>", "<C-p>")

------------------------------------------------------------------------------
-- Terminal相关
------------------------------------------------------------------------------
--map("n", "st", ":sp | terminal<CR>")
--map("n", "stv", ":vsp | terminal<CR>")
-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]])
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]])
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]])
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]])
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]])
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]])
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]])
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]])
