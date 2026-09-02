return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Next TODO comment",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Previous TODO comment",
        },
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "TODO comments",
        },
        {
            "<leader>xt",
            "<cmd>Trouble todo toggle<cr>",
            desc = "TODOs (Trouble)",
        },
    },
}
