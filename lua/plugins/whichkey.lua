local Plugin = { "folke/which-key.nvim" }

Plugin.lazy = false

function Plugin.config()
    local which_key = require("which-key")

    which_key.setup({
        preset = "modern",
        win = {
            border = "rounded", -- none, single, double, shadow
            title = false,
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            wo = {
                winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
    })

    which_key.add({
        { "<leader>s",     ":Silicon<cr>",                                         desc = "Make screenshot",   mode = "v" },

        { "<leader>m",     ":Mason<cr>",                                           desc = "Mason",             hidden = true },
        { "<leader>p",     ":Lazy<cr>",                                            desc = "Lazy",              hidden = true },
        { "<leader>C",     ":RunClose<cr>",                                        desc = "Close tests",       hidden = true },
        { "<leader>e",     ":Oil<cr>",                                             desc = "Explorer",          hidden = true },
        { "<leader>q",     ":wqa<cr>",                                             desc = "Save & Quit",       hidden = true },
        { "<leader>a",     ":Outline<cr>",                                         desc = "Code outlaw" },
        { "<leader>l",     [[:lua require("actions-preview").code_actions()<cr>]], desc = "Code actions" },
        { "<leader>c",     ":w<CR>:RunFile<CR>",                                   desc = "RunFile" },
        { "<leader>s",     ":Telescope live_grep<cr>",                             desc = "Find symbols" },
        { "<leader>f",     ":Telescope find_files<cr>",                            desc = "Find files" },
        { "<leader>S",     ":Telescope resume<cr>",                                desc = "Find prev" },
        { "<leader>9",     group = "Stuff" },
        { '<leader>9"',    ":%s/'/\"/g",                                           desc = "Replace all quotes" },
        { "<leader>9s",    ":Suw<cr>",                                             desc = "Sudo save" },
        { "<leader>9<cr>", ":.!bash<cr>",                                          desc = "Execute in bash" },
    })
end

return Plugin
