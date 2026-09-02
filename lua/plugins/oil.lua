local Plugin = { "stevearc/oil.nvim" }

Plugin.lazy = false
Plugin.keys = {
    { "<leader>e", "<cmd>Oil<cr>", desc = "Explorer" },
}
Plugin.dependencies = {
    { "JezerM/oil-lsp-diagnostics.nvim", opts = {} },
}

-- Used by Oil's window-local winbar expression.
function _G.get_oil_winbar()
    local winid = vim.g.statusline_winid or 0
    local bufnr = vim.api.nvim_win_get_buf(winid)
    local dir = require("oil").get_current_dir(bufnr)

    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    end

    return vim.api.nvim_buf_get_name(bufnr)
end

function Plugin.config()
    require("oil").setup({
        -- Only deviations from upstream defaults live here.
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        watch_for_changes = true,
        keymaps = {
            ["l"] = "actions.select",
            ["R"] = "actions.refresh",
            ["h"] = { "actions.parent", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        },
        view_options = {
            show_hidden = true,
        },
    })
end

return Plugin
