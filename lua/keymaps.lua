local fzfutils = require('misc.fzf')

vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

vim.keymap.set({'n', 'v'}, '<Leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<Leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<Leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<Leader>P', '"+P')

vim.keymap.set('v', 'J', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('v', 'K', '<Esc>:m .-2<CR>==gi')

vim.keymap.set('n', '<Leader>,', ':vertical resize -5<CR>')
vim.keymap.set('n', '<Leader>.', ':vertical resize +5<CR>')

-- fzf-lua
vim.keymap.set('n', '<Leader>f', fzfutils.files)

vim.keymap.set('n', '<Leader>/', function ()
    local path = vim.fn.input("files in: ", vim.fn.expand("%:p:h"), "file")
    if path == nil or path == '' then return end

    return require("fzf-lua").live_grep({ cwd = path })
end, { silent = true })

vim.keymap.set('n', '<Leader>b', ':FzfLua buffers<CR>')
vim.keymap.set('n', '<Leader>gb', ':FzfLua git_bcommits<CR>')
vim.keymap.set('n', '<Leader>gc', ':FzfLua git_commits<CR>')
vim.keymap.set('n', '<Leader>gs', ':FzfLua git_status<CR>')
vim.keymap.set('n', '<Leader>gf', ':FzfLua git_files<CR>')
vim.keymap.set('n', '<Leader>t', ':FzfLua tags_live_grep<CR>')
vim.keymap.set('n', '<Leader>m', ':FzfLua marks<CR>')
vim.keymap.set('n', '<Leader>;', ':FzfLua resume<CR>')

vim.keymap.set('n', '<Leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>')

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
