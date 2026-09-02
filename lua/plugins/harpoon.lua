return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<A-d>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list(), {
                    border = "rounded",
                    title_pos = "center",
                    ui_width_ratio = 0.40,
                })
            end,
            desc = "Harpoon menu",
        },
        {
            "<A-e>",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon add file",
        },
        {
            "<A-1>",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon file 1",
        },
        {
            "<A-2>",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon file 2",
        },
        {
            "<A-3>",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon file 3",
        },
        {
            "<A-4>",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon file 4",
        },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "l", function()
                    harpoon.ui:select_menu_item()
                end, { buffer = cx.bufnr, desc = "Open Harpoon item" })

                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr, desc = "Open in vertical split" })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr, desc = "Open in horizontal split" })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr, desc = "Open in new tab" })
            end,
        })
    end,
}
