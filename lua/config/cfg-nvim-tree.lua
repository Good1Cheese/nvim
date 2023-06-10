local statusOk, nvimTree = pcall( require, "nvim-tree" )
if not statusOk then return end

local configStatusOk, nvim_tree_config = pcall( require, "nvim-tree.config" )
if not configStatusOk then return end

local treeCb = nvim_tree_config.nvim_tree_callback

nvimTree.setup{
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        -- These icons are visible when you install web-devicons
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = "left",
        mappings = {
            list = {
                {
                    key = { "l", "<CR>", "o" },
                    cb = treeCb( "edit" )
                },
                {
                    key = "h",
                    cb = treeCb( "close_node" )
                },
                {
                    key = "v",
                    cb = treeCb( "vsplit" )
                },
            },
        },
    },
}