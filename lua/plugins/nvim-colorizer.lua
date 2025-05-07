return {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    cmd = {"ColorizerAttachToBuffer", "ColorizerReloadAllBuffers", "ColorizerToggle"},
    opts = {
        '*',
        DEFAULT_OPTIONS = {
            mode = 'background',
            RGB = true,
            RRGGBB = true,
            RRGGBBAA = true,
            rgb_fn = true,
            hsl_fn = true,
            names = false
        }
    },
    config = function (_, opts)
        require('colorizer').setup(opts)
    end
}
