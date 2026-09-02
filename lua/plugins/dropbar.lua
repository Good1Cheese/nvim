return {
    "Bekaboo/dropbar.nvim",
    -- dropbar initializes its expensive parts lazily on its own; upstream does
    -- not recommend plugin-manager lazy-loading for the base plugin.
    lazy = false,
    config = function()
        local dropbar_api = require("dropbar.api")
        vim.keymap.set("n", "<A-;>", dropbar_api.pick, { desc = "Pick symbols in winbar" })
        vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
        vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
}
