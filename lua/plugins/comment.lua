local Plugin = { "numToStr/Comment.nvim" }

Plugin.dependencies = {
    { "JoosepAlviste/nvim-ts-context-commentstring" },
}

-- Plugin.lazy = false
Plugin.event = { "BufReadPre", "BufNewFile" }

function Plugin.config()
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

return Plugin
