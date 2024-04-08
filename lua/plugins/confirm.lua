local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang-format" },
		sh = { "shfmt" },
	},
	format_on_save = {
	    lsp_fallback = true,
	    async = false,
	    timeout_ms = 1000,
	},
}

Plugin.formatters = {
	command = "clang-format",
	args = { "--style=file:/home/cheese/.clang-format" },
}

return Plugin
