local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = 'trail:␣,tab:>>,nbsp:~,multispace:   |'

opt.nrformats = 'alpha,bin,octal,hex'

g.mapleader = ' '
g.maplocalleader = '\\'
