local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufWritePre" }
Plugin.cmd = { "ConformInfo" }

Plugin.keys = {
    {
        "<F3>",
        function()
            require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
    },
}

Plugin.opts = {
    log_level = vim.log.levels.DEBUG,
    notify_no_formatters = true,

    default_format_opts = {
        lsp_format = "fallback",
    },

    formatters_by_ft = {
        rust = { "rustfmt", lsp_format = "fallback" },
        python = { "ruff_format", lsp_format = "fallback" },
        go = { "golangci-lint" },
        lua = { "emmylua_codeformat" },
        cs = { "csharpier" },
        ["*"] = { "trim_whitespace" },
    },

    formatters = {
        emmylua_codeformat = {
            -- This can be a string or a function that returns a string.
            -- When defining a new formatter, this is the only field that is required
            command = "emmylua-codeformat",
            -- A list of strings, or a function that returns a list of strings
            -- Return a single string instead of a list to run the command in a shell
            args = { "format", "-f", "$FILENAME" },
        },
    }

}

return Plugin
