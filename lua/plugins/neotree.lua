local Plugin = { "nvim-neo-tree/neo-tree.nvim" }

Plugin.dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",
	-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
}

Plugin.cmd = "Neotree"

Plugin.opts = {
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
	window = {
		position = "right",
		mappings = {
			["<space>"] = "none",
			["H"] = "none",
			["l"] = "open",
		},
	},
}

return Plugin
