return {
    "NMAC427/guess-indent.nvim",
    -- Load before BufReadPost so the plugin's own detection autocmd also runs
    -- for a file passed directly on the nvim command line.
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
}
