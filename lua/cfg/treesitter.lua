require("nvim-treesitter.configs").setup({
    ejnsure_installed = { "cpp", "python", "lua", "javascript" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
})
