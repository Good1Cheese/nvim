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
		go = { "golangci-lint" },
		cs = { "csharpier" },
		["*"] = { "trim_whitespace" },
	}
}


return Plugin
