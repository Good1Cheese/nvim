return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        rename = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        styles = {
            notification = {
                wo = { wrap = true } -- Wrap notifications
            }
        }
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader>n",  function() Snacks.picker.notifications() end,      desc = "Notification History" },
        -- search
        { "<leader>sd", function() Snacks.picker.diagnostics() end,        desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>u",  function() Snacks.picker.undo() end,               desc = "Undo History" },
        -- Other
        { "<leader>9c", function() Snacks.picker.colorschemes() end,       desc = "Colorschemes" },
        { "<leader>r",  function() Snacks.rename.rename_file() end,        desc = "Rename File" },
        { "<leader>L",  function() Snacks.lazygit() end,                   desc = "Lazygit" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
    end,
}
