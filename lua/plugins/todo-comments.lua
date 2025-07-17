return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/trouble.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("todo-comments").setup({})
	end,
}
