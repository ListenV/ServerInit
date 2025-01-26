local opt = vim.opt

opt.termguicolors = true
opt.autowrite = true
opt.confirm = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undolevels = 100
opt.autoread = true

opt.completeopt = "menu,menuone,noselect"

opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 18

opt.wrap = false
opt.whichwrap = "<,>,[,]"

opt.list = true
opt.listchars = "tab:»·,trail:·,extends:>,precedes:<"

opt.hidden = true


opt.number = true
opt.colorcolumn = "80"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true


opt.wildmenu = true
opt.shortmess:append('c')  -- 将显示的一些信息变为缩写，可使用`:h shortmess`查看详细信息


opt.updatetime = 300
opt.timeoutlen = 500

opt.clipboard = "unnamedplus"

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
