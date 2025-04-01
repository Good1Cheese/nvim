local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
	formatters_by_ft = {
		python = { "ruff_format" },
		cpp = { "clang-format" },
		sh = { "shfmt" },
		-- rb = { "solargraph" },
		-- nix = { "nixfmt" },
		-- gdscript = { "gdformat" },
		["_"] = { "trim_whitespace" },
	},
}


Plugin.formatters = {
	["clang-format"] = {
		command = "clang-format",
		args = { "--style=file:$HOME/.clang-format" },
	},
	gdformat = {
		cmd = "gdformat",
		args = "--fast",
	},
	["ruff-format"] = {
		command = "ruff",
		args = { "format", "$FILENAME" },
	},
}

return Plugin
