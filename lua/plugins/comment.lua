return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<A-/>",
			},
			opleader = {
				line = "<A-/>",
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end
}
