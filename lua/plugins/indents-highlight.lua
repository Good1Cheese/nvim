local Plugin = { "lukas-reineke/indent-blankline.nvim" }

Plugin.main = "ibl"

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.opts = {
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
	},
}

return Plugin
