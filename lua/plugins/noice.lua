local Plugin = { "folke/noice.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = {
	{ "MunifTanjim/nui.nvim" },
}

function Plugin.config()
	require("noice").setup({
		lsp = {
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
	})
end

return Plugin
