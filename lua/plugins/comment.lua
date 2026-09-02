local Plugin = { "numToStr/Comment.nvim" }

Plugin.dependencies = {
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup({
                -- Comment.nvim's pre_hook computes the correct commentstring on
                -- demand, so the CursorHold autocmd is unnecessary work.
                enable_autocmd = false,
            })
        end,
    },
}

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
    require("Comment").setup({
        toggler = {
            line = "<A-/>",
        },
        opleader = {
            line = "<A-/>",
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
end

return Plugin
