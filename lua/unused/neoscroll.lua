return {
	"karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("neoscroll").setup({})
	end,
}
