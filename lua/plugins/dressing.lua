return {
	"stevearc/dressing.nvim",
	config = function()
		require("dressing").setup({
			input = {
				min_width = { 60, 0.9 },
			},
			select = {},
		})
	end,
}
