return {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = {
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
        -- "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
        -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
        -- "super-tab" for mappings similar to vscode (tab to accept)
        -- "enter" for enter to accept
        -- "none" for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "enter",

            -- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            -- ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<Tab>"] = {
                function(cmp)
                    if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
                end,
                "show_and_insert",
                "select_next",
            },
            ["<S-Tab>"] = { "show_and_insert", "select_prev" },
        },

        appearance = {
            -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "normal"
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            trigger = { prefetch_on_insert = false },

            accept = {
                auto_brackets = {
                    enabled = true
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
                window = {
                    border = "single"
                },
            },

            list = {
                selection = {
                    preselect = true,
                    auto_insert = false
                }
            },

            menu = {
                min_width = 50,
                max_height = 20,

                draw = {
                    treesitter = { "lsp" },
                    padding = 2,
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            -- Optionally, use the highlight groups from nvim-web-devicons
                            -- You can also add the same function for `kind.highlight` if you want to
                            -- keep the highlight groups in sync with the icons.
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        }
                    }
                }
                -- auto_show = false, -- onlycompletion.menu.auto_show = false -- only show menu on manual <C-space> show menu on manual <C-space>
            },
            ghost_text = {
                enabled = true,
                -- show_with_menu = false,
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "single",
            },
        },
        sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        snippets = { preset = "luasnip" },
        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
