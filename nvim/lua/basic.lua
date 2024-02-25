local opt = vim.opt
local g = vim.g

------------------------------- 基础配置 ------------------------------------------

g.encoding = "UTF-8"     -- utf8编码
opt.fileencoding = "utf-8"

opt.termguicolors = true -- 开启GUI颜色支持

opt.autowrite = true     -- 自动保存
opt.confirm = true       -- 直接退出时，确认保存
opt.backup = false       -- 覆盖文件时, 禁止创建备份文件
opt.writebackup = false  -- 如果一个文件正在被另一个程序编辑(或在另一个程序编辑时写入文件), 则不允许编辑
opt.swapfile = false     -- 缓冲区是否使用交换文件
opt.undofile = true      -- 把撤销信息写入一个文件里 (这样可以永久保存撤销信息)
opt.undolevels = 1000    -- 保存撤销记录数

opt.autoread = true      -- 当文件被外部程序修改时，自动加载
opt.mouse = "a"          -- 鼠标支持
opt.mousemodel = 'extend'  -- 

------------------------------- 编辑器部分 -----------------------------------------

opt.completeopt = "menu,menuone,noselect"

opt.cursorline = true      -- 高亮当行
opt.scrolloff = 8          -- 光标 jk 时, 上下保留8行
opt.sidescrolloff = 18     -- 光标 hl 时, 左右保留18列

opt.wrap = false           -- 禁止折行
opt.whichwrap = "<,>,[,]"  -- 光标在行首尾时<Left><Right>可以跳到下一行

opt.list = true            -- 是否显示不可见字符
opt.listchars = "tab:»·,trail:·,extends:>,precedes:<" -- 将不可见字符转换为指定的字符

-- 折叠相关
opt.foldlevel = 99
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.hidden = true        -- 允许隐藏被修改过的buffer

--------------------------------- UI ------------------------------------------

opt.number = true          -- 开启行号
opt.numberwidth = 2        -- 行号宽度: 2
opt.relativenumber = false  -- 使用相对行号
opt.colorcolumn = "80"     -- 高亮第80列 (超过表示代码太长了，考虑换行)

opt.signcolumn = "yes"   -- 显示左侧图标指示列

opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

----------------------------------- 缩进相关 --------------------------------------

opt.tabstop = 2        -- 1 Tab 等于 2 空格
opt.softtabstop = 2    -- 1 Tab 等于 2 空格
opt.shiftwidth = 2     -- >> << 时移动长度
opt.shiftround = true  -- 缩进列数对齐到 `shiftwidth` 值的整数倍
opt.expandtab = true   -- 空格替代tab

opt.autoindent = true  -- 新行对齐当前行
opt.smartindent = true


------------------------------------ 搜索设置 -------------------------------------

opt.ignorecase = true  -- 搜索大小写不敏感，除非包含大写
opt.smartcase = true

opt.hlsearch = true    -- 搜索不要高亮
opt.incsearch = true   -- 边输入边搜索

------------------------------------ 状态栏设置 ------------------------------------

opt.showmode = false       -- 不显示 vim 当前模式 (有状态栏插件)
opt.showtabline = 2        -- 显示顶部 tabline
opt.cmdheight = 2          -- 命令行高为2，提供足够的显示空间
opt.ruler = false        -- 显示光标的位置（位于哪一行哪一列）(默认开启)
opt.wildmenu = true        -- 命令补全增强
opt.shortmess:append('c')  -- 将显示的一些信息变为缩写，可使用`:h shortmess`查看详细信息
opt.pumheight = 10         -- 补全最多显示10行

opt.completeopt = "menu,menuone,noselect,noinsert"  -- 自动补全不自动选中

-- NeoVim 0.7 新特性, 控制何时显示状态栏（0不显示，1至少有两个窗口才显示，2总是显示，3总是在最后一个窗口显示）
opt.laststatus = 3

------------------------------------- 其他设置 ------------------------------------

opt.updatetime = 300          -- 刷新交换文件所需的毫秒数(默认4000ms)
opt.timeoutlen = 500          -- 键盘连击等待时间 500 ms

opt.splitbelow = true         -- split window 从下边和右边出现
opt.splitright = true

opt.clipboard = "unnamedplus" -- 使用系统剪切板

if vim.fn.has("nvim-0.8") == 1 then
  opt.splitkeep = "screen"
end

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
