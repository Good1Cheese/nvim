local Plugin = { "kevinhwang91/nvim-ufo" }

Plugin.dependencies = "kevinhwang91/promise-async"

Plugin.event = "VeryLazy"

function Plugin.config()
	require("ufo").setup({
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	})

	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
	vim.keymap.set("n", "zK", function()
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end)
end

return Plugin
