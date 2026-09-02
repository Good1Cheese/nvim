return {
    "mason-org/mason.nvim",
    lazy = false,
    keys = {
        { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
        ui = {
            -- Border inherits the global 'winborder' option.
            icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
            },
        },
    },
}
