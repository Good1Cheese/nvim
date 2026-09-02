local snippet_paths = { vim.fn.stdpath("config") .. "/snippets" }

if type(vim.g.vscode_snippets_path) == "string" and vim.g.vscode_snippets_path ~= "" then
    table.insert(snippet_paths, vim.fn.expand(vim.g.vscode_snippets_path))
end

return {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = {
                function(cmp)
                    if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
                        return cmp.accept()
                    end
                end,
                "snippet_forward",
                "show_and_insert",
                "select_next",
                "fallback",
            },
            ["<S-Tab>"] = {
                "snippet_backward",
                "show_and_insert",
                "select_prev",
                "fallback",
            },
        },

        appearance = {
            nerd_font_variant = "normal",
        },

        completion = {
            trigger = { prefetch_on_insert = false },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = {
                    border = "double",
                },
            },
            menu = {
                min_width = 50,
                max_height = 20,
                border = "single",
                draw = {
                    treesitter = { "lsp" },
                    padding = 2,
                    columns = {
                        { "kind_icon", gap = 1 },
                        { "label", "label_description", gap = 1 },
                        { "source_name" },
                    },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                if ctx.source_name == "Path" then
                                    local icon = require("nvim-web-devicons").get_icon(ctx.label)
                                    if icon then
                                        return icon .. ctx.icon_gap
                                    end
                                end
                                return ctx.kind_icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                if ctx.source_name == "Path" then
                                    local _, hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if hl then
                                        return hl
                                    end
                                end
                                return ctx.kind_hl
                            end,
                        },
                    },
                },
            },
            ghost_text = {
                enabled = true,
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "single",
                show_documentation = false,
            },
        },

        sources = {
            providers = {
                snippets = {
                    opts = {
                        search_paths = snippet_paths,
                    },
                },
            },
        },
    },
}
