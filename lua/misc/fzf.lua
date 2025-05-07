local fzf = require('fzf-lua')

local M = {}

function print_table(t)
    for k, v in ipairs(t) do
        print(k, v)
    end
end

function create(selected, opts)
    local last_query = opts.last_query
    local path = opts.cwd .. '/' .. last_query
    if vim.endswith(path, '/') then
        vim.fn.system('mkdir -p ' .. path)
    else
        vim.fn.system('mkdir -p "$(dirname ' .. path .. ')" && touch ' .. path)
    end
    fzf.resume()
end

function create_and_edit(selected, opts)
    create(selected, opts)
    return vim.cmd('e ' .. opts.last_query)
end

function delete(selected, opts)
    for _, f in ipairs(selected) do
        -- remove all whitespace
        local file = vim.fn.slice(vim.trim(f), 1)
        local path = opts.cwd .. '/' .. file
        vim.fn.delete(path)
    end
    fzf.resume()
end

function up_dir(selected, opts)
    fzf.files({ cwd = vim.fs.dirname(opts.cwd) })
end

local actions = {
    files = {
        ['default'] = fzf.actions.file_edit_or_qf,
        ['ctrl-s'] = fzf.actions.file_split,
        ['ctrl-v'] = fzf.actions.file_vsplit,
        ['ctrl-t'] = fzf.actions.file_tabedit,
        ['ctrl-q'] = fzf.actions.file_sel_to_qf,
        ['ctrl-c'] = create,
        ['ctrl-d'] = delete,
        ['ctrl-u'] = up_dir,
    }
}

function files()
    local path = vim.fn.input("files in: ", vim.fn.expand("%:p:h"), "file")
    if path == nil or path == '' then return end

    -- if takes a file instead dir open fzf with preview of the file
    if vim.fn.filereadable(path) == 1 then
        local cmd = "find " .. vim.fs.dirname(path) .. " -iname " .. vim.fs.basename(path)

        local opts = {
            actions = actions.files,
            previewer = "builtin"
        }

        return fzf.fzf_exec(cmd, opts)
    end

    return fzf.files({ cwd = path })
end

M.files = files
M.create = create
M.create_and_edit = create_and_edit
M.delete = delete
M.actions = actions

return M
