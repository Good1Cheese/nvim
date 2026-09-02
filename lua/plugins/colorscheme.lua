return {
    "Shatur/neovim-ayu",
    priority = 1000,
    lazy = false,
    dependencies = {
        -- Keep Cyberdream installed for the Lualine theme and for quick
        -- colorscheme switching without making it the active editor theme.
        "scottmckendry/cyberdream.nvim",
    },
    config = function()
        vim.cmd.colorscheme("ayu")
    end,
}
