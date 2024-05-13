return {
	"Good1Cheese/xkbswitch.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("xkbswitch").setup()
	end,
}
