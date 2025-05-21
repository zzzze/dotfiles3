-- appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0
vim.cmd("set guioptions-=r")
vim.cmd("set guioptions-=L")
vim.cmd("set guioptions-=b")
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.langmenu = "zh_CN.UTF-8"
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.fillchars = "vert: "
vim.opt.fcs = "eob: "

-- coding
vim.o.syntax = "on"
vim.opt.wrap = false
vim.opt.fileformat = "unix"
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backspace:append({ "indent", "eol", "start" })
vim.opt.showmatch = true
vim.opt.scrolloff = 5
vim.opt.laststatus = 3
vim.opt.expandtab = true

-- others
vim.opt.mouse = a
vim.opt.selection = "inclusive"
vim.opt.selectmode:append("mouse,key")
vim.opt.matchtime = 5
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.whichwrap:append("<,>,h,l")
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.wildignore:append("*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,*/node_modules/*")
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "#region,#endregion"
vim.opt.compatible = false
