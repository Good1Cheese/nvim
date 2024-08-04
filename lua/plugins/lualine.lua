local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }
Plugin.dependencies = { "ecthelionvi/NeoComposer.nvim" }

function Plugin.config()
	local rec = require("NeoComposer.ui")

	require("cyberdream").setup()
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
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename", rec.status_recording },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
			-- lualine_y = { rec.displaySlots },
			-- lualine_z = { rec.recordingStatus },
		},
	})
end

function Plugin.init()
	vim.opt.showmode = false
end

return Plugin
