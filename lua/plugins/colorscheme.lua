local Plugin = { "Shatur/neovim-ayu" }

Plugin.dependencies = {
	-- { "olimorris/onedarkpro.nvim" },
	-- { "arturgoms/moonbow.nvim" },
	-- { "nyoom-engineering/oxocarbon.nvim" },
	-- { "samharju/synthweave.nvim" },
	{ "scottmckendry/cyberdream.nvim" },
	-- { "javiorfo/nvim-nyctophilia" },
	-- { "rebelot/kanagawa.nvim" },
	-- { "rose-pine/neovim", name = "rose-pine" },
}

Plugin.priority = 1000
Plugin.lazy = false

function Plugin.config()
	-- vim.opt.background = "dark"
	vim.cmd.colorscheme("ayu")
	-- vim.cmd.colorscheme("cyberdream")
	-- require("kanagawa").load("dragon")
	-- vim.cmd.colorscheme("tenebra")

	-- vim.cmd.colorscheme("oxocarbon")
	-- vim.cmd.colorscheme("rose-pine")
	-- vim.cmd.colorscheme("synthweave")
	-- vim.cmd.colorscheme("synthweave-transparent")


	require("cyberdream").setup({
		-- Set light or dark variant
		variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

		-- Enable transparent background
		transparent = false,

		-- Reduce the overall saturation of colours for a more muted look
		saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

		-- Enable italics comments
		italic_comments = false,

		-- Replace all fillchars with ' ' for the ultimate clean look
		hide_fillchars = false,

		-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
		borderless_pickers = false,

		-- Set terminal colors used in `:terminal`
		terminal_colors = true,

		-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
		cache = false,

		-- Override highlight groups with your own colour values
		-- Override colors for both light and dark variants
		-- Disable or enable colorscheme extensions
		extensions = {
			telescope = true,
			notify = true,
			mini = true,
		},
	})
end

return Plugin
