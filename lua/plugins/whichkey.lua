return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        win = {
            title = false,
            padding = { 1, 2 },
            wo = {
                winblend = 10,
            },
        },
    },
    config = function(_, opts)
        local which_key = require("which-key")
        which_key.setup(opts)
        which_key.add({
            { "<leader>9", group = "Stuff" },
        })
    end,
}
