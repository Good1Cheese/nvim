-- Bubbles config for lualine
-- Author: lokesh-krishna

require("lualine").setup {
    options = {
        theme = "auto",
        disabled_filetypes = { "dashboard", "neo-tree" },
        component_separators = "|",
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}
