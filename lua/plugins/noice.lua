local Plugin = { "folke/noice.nvim" }

Plugin.event = "VeryLazy"

Plugin.cond = vim.g.vscode

Plugin.enabled = false

Plugin.dependencies = {
    { "MunifTanjim/nui.nvim" }
}

function Plugin.config()
    require("noice").setup({
        lsp = {
            signature = {
                enabled = false
            },
            hover = {
                enabled = false
            }
        },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        presets = {
            bottom_search = true,         -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
        routes = {
            {
                filter = {
                    event = "lsp",
                    kind = "progress",
                    find = "jdtls"
                },
                opts = { skip = true }
            }
        }
    })
end

return Plugin
