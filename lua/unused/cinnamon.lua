return {
	"declancm/cinnamon.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("cinnamon").setup()
	end,
}
