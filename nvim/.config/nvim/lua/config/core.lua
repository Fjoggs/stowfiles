-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

-- colors
opt.termguicolors = true

-- backspace
opt.backspace = "indent,eol,start"

-- windows
opt.splitright = true
opt.splitbelow = true
