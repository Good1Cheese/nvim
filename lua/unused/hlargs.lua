return {
	"m-demare/hlargs.nvim",
	-- event = "VeryLazy",
	config = function()
		require("hlargs").setup({
			color = "#de5d68",
			use_colorpalette = false,
		})
	end,
}
