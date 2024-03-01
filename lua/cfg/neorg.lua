require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"] = { config = { icon_preset = "diamond" } },
        ["core.keybinds"] = {
            -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            config = {
                default_keybinds = true,
                neorg_leader = "_",
            },
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    Notes = "~/notes",
                }
            }
        },
    }
})
