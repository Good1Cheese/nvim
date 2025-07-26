vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.axaml" },
	callback = function(event)
		vim.lsp.start {
			name = "avalonia",
			cmd = { "avalonia-ls" },
			root_dir = vim.fn.getcwd(),
		}
	end
})

vim.api.nvim_create_autocmd("BufRead", {
	desc = "set filetype xml for extension .axaml",
	pattern = "*.axaml",
	callback = function()
		vim.bo.filetype = "xml"
	end,
})

vim.filetype.add({
	extension = {
		axaml = "xml",
	},
})
