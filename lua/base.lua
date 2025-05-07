local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4

opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = 'trail:␣,tab:>>,nbsp:~,multispace:   |'

opt.nrformats = 'alpha,bin,octal,hex'

opt.undodir = vim.fn.expand("$HOME/.local/state/nvim/undodir")
opt.undofile = true

vim.opt_local.tags:append(vim.fn.expand("$HOME/.local/state/nvim/tags/systags"))
opt.completeopt = 'menu,preview,fuzzy'
opt.autochdir = true
--opt.wildoptions = 'fuzzy,pum,tagfile'

opt.foldmethod = manual

g.mapleader = ' '
g.maplocalleader = '\\'

g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

vim.cmd([[au BufWritePost *.c,*.cpp,*.h silent! !ctags --kinds-="*" R &]])
vim.cmd([[autocmd VimResized * exe "normal \<c-w>="]])
