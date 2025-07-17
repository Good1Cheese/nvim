return {
	dir = "~/Projects/ui-test",
	config = function()
		require("ui-test").setup()

		local which_key = require("which-key")
		which_key.add({
			{ "<leader>I", ":Lazy reload ui-test<cr>:UITest<cr>" },
		})
	end,
	event = "VimEnter",
}
