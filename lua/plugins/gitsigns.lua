local Plugin = { "lewis6991/gitsigns.nvim" }

Plugin.event = { "BufReadPost", "BufNewFile" }

Plugin.opts = {
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "󰍵" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "│" },
	}
}

return Plugin
