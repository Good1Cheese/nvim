return {
    "GCBallesteros/jupytext.nvim",
    -- event = "BufRead /*.ipynb",
    lazy = false,
    config = function()
        require("jupytext").setup({
            style = "hydrogen",
            output_extension = "auto", -- Default extension. Don't change unless you know what you are doing
            force_ft = nil, -- Default filetype. Don't change unless you know what you are doing
            custom_language_formatting = {}
        })
    end
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
}
