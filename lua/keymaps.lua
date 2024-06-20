
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

vim.keymap.set({'n', 'v'}, '<Leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<Leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<Leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<Leader>P', '"+P')

vim.keymap.set('v', 'J', 'inoremap <c-j> <Esc>:m .+1<CR>==gi')
vim.keymap.set('v', 'K', 'inoremap <c-j> <Esc>:m .-2<CR>==gi')

vim.keymap.set('n', '<Leader>,', ':vertical resize -5<CR>')
vim.keymap.set('n', '<Leader>.', ':vertical resize +5<CR>')
