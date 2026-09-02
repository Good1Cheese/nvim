local Plugin = { "RRethy/vim-illuminate" }

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
}

Plugin.opts = {
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    -- This option replaces upstream's denylist, so keep its defaults and add Oil.
    filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
        "oil",
    },
}

function Plugin.config(_, opts)
    local group = vim.api.nvim_create_augroup("IlluminateConfig", { clear = true })

    local function set_highlights()
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#525252" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#525252" })
    end

    set_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_highlights,
        desc = "Restore vim-illuminate highlights after colorscheme changes",
    })

    require("illuminate").configure(opts)

    local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
            require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- Also set it after loading ftplugins, since a lot overwrite [[ and ]].
    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
        end,
    })
end

return Plugin
