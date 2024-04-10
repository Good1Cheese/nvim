local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
	options = {
		-- theme = "tokyonight",
		icons_enabled = true,
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {
			statusline = { "neo-tree", "" },
		},
	},
}

function Plugin.init()
	vim.opt.showmode = false
end

return Plugin
