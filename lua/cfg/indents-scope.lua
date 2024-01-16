require('mini.indentscope').setup({
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})
