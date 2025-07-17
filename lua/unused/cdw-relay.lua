return {
	dir = "~/Projects/codewars-relay",
	event = "VimEnter",
	config = function()
		vim.cmd("UpdateRemotePlugins")

		-- require("codewars-relay").setup()
		-- local which_key = require("which-key")
		-- which_key.add({
		-- 	{ "<leader>I", ":Lazy reload ui-test<cr>:UITest<cr>" },
		-- })
	end,
}
