return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	-- event = "VeryLazy",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	config = function()
		require("barbecue").setup()

		local opts = {
			noremap = true, -- non-recursive
			silent = true, -- do not show message
		}

		vim.api.nvim_set_keymap(
			"n",
			"<C-S-k>",
			[[:lua pcall(function() require("barbecue.ui").navigate(-1) end)<cr>]],
			opts
		)
	end,
}
