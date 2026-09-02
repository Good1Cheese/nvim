return {
    "aznhe21/actions-preview.nvim",
    keys = {
        {
            "<leader>l",
            function()
                require("actions-preview").code_actions()
            end,
            mode = { "n", "v" },
            desc = "Code actions",
        },
    },
}
