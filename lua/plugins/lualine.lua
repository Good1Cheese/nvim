local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
	local cyberdream = require("lualine.themes.cyberdream")

	require("lualine").setup({
		options = {
			theme = "cyberdream",
			icons_enabled = true,
			component_separators = "|",
			section_separators = "",
			disabled_filetypes = {
				statusline = { "neo-tree", "", "toggleterm" },
			},
		},
	})
end

function Plugin.init()
	vim.opt.showmode = false
end

return Plugin
