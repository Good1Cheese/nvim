return {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    keys = {
        { "<leader>s", "<cmd>Silicon<cr>", mode = "v", desc = "Make screenshot" },
    },
    -- Upstream renamed the Lua module from `silicon` to `nvim-silicon`.
    -- Setting main lets lazy.nvim call the current module directly.
    main = "nvim-silicon",
    opts = {
        font = "JetBrainsMono Nerd Font=35",
        theme = "Coldark-Dark",
        pad_horiz = 100,
        pad_vert = 80,
        to_clipboard = true,
        no_line_number = true,
        line_offset = 1,
        output = nil,
        window_title = function()
            return vim.fn.bufname(vim.fn.bufnr())
        end,
    },
}
