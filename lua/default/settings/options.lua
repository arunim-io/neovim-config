vim.g.mapleader = ' '

local opt = vim.opt

opt.number = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true
opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

opt.updatetime = 25
opt.colorcolumn = '80'
