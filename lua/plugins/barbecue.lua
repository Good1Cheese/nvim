return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	-- event = "VeryLazy",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	opts = {},
}
