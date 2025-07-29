local Plugin = { "mason-org/mason.nvim" }

Plugin.dependencies = {
    -- { "neovim/nvim-lspconfig" },
    { "aznhe21/actions-preview.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "j-hui/fidget.nvim",           opts = {} },
}

Plugin.lazy = false
-- Plugin.event = "VeryLazy"

function Plugin.config()
    require("mason").setup({
        ui = {
            border = "rounded",
            icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
            },
            keymaps = {
                toggle_server_expand = "<CR>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "X",
                cancel_installation = "<C-c>",
            },
        }
    })
end

return Plugin
