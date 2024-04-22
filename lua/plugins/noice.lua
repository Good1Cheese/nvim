local Plugin = { "folke/noice.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = {
	{ "MunifTanjim/nui.nvim" },
}

function Plugin.config()
	require("noice").setup({})
end

return Plugin
