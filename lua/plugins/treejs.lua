return {
	"Wansmer/treesj",
	-- event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("treesj").setup({})

		vim.keymap.set("n", "gJ", require("treesj").join)
		vim.keymap.set("n", "gS", require("treesj").split)
	end,
}
