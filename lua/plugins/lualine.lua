local function progress_status()
    local parts = {}

    local progress = vim.ui.progress_status()
    if progress ~= "" then
        parts[#parts + 1] = progress
    end

    local lsp = vim.lsp.status()
    if lsp ~= "" then
        parts[#parts + 1] = lsp
    end

    return table.concat(parts, " ")
end

return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "cyberdream",
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
                disabled_filetypes = {
                    statusline = { "neo-tree", "", "snacks_terminal" },
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                -- Generic Neovim progress messages and LSP work-done progress
                -- use separate native channels in 0.12, so render both.
                lualine_x = { progress_status },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })

        local group = vim.api.nvim_create_augroup("LualineNativeProgress", { clear = true })
        vim.api.nvim_create_autocmd({ "Progress", "LspProgress" }, {
            group = group,
            callback = function()
                vim.cmd("redrawstatus")
            end,
            desc = "Refresh lualine for native progress messages",
        })
    end,
}
