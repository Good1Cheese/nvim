return {
    "chrishrb/gx.nvim",
    submodules = false,
    keys = {
        { "gx", "<cmd>Browse<cr>", mode = { "n", "x" }, desc = "Smart open link" },
    },
    cmd = { "Browse" },
    opts = {
        -- gx.nvim is kept for its GitHub/package/go/search handlers, not just
        -- for the basic URL opening that Neovim now provides natively.
        open_browser_app = "librewolf",
    },
}
