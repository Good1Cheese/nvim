return {
    "chrishrb/gx.nvim",
    submodules = false,
    keys = {
        { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } }
    },
    cmd = { "Browse" },
    config = function()
        require("gx").setup({
            open_browser_app = "xdg-open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
            -- open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
        })
    end,
}
