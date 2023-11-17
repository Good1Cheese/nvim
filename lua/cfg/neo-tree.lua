require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
        }
    },
    window = {
        mappings = {
            ["<space>"] = "none",
            ["H"] = "none",
            ["l"] = "open",
        },
    },
})
