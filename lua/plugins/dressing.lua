return {
	"stevearc/dressing.nvim",
	config = function()
		require("dressing").setup({
			input = {
				min_width = { 60, 0.9 },
			},
			select = {
				telescope = require("telescope.themes").get_dropdown({
					layout_config = { height = 15, width = 90 },
				}),
			},
		})
	end,
}
