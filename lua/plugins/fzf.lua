return {
    "ibhagwan/fzf-lua",
    opts = function ()
        return {
            actions = require('misc.fzf').actions
        }
    end,
}
